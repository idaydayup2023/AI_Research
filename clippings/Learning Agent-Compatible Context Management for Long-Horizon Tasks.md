---
title: "Learning Agent-Compatible Context Management for Long-Horizon Tasks"
source: "https://arxiv.org/abs/2605.30785"
arxiv_id: "2605.30785"
authors:
  - "Lu Yi"
  - "Runlin Lei"
  - "Liuyi Yao"
  - "Yuexiang Xie"
  - "Yuyang Li"
  - "Wenhao Zhang"
  - "Zhewei Wei"
  - "Yaliang Li"
  - "Jian-Yun Nie"
submitted: 2026-05-29
created: 2026-06-02
categories:
  - "cs.AI"
description: "提出 AdaCoM：训练外部 LLM 为冻结 agent 管理上下文；不同能力 agent 需要不同保真度/压缩强度，形成 Fidelity-Reliability Trade-off。"
tags:
  - "clippings"
  - "arxiv"
  - "context-engineering"
  - "long-horizon-agents"
  - "agent-harness"
  - "deep-research"
---

# Learning Agent-Compatible Context Management for Long-Horizon Tasks

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30785>
- 提交时间：2026-05-29（v1）
- 作者：Lu Yi, Runlin Lei, Liuyi Yao, Yuexiang Xie, Yuyang Li, Wenhao Zhang, Zhewei Wei, Yaliang Li, Jian-Yun Nie
- 分类：cs.AI

## 研究问题

长程 web search 和 deep research 任务会不断积累上下文。上下文过长后，agent 容易出现 long-context degradation：忘记任务约束、混淆进度、保留过时内容、在冗余材料里推理失败。

已有方案通常依赖 agent 自己管理上下文，或使用固定 summarization 策略。但闭源 agent 未必能训练，固定策略也忽略了一个问题：不同能力、不同风格的 agent 需要不同的上下文管理方式。

## 方法概览

论文提出 Adaptive Context Management（AdaCoM）：训练一个外部 LLM，通过 flexible modification actions 为冻结的 agent 管理上下文，并用端到端 reinforcement learning 优化最终任务表现。

AdaCoM 的目标不是一味压缩，而是在保留任务约束和进度的同时剪除 stale content。论文在 web search 和 deep research benchmarks 上测试多个 agent，摘要报告 AdaCoM 能显著提升表现。

一个关键发现是 Fidelity-Reliability Trade-off：

- vanilla ReAct 表现较强的 agent，更受益于高保真上下文保留；
- 表现较弱的 agent，反而需要更激进压缩，以留在可靠推理区间；
- AdaCoM 跨 agent 迁移时，最适合迁移到基础能力相近的 agent。

## 关键贡献

- 把 context management 从固定压缩策略，改成 agent-compatible 的可学习外部策略。
- 明确上下文保真度和推理可靠性之间存在 trade-off，不同 agent 不能套同一压缩口径。
- 给闭源 agent 提供一条现实路径：不改 agent 本体，训练外部 context manager。
- 把 context engineering 的评估目标从“压了多少 token”提升到“是否帮助目标 agent 完成任务”。

## 与知识库主题的关系

这篇补强 [[Query-Aware Context Compression for Better Snippets]] 和 [[2026-05-28 Agent 上线后，也会变老]]。

Query-Aware Compression 关注 evidence density；AdaCoM 关注长程任务里的 agent compatibility。两者合在一起说明：上下文压缩不是通用清洗，而是要服务于某个 agent 的能力边界、任务阶段和失败模式。

它也与 [[Rethinking Search as Code Generation]] 形成组合：Search as Code 把检索中间状态留在 deterministic runtime，AdaCoM 则决定哪些状态要进入模型上下文。

## 可复用观点

- Context engineering 不应只问“保留多少”，还要问“给哪个 agent 用”。
- 弱 agent 可能需要更少但更稳定的上下文；强 agent 才能吃下更高保真材料。
- 外部 context manager 是一种实用 harness 层：不改模型，也能改善长程任务。
- 压缩策略需要以任务成功和错误类型为反馈，而不只是 token ratio。

## 可加工为公众号角度

- 可成稿方向：`上下文不是越完整越好，而是要适配执行者`。
- 可合并素材：[[Rethinking Search as Code Generation]]、[[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]、[[LongDS-Bench On the Failure of Long-Horizon Agentic Data Analysis]]。

目前暂不单独成稿：它提供了强观点，但与近期香港“预算/反馈/reharnessing”主题相邻。若成稿，应从“不同 agent 需要不同上下文保真度”切入，而不是重复“长上下文不是记忆”。

## 关联笔记

- [[Query-Aware Context Compression for Better Snippets]]
- [[2026-05-28 Agent 上线后，也会变老]]
- [[Rethinking Search as Code Generation]]
- [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]
- [[Thinking as Compression Your Reasoning Model is Secretly a Context Compressor]]
- 已加工成稿：[[2026-06-02 Agent 的接口，不该只有工具调用]]
