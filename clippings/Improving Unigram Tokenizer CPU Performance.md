---
title: "Improving Unigram Tokenizer CPU Performance"
source: "https://research.perplexity.ai/articles/improving-unigram-tokenizer-cpu-performance"
author: "Perplexity Research"
published: "2026-05-20"
created: "2026-05-30"
description: "Perplexity 复盘一次生产级 Unigram tokenizer CPU 优化：用零热路径分配、double-array trie、bitmap validity check 和 huge pages，把 reranker 前处理 CPU 成本显著压低。"
tags:
  - "clipping"
  - "ai-research"
  - "inference"
  - "model-serving"
  - "performance"
  - "cost-optimization"
---

# Improving Unigram Tokenizer CPU Performance

## 原文信息

- 原文：[Improving Unigram Tokenizer CPU Performance](https://research.perplexity.ai/articles/improving-unigram-tokenizer-cpu-performance)
- 来源：Perplexity Research
- 发布时间：2026-05-20
- 作者：Perplexity Research

## 核心提取

这篇文章值得入库，不是因为 tokenizer 本身新，而是因为它把“LLM inference 成本不只在 GPU 上”讲得很工程化。

Perplexity 的场景是 reranker、embedding、classifier 这类小模型。模型前向本身可能只有个位数毫秒，但每个请求要先把大量候选文档做 CPU-side tokenization。候选规模一上来，tokenizer 就会从“前处理细节”变成端到端延迟和 CPU 利用率的主要来源之一。

文章的主要优化路径：

- 先用 profiling 拆出 Hugging Face tokenizers crate 的热路径：per-match string allocation、hash-map children trie、fresh DP/output allocation、长输入下的 L2/L3 cache pressure。
- 再做零分配 baseline：caller-owned scratch 保存 DP 表、预处理 bytes 和 output token IDs，把 token id 和 score 直接放到 trie node，去掉每次匹配后的 string materialization 与二次 hash lookup。
- 然后把 hash-map children trie 换成 double-array trie，使每个 byte step 变成两个数组读、一个加法和一个比较，减少 pointer chasing。
- 继续用 per-node bitmap 替代 check array 做 child validity 判断，把热路径压成单 cache-line load、bit test 和 integer add。
- 最后用 2 MB huge pages 减少 trie 访问里的 TLB/page-table walk 成本。

Perplexity 报告的生产效果是：新 encoder 在生产输入长度下，p50 latency 相比 Hugging Face tokenizers crate 约 5 倍提升，相比 SentencePiece 约 2 倍提升，相比 IREE tokenizer 约 1.5 倍提升；热路径零 steady-state heap allocations；在生产 inference stack 中让前处理层 CPU 利用率下降约 5-6 倍，并给 reranker latency 省下双位数毫秒。

## 中文译读

这篇文章最重要的提醒是：推理优化不能只盯着 attention kernel、KV cache、MoE 路由和 GPU utilization。

当模型足够小、任务足够批量化时，真正拖慢请求的可能是模型前后的系统环节。reranker 就是典型例子：GPU 只负责短小前向，但 CPU 要处理上百个候选文档的 tokenization。这个环节如果有 per-token allocation、hash lookup、pointer chasing 和 cache miss，端到端 latency 就会被“非模型计算”吃掉。

它的工程方法也很值得复用：

- 不先假设算法太慢，而是先确认实现浪费在哪里。
- 不只看 wall-clock，而是同时看 instructions、IPC、cache miss、allocations 和 p50/p99。
- 不把通用库当作不可挑战的默认值。通用 API 的 offset、streaming、wrapper、FFI 和抽象层都可能在特定生产路径里变成可见成本。
- 不追求炫技式改写，而是把热路径的数据结构变成 CPU 友好的形状：连续内存、少分配、少间接跳转、可预取、cache-line 对齐。

## 可复用观点

- 推理系统的成本口径要包含“模型外成本”：tokenization、retrieval、reranking、serialization、schema validation、tool I/O、context construction 都可能成为瓶颈。
- 小模型链路里，CPU 前后处理的优化优先级会上升；GPU 快不代表请求快。
- 生产优化要从“资源账单”走向“热路径账单”：每一步到底退役多少指令、分配多少对象、打了多少 cache/TLB miss。
- 通用库适合默认起步，但高频路径最终要根据业务约束裁剪抽象。

## 可加工为公众号角度

- 角度一：`AI 推理的成本战争，不只发生在 GPU 上`。把 tokenizer、reranker、context constructor、tool gateway 串成“模型外成本层”。
- 角度二：`小模型越快，系统边角料越贵`。解释为什么 embedding/reranker/classifier 时代，CPU、内存局部性和前处理会重新成为 AI 产品体验瓶颈。
- 角度三：`别只优化模型，要优化请求路径`。面向产品/工程读者，把一次 AI 请求拆成可计量的生产流水线。

## 关联笔记

- [[Token计算：下一个十年的成本战争]]
- [[New ways to balance cost and reliability in the Gemini API]]
- [[Lower Latency and Higher Throughput with Multi-node DeepSeek Deployment]]
- [[CuTeDSL at Perplexity]]
- [[pplx-embed State-of-the-Art Embedding Models for Web-Scale Retrieval]]
- [[Query-Aware Context Compression for Better Snippets]]
