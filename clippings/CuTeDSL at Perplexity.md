---
title: "CuTeDSL at Perplexity"
source: "https://research.perplexity.ai/articles/cutedsl-at-perplexity"
author:
  - "Perplexity Research"
published: 2026-05-06
created: 2026-05-11
description: "Perplexity 介绍其内部推理引擎 ROSE 如何采用 NVIDIA CuTeDSL 编写和优化 GPU kernels，以更快适配新模型架构并提升推理性能。"
tags:
  - "clippings"
  - "inference"
  - "systems"
  - "perplexity"
  - "gpu"
---

# CuTeDSL at Perplexity

## 原文信息

- 原文：<https://research.perplexity.ai/articles/cutedsl-at-perplexity>
- 发布时间：2026-05-06
- 发布方：Perplexity Research

## 核心提取

Perplexity 的核心问题不是“能不能跑模型”，而是如何在新模型架构快速变化时，把 embeddings、ranking、classification、LLM decoding、MoE 等不同 workload 快速部署到生产，并持续接近 GPU 峰值性能。

他们内部使用 ROSE（Runtime-Optimized Serving Engine）作为统一推理引擎，服务 Sonar、Search、Embeddings 等 API。ROSE 的设计目标是保持引擎接口稳定，同时让底层模型、kernel、并行通信和部署形态可以快速变化。

这篇文章的重点是：Perplexity 为什么从 Triton/CUDA 等方案迁移到 NVIDIA CuTeDSL，并如何用它优化 RMS norm、MoE dispatch/combine 等 inference kernels。

## 中文译读

### 一、ROSE 是 Perplexity 的推理底座

Perplexity 的自定义模型部署在 NVIDIA Hopper 和 Blackwell GPU 上，由内部 AI Inference 团队构建的 ROSE 引擎承载。

ROSE 最初是为了服务定制化 Llama 模型，后来扩展为完整推理引擎，覆盖大语言模型、embedding、ranking、classification、scoring 等多类 transformer workload。

它的重点不只是执行模型，而是负责 request scheduling、batching、token decoding、KV storage、prefix matching、device 初始化、通信通道、权重加载等一整套运行时工作。

这和 [[The Anatomy of an Agent Harness]] 里讨论的思路相似：模型能力之外，真正的产品性能来自模型周围的系统工程。

### 二、为什么选择 CuTeDSL

文章认为，很多 inference kernel 的数学本身并不复杂，难点在于如何让硬件以最合适的方式执行它。

Perplexity 需要一种语言，既能表达高层计算，又能保留对底层硬件 primitive 的控制，还要能在庞大的配置空间里快速 specialization。

他们选择 CuTeDSL 的原因包括：

- 基于 Python，开发迭代比 CUDA/C++ template 轻。
- JIT 编译可以避免预编译整个配置空间。
- 能使用 CuTe layout algebra 和 MLIR，同时 lower 到高效 PTX。
- 比高层编译器更容易触达硬件细节。
- 在错误定位和调试上比复杂 CUDA template 更直接。

关键点不是“CuTeDSL 更高级”，而是它在抽象和控制之间取得了 Perplexity 需要的平衡。

### 三、推理优化不是一个 kernel 打天下

文章反复强调 prefill 和 decode 的差异。

Prefill 通常是少量 sequence、大量 token，目标是吞吐最大化；decode 则是单 token 或少量 token 的连续生成，延迟接近 kernel launch latency，瓶颈更偏 memory bandwidth 和 launch overhead。

因此，同一个算子在不同阶段可能需要不同实现：block/grid 配置、warps 数量、同步策略、是否拆 kernel、是否使用 grid barrier，都需要根据 workload 判断。

这对公众号文章很有价值，因为它能解释一个常被忽略的问题：**AI 推理成本不是只由模型大小决定，还由 workload 形态和底层 kernel 工程决定。**

### 四、MoE 让通信和 routing 成为核心性能问题

Perplexity 在文章中专门讨论了 MoE dispatch/combine。

MoE 模型需要把 token 路由到不同专家，再把结果聚合回来。不同部署形态下，token 可能只在单卡内移动，也可能跨 tensor parallel、data parallel、NVLink、InfiniBand 移动。

这意味着 MoE 性能不只是 GEMM 的问题，还是 token routing、通信拓扑、跨设备同步和 memory layout 的问题。

从 [[Decoding DeepSeek-V4]] 到这篇文章，可以看到一个连续趋势：模型架构越来越依赖 MoE 和长上下文，推理系统就必须在 routing、通信、cache、kernel specialization 上投入更多工程。

## 可复用观点

- 推理系统的竞争力来自“快速适配新架构 + 接近硬件峰值性能”的组合。
- 新模型架构越多，compile-time specialization 和 JIT 缓存越重要。
- Prefill 与 decode 是两种不同 workload，不能只用平均吞吐来理解推理性能。
- MoE 的成本不只在专家计算，还在 token dispatch/combine 和跨设备通信。
- AI 应用的成本战争会越来越像系统工程战争，而不只是模型价格战。

## 可加工为公众号角度

### 角度 1：Perplexity 为什么要自己做推理引擎

从 ROSE 切入，讲 AI 搜索公司为什么要掌握 inference runtime，而不是只调用外部模型 API。

### 角度 2：Token 成本背后的 GPU kernel 战争

结合 [[Token计算：下一个十年的成本战争]] 和 [[Why CPUs matter for agentic AI]]，讲推理成本如何从 token 价格深入到 cache、kernel、通信、硬件利用率。

### 角度 3：MoE 模型时代，系统工程重新变成护城河

把 [[Decoding DeepSeek-V4]] 的模型架构讨论和这篇的推理系统讨论连接起来。

## 关联笔记

- 已加工成稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- 模型架构：[[Decoding DeepSeek-V4]]
- 成本与基础设施：[[Token计算：下一个十年的成本战争]]、[[Why CPUs matter for agentic AI]]
- Agent 工程底座：[[The Anatomy of an Agent Harness]]
- 同源 Perplexity：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
