---
title: "Hosting Qwen on Blackwell"
source: "https://research.perplexity.ai/articles/hosting-qwen-on-blackwell"
author:
  - "[[@perplexity_ai]]"
published: 2026-05-12
created: 2026-05-13
description: "Perplexity 公开其在 NVIDIA GB200 NVL72（Blackwell）上部署 Qwen3 235B MoE 的推理架构：prefill/decode 解耦、并行与分片策略、NVLink/InfiniBand 通信、SHARP all-reduce、MTP speculative decoding 与 MXFP8 量化。"
tags:
  - "clippings"
  - "perplexity"
  - "inference-serving"
  - "cost-optimization"
  - "gpu-systems"
  - "blackwell"
  - "moe"
---

# Hosting Qwen on Blackwell

## 原文信息

- 原文：<https://research.perplexity.ai/articles/hosting-qwen-on-blackwell>
- 发布时间：2026-05-12
- 发布方：Perplexity Research

## 核心提取

这篇文章价值不在“换了更快的 GPU”，而在于**面向 MoE 大模型的端到端推理系统设计**：把 prefill 与 decode 解耦、在不同阶段用不同并行策略，把 NVLink 当成“机内/机柜内的主干网”，把 InfiniBand 当成“prefill→decode 的跨域传输网”，最终目标是：**在不牺牲解码速度下把吞吐拉高，并把单位 token 成本压下去**。

文章给了很多可以直接迁移的工程要点：KV cache 的内存布局、prefill/decoder 的分片取舍、all-reduce 与 MoE dispatch/combine 的 kernel 级优化、量化格式选择、以及“性能-工程复杂度”之间怎么做真实权衡。

## 中文译读

### 1) 系统分层：prefill / decode 解耦

- **Prefiller**：吃输入 tokens，批量算 attention/MLP，产出 KV cache；计算更重、适合更强并行。
- **Decoder**：拿 KV cache 做逐 token 生成；更偏内存带宽瓶颈，追求高并发吞吐，同时控制最低解码速率。
- 两者之间通过 InfiniBand 传输 KV cache；机内/机柜内的权重与 MoE 通信尽量走 NVLink。

### 2) 并行策略：prefill 更“算力并行”，decode 更“请求并行”

- Prefill 使用 **tensor parallel + expert parallel**（文中示例：TP=4, EP=4），集中在单个 GB200 节点的 4 张 GPU 内做更高效的 all-reduce 与通信。
- Decode 则倾向 **data parallel + expert parallel**：每个设备维护自己的 KV cache 与请求队列，通过更大的并发 batch 提升 MoE 层的密度，但避免把 attention head 再拆得过细导致并行收益下降。
- Blackwell 的“大 NVLink 域”让 decode 可以把 EP 扩到 **16 devices**（跨多个节点但仍在 NVLink domain 内），在端到端上更划算。

### 3) KV cache 传输与布局：让“跨分片”可变换

- 他们的 TransferEngine 支持 prefill 与 decode 端**分片不必一致**。
- KV cache 采用 HND（heads-leading，tokens contiguous）的布局，使得**在传输过程中**可以把一个 prefiller 上的 sharded KV 做进一步 split/concat，匹配 decoder 的分片方案。

### 4) 通信与 kernel：SHARP + NVLink，做更“硬件友好”的规约

- Prefill 中 attention 输出投影需要 all-reduce；在 NVLink Switch 上用 **SHARP** 能把规约工作下沉到交换芯片，降低 GPU↔switch 的交易次数，文中报告可带来约 **10%** 的 prefill 与 decode latency 改善（在 H200 与 GB200 上都观察到）。
- MoE 的 dispatch/combine kernel 也根据 prefill 与 decode 的差异进行专门化，并把更多实现迁移到内部的 CuTeDSL 代码路径上。

### 5) 吞吐：MTP speculative decoding + 量化格式选择

- Decode 侧继续使用他们自训的 **MTP（multi-token prediction）层**做 speculative decoding，加速实际 token 产出。
- 在量化上，Qwen3 235B 采用 **MXFP8** 静态转换权重；MXFP4/NVFP4 目前在没有 QAT 的情况下精度损失太大，先不作为初期迁移方案。

## 可复用观点

- **架构先于模型**：同一个模型族，prefill/decode 解耦 + 分片策略 + cache/通信布局往往比“再换一个模型”更能决定成本曲线。
- **把并行策略按阶段拆开**：prefill 与 decode 的瓶颈不一样，强行统一并行方式会在任一侧都吃亏。
- **“NVLink 域”是新边界条件**：当 NVLink 域从 8 卡扩展到更大规模后，之前被网络延迟否掉的方案（更宽的 EP、跨节点 NVLink all-to-all）会重新变得划算。
- **能迁移的不是参数**：TP/EP 的具体数字可变，但“以端到端延迟/吞吐为目标做 trade-off”的方法论可复用。

## 可加工为公众号角度

- Blackwell 时代的推理工程：为什么“prefill/decode 解耦 + 传输层设计”比“换更大 GPU”更关键？
- MoE serving 的真实难点：不是跑起来，而是把通信、cache、并行、量化做成一个能长期压成本的系统。

## 关联笔记

- 可补充旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]、[[Token计算：下一个十年的成本战争]]
- Perplexity 推理工程脉络：[[CuTeDSL at Perplexity]]、[[Lessons from building Claude Code Prompt caching is everything]]
- 相关基础设施讨论：[[Why CPUs matter for agentic AI]]

