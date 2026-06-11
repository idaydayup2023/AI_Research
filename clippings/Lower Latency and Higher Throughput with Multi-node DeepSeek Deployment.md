---
title: "Lower Latency and Higher Throughput with Multi-node DeepSeek Deployment"
source: "Perplexity Research"
author: ""
published: "2025-04-18"
created: "2026-05-15"
description: "Multi-GPU deployment boosts MoE model performance on both speed and scale fronts simultaneously"
tags:
  - agent-infra
  - inference
  - serving
  - moe
  - throughput
  - latency
  - communication
  - speculative-decoding
---

## 原文信息

- 标题：Lower Latency and Higher Throughput with Multi-node DeepSeek Deployment
- 来源：Perplexity Research
- 链接：https://research.perplexity.ai/articles/lower-latency-and-higher-throughput-with-multi-node-deepseek-deployment
- 文章页显示日期：Apr 18, 2025

## 核心提取（我认为最可复用的点）

- **MoE 在多机多卡上“更快且更大”并非矛盾**：把 experts 分摊到更多 GPU 后，单卡的内存带宽压力下降，从而在同等输出速度下获得更高吞吐，并在某些配置下同时改善端到端延迟。
- **关键不在“多加机器”，而在“把通信当成第一等公民”**：通过计算-通信重叠（如 micro-batching）压缩跨节点通信开销，并配合定制 AllToAll/Kernel 才能把系统推到可用区间。
- **Prefill/Decode 的资源竞争是吞吐杀手**：当 Prefill 与 Decode 共享 GPU 时，任何 DP 组做 Prefill 都可能抬高所有 GPU 的 MoE 层延迟；这会直接拖慢输出速度，逼迫你做 Prefill 解耦（disaggregation）与更细粒度的调度策略。
- **“还有哪些可继续榨”的优化清单**：继续把 AllToAll 带宽推上去、引入更强的 speculative decoding（文中提到 EAGLE-style 多 token 预测）、以及让 GEMM kernel 更接近 roofline 上限——这类清单对做推理平台的人很有参考价值。

## 中文译读（结构化转述 + 重点翻译）

这篇文章更像是一份“推理系统工程复盘”：它想证明一件反直觉的事——对 MoE 来说，多节点扩展不一定意味着更高延迟；在合适的并行配置与通信实现下，**吞吐和延迟可以一起变好**。

文章把瓶颈归结为两类：

- **算力侧**：Prefill 与 Decode 在同一批 GPU 上争抢资源时，Prefill 会把 Decode 的尾延迟拉高，尤其在 MoE 层更明显。
- **通信侧**：AllToAll（以及更细粒度的 token dispatch/combination）如果只靠框架内置 primitive，很难把跨节点开销压到可接受水平；因此需要更专门的内核与重叠策略。

作者给出的方向不是“换更强卡”，而是把系统拆解到：并行配置（EP/DP）、流水化与 micro-batching、以及定制通信内核的组合拳。

## 可复用观点（写作/工程都能用）

- **推理工程的最小单位不再是“模型”，而是“Prefill/Decode/通信三者的竞合关系”**：你优化任意一端，都会把压力推到另外两端；没有统一口径的端到端指标（吞吐、延迟、输出速率）会很容易“优化出幻觉”。  
- **把优化建议写成“待办清单”比写结论更值钱**：文中直接列出 AllToAll、speculative decoding、GEMM、以及新硬件形态（如更大规模 NVLink 域）是下一步抓手——这是一种可迁移的复盘写法。

## 可加工为公众号角度（候选）

- 角度 A：为什么 MoE 的推理系统比 dense LLM 更像“网络工程”而不是“算力工程”
- 角度 B：Prefill/Decode 的组织方式，正在决定你能不能把 MoE 变成“可商用的成本曲线”

## 关联笔记

- [[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]
- [[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]

