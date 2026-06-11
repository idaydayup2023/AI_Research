---
title: "Query-Aware Context Compression for Better Snippets"
source: "https://research.perplexity.ai/articles/query-aware-context-compression-for-better-snippets"
author: "Perplexity Research"
published: 2026-05-14
created: 2026-05-28
description: "Perplexity 将 snippet generation 定义为 query-aware extractive context compression：保留可引用证据，剔除 UI、广告、metadata 和离题内容，在 BrowseComp / SimpleQA 上同时改善准确率、token 使用和延迟。"
tags:
  - "clippings"
  - "perplexity"
  - "context-engineering"
  - "rag"
  - "search-agents"
  - "cost-optimization"
---

# Query-Aware Context Compression for Better Snippets

## 原文信息

- 来源：Perplexity Research
- 链接：<https://research.perplexity.ai/articles/query-aware-context-compression-for-better-snippets>
- 发布时间：2026-05-14
- 主题：query-aware context compression、snippet generation、search agents、成本与延迟优化

## 核心提取

Perplexity 把 snippet generation 重新定义为 context compression：不是给网页写摘要，而是在 query 和 candidate result 的联合语境下，选择哪些原文 span 应该保留，哪些 distractor 应该删除。

它的目标不是“更短”，而是同时改善三个指标：

- accuracy：减少无关内容造成的 context rot；
- latency：减少下游模型处理和 reasoning token 消耗；
- cost：减少输入 token 与被噪声诱发的额外推理。

关键设计是 extractive compression：保留原文 span，不生成改写摘要。这样更适合作为 evidence layer，因为它更容易引用、验证和回链。

## 中文译读

这篇文章最值得迁移的观点是：**上下文不是越多越好，而是越贴近问题越好。**

Perplexity 的 compressor 使用 bidirectional encoder 理解 query-context pair，再用轻量 compression head 预测哪些句子或 span 应被保留。训练数据来自 LLM-as-a-judge 的 span labeling pipeline：先做 query understanding，拆出可能用户意图，再从候选网页中标注与意图相关的原文 span。

为了进入在线路径，模型必须足够快。Perplexity 对 28-layer backbone 做 layer pruning 和 token-level distillation，最终使用 distilled 17-layer 模型，在生产中达到 p99 低于 20ms，并降低 compression model 自身的延迟与 GPU compute。

端到端评测上，文章报告在 BrowseComp 的 agentic multi-step search 中，compression 让 query-level token usage 下降 10% 到 70%，同时准确率提升约 4 到 4.81 个百分点；在 SimpleQA 单步检索中也改善 accuracy-token frontier。

## 可复用观点

- Context engineering 的第一步不是扩上下文，而是提高 evidence density。
- “摘要”不一定适合作为证据层，因为摘要可能改写、混入新措辞，降低 citation fidelity。
- 对 agentic workflow，压缩不只是省 token：更干净的 evidence 可能让 agent 少走步骤，反而改变整个任务轨迹。
- 高质量 context compression 需要同时评估局部 token 分类和端到端任务表现，不能只看压缩率。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]，作为“证据层要保留原文可核验片段”的基础设施案例。
- 可合并成稿：Agent 寿命管理中的 compression aging，需要反过来要求 context compression 有证据密度和保真度。

## 关联笔记

- 已加工成稿：[[2026-05-28 Agent 上线后，也会变老]]
- [[Advancing Search-Augmented Language Models]]
- [[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]]
- [[Gemini API File Search is now multimodal build efficient verifiable RAG]]
- [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]
