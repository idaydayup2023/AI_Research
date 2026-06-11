---
title: "Unlocking dependable responses with Gemini Enterprise Agent Platform's Agentic RAG"
source: "https://research.google/blog/unlocking-dependable-responses-with-gemini-enterprise-agent-platforms-agentic-rag/"
author:
  - "Cyrus Rashtchian"
  - "Da-Cheng Juan"
published: "2026-06-05"
created: "2026-06-06"
description: "Google Research 介绍 Gemini Enterprise Agent Platform 的 Agentic RAG：用规划、查询改写、跨语料路由和 Sufficient Context Agent，把 RAG 从单次检索推进到可迭代查缺口的企业知识工作流。"
tags:
  - "clippings"
  - "google-research"
  - "agentic-rag"
  - "knowledge-layer"
  - "enterprise-ai"
  - "evaluation"
---

# Unlocking dependable responses with Gemini Enterprise Agent Platform's Agentic RAG

## 原文信息

- 原文链接：https://research.google/blog/unlocking-dependable-responses-with-gemini-enterprise-agent-platforms-agentic-rag/
- 来源：Google Research Blog
- 作者：Cyrus Rashtchian、Da-Cheng Juan
- 发布时间：2026-06-05

## 核心提取

这篇文章的重点不是“RAG 加几个 agent”，而是把企业知识问答里的失败点拆成可治理的中间环节：复杂问题先由 orchestrator 判断是否需要多步检索，再由 planner、query rewriter、search fanout 和 synthesis 分工处理。

最有价值的模块是 Sufficient Context Agent。它不只检查有没有检索结果，而是同时看原始问题、已取回 snippets、中间草稿和缺口分析，判断当前上下文是否足以生成完整回答。如果不够，它会写出具体缺口和反馈，让系统继续搜索，而不是直接猜、直接拒答或用局部证据糊一个答案。

Google 给出的实验口径是：相较标准 RAG，agentic RAG 在 factuality datasets 上最高提升 34% accuracy；在 FramesQA 的 cross-corpus 设置里，系统需要从 4 个语料中选择正确来源，仍达到 90.1% accuracy，且跨语料版本和单语料版本平均延迟差异在 3% 内。

## 中文译读

很多 RAG 系统失败，并不是因为向量库完全找不到东西，而是因为它们不知道“还差什么”。企业知识往往分散在项目文档、工单、财务系统、临床记录、会议纪要等多个数据孤岛里。一次检索命中一个片段，只能证明“找到了一块”，不能证明“足够回答整个问题”。

Agentic RAG 的关键变化，是把“缺口”变成中间产物。Sufficient Context Agent 的反馈不是泛泛地说信息不足，而是指出缺哪一类证据、应该换什么查询、可能该去哪个语料继续找。这让 RAG 从答案生成器变成一个可追踪的研究流程。

这和知识库已有的“状态外置”主题相连，但问题对象不同。状态外置关注 agent 长任务不要把运行账本塞进上下文；这篇关注的是企业 RAG 不要把“上下文是否足够”交给最后一步生成器隐式判断。前者是运行状态治理，后者是证据完整性治理。

## 可复用观点

- 企业 RAG 的可靠性不只靠更强检索器，还靠可显式记录的 missing-pieces analysis。
- 多 agent RAG 的核心不是角色越多越好，而是每个角色是否产生可审计的中间证据：计划、改写、路由、缺口、停止条件。
- “我不知道”不是唯一安全答案；有些场景下更好的动作是指出缺口并继续查找。

## 可加工为公众号角度

- 可与 [[ToolChoiceConfusion Causal Minimal Tool Filtering for Reliable LLM Agents]] 合并，写“可靠 Agent 的关键不是多暴露工具，而是每一步只暴露下一步必要能力，并明确当前缺口”。
- 可与 [[Agent Memory Characterization and System Implications of Stateful Long-Horizon Workloads]] 合并，写“知识层可靠性要分清检索成本、缺口反馈和记忆读写成本”。
- 今天暂不成稿：它和近 7 篇里的接口、状态外置、知识层治理高度相邻，需要再等 1-2 个“缺口反馈 / sufficient context”案例，避免把新材料写成旧主线的重复版本。

## 关联笔记

- [[Gemini API File Search is now multimodal build efficient verifiable RAG]]
- [[Rethinking Search as Code Generation]]
- [[Harness-1 Reinforcement Learning for Search Agents with State-Externalizing Harnesses]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]

