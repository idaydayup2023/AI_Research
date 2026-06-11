---
title: "AgentEscapeBench: Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents"
source: "https://arxiv.org/abs/2605.07926"
arxiv_id: "2605.07926"
authors:
  - "Zhengkang Guo"
  - "Yiyang Li"
  - "Lin Qiu"
  - "Xiaohua Wang"
  - "Jingwen Xv"
  - "Dongyu Ru"
  - "Xiaoyu Li"
  - "Xiaoqing Zheng"
  - "Xuezhi Cao"
  - "Xunliang Cai"
submitted: 2026-05
created: 2026-05-12
categories:
  - "cs.AI"
description: "提出 AgentEscapeBench，用 escape-room-style benchmark 测试 LLM agents 在长依赖、多工具、OOD 工具推理中的能力边界。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evaluation"
  - "tool-use"
  - "benchmark"
---

# AgentEscapeBench: Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.07926>
- 提交时间：2026-05
- 作者：Zhengkang Guo, Yiyang Li, Lin Qiu, Xiaohua Wang, Jingwen Xv, Dongyu Ru, Xiaoyu Li, Xiaoqing Zheng, Xuezhi Cao, Xunliang Cai

## 研究问题

当前很多 Agent 能处理局部工具调用，但在需要长距离状态追踪、跨工具依赖和未知流程适应时表现会明显下降。AgentEscapeBench 用 escape-room-style tasks 测试这种能力边界。

## 方法概览

每个任务定义一个工具和物品之间的有向无环依赖图。Agent 必须调用真实外部函数，追踪逐步暴露的 hidden state，传播中间结果，并提交可确定验证的最终答案。

论文包含 270 个任务，覆盖 5 个难度层级。实验显示，随着 dependency depth 增加，人类和模型都会下降，但模型下降更明显。失败主要来自长距离状态追踪、线索遵循和中间结果传播。

## 与知识库主题的关系

这篇论文补强了 [[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]]：Agent 评估不能只看单步问答，要看长依赖、多工具、状态传播和 OOD tool-grounded reasoning。

它也对应 [[2026-05-12 Agent 不会靠提示词变可靠]] 的观点：可靠 Agent 需要更接近真实任务结构的 benchmark。

## 可复用观点

- 工具调用能力的瓶颈不是“会不会 call tool”，而是能否维护跨步骤状态。
- 长依赖和 OOD 工具流程是 Agent 评估必须覆盖的难点。
- Escape-room-style benchmark 很适合暴露 Agent 的状态跟踪和计划修正问题。
- 内容研究 Agent 也需要类似评估：能否跨来源维护证据链，而不是只回答局部问题。

## 可加工为公众号角度

- 为什么 Agent benchmark 不能只测单步工具调用。
- Deep Research 和 Tool Agent 的共同瓶颈：长距离状态追踪。
- 可与 [[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]] 合并。

## 关联笔记

- 可补充旧稿：[[2026-05-12 Agent 不会靠提示词变可靠]]
- 评估体系：[[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]]
- 多 Agent 编排：[[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]
- Tool use 与 harness：[[The Anatomy of an Agent Harness]]
