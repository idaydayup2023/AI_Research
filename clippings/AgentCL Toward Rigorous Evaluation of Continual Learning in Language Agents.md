---
title: "AgentCL: Toward Rigorous Evaluation of Continual Learning in Language Agents"
source: "https://arxiv.org/abs/2606.02461"
arxiv_id: "2606.02461"
authors: "Yiheng Shu; Bernal Jiménez Gutiérrez; Saisri Padmaja Jonnalagedda; Yuguang Yao; Huan Sun; Yu Su"
submitted: "2026-06-01"
created: "2026-06-03"
categories:
  - "cs.AI"
  - "cs.CL"
description: "提出 AgentCL，用受控任务流和 transfer gain 指标评估语言 Agent 的 continual learning，并用 MemProbe 分析记忆设计。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "continual-learning"
  - "agent-evaluation"
---

# AgentCL: Toward Rigorous Evaluation of Continual Learning in Language Agents

## 论文信息

- arXiv：https://arxiv.org/abs/2606.02461
- 提交时间：2026-06-01
- 分类：cs.AI, cs.CL
- 作者：Yiheng Shu 等

## 研究问题

语言 Agent 在单个任务上会消耗大量推理时间，但这些任务经验往往不能在后续任务中稳定复用。现有 benchmark 要么关注长上下文检索，要么构造过于朴素的任务流，无法清楚评估 Agent 到底学到了什么、复用了什么、是否被无关经验干扰。

## 方法概览

AgentCL 使用受控任务流评估 continual learning：早期任务中的子解法、证据或 workflow 会被设计成可在后续任务中复用，并与不保证复用关系的 naive stream 对照。论文还提出 MemProbe，把 interaction、insight、skill 写入记忆，并在 consolidation 时过滤不可靠经验，用于诊断不同记忆设计的影响。

## 关键贡献

- 把 Agent continual learning 的评测对象从“长上下文里能不能找回信息”转向“跨任务能不能稳定复用经验”。
- 用 controlled task streams 和 transfer gain 评估复用能力。
- 指出 naive streams 很难区分记忆设计，甚至会暴露 memory-induced degradation。

## 与知识库主题的关系

这篇延展 [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]：复利不是记忆条数增加，而是可迁移的经验稳定复用。它也与 [[Your Agents Are Aging Too Agent Lifespan Engineering for Deployed Systems]] 相邻：错误经验写入可能带来退化和干扰。

## 可复用观点

- Agent 记忆评测必须设计“可复用关系”，否则看不出记忆系统是否真的帮助学习。
- 经验写入不是越多越好，必须过滤不可靠 episode。
- Continual learning 的核心指标不是 recall，而是 transfer gain 和 memory-induced degradation。

## 可加工为公众号角度

- 可补充“Agent 的复利，不是记住更多，而是少写错经验”。
- 可与 Harness-1、MCP-Persona 合并成“状态外置后，经验也要可评测地沉淀”。

## 关联笔记

- 已加工成稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
- [[Your Agents Are Aging Too Agent Lifespan Engineering for Deployed Systems]]
- [[Personalize-then-Store Benchmarking and Learning Personalized Memory for Long-horizon Agents]]
