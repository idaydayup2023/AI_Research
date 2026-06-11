---
title: "LongDS-Bench: On the Failure of Long-Horizon Agentic Data Analysis"
source: "https://arxiv.org/abs/2605.30434"
arxiv_id: "2605.30434"
authors:
  - "Kewei Xu"
  - "Xiaoben Lu"
  - "Shuofei Qiao"
  - "Zihan Ding"
  - "Haoming Xu"
  - "Lei Liang"
  - "Ningyu Zhang"
submitted: 2026-05-28
created: 2026-06-02
categories:
  - "cs.LG"
  - "cs.AI"
  - "cs.CL"
  - "cs.MA"
description: "LongDS 用真实 Kaggle notebooks 构造 68 个长程多轮数据分析任务，测试 agent 是否能维护、更新、恢复和组合分析状态；更多步骤不一定改善结果。"
tags:
  - "clippings"
  - "arxiv"
  - "long-horizon-agents"
  - "agent-evaluation"
  - "data-analysis"
  - "state-management"
---

# LongDS-Bench: On the Failure of Long-Horizon Agentic Data Analysis

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30434>
- 提交时间：2026-05-28（v1）
- 作者：Kewei Xu, Xiaoben Lu, Shuofei Qiao, Zihan Ding, Haoming Xu, Lei Liang, Ningyu Zhang
- 分类：cs.LG / cs.AI / cs.CL / cs.MA

## 研究问题

真实数据分析不是一次性问答，而是多轮迭代：假设会变、图表会改、变量会复用、状态会回滚、多个分析分支需要组合。现有 benchmark 多测短任务或孤立交互，无法检验 agent 是否能长期维护分析状态。

LongDS 要测的是 agent 在长程数据分析中维护、更新、恢复和组合 evolving analytical states 的能力。

## 方法概览

LongDS 从真实 Kaggle notebooks 构造 68 个长程多轮数据分析任务，共 2,225 turns，覆盖 Geoscience、Business、Education 等六个领域。任务围绕状态演化模式设计，例如：

- counterfactual perturbation；
- rollback；
- multi-state composition。

摘要报告平均 dependency span 为 11.3 turns。作者评估 5 个当前模型，最好模型平均 accuracy 只有 48.45%；从 early turns 到 late turns，表现下降近 47 个百分点；长程错误占 52% 到 69% 的失败。

更关键的是，额外 agent steps 不一定提升表现，说明瓶颈不是互动预算不足，而是 analytical state 维护错误。

## 关键贡献

- 把 data analysis agent 的评测从单步问答推进到长程状态管理。
- 用真实 notebook 构造任务，贴近分析工作流中的分支、回滚和组合。
- 提供一个强反例：更多步骤、更多互动不一定解决长程失败。
- 把“分析状态”定义成 agent 可靠性的核心对象，而不是把所有问题归因到上下文长度。

## 与知识库主题的关系

这篇补强 [[2026-05-28 Agent 上线后，也会变老]]、[[When Should Models Change Their Minds Contextual Belief Management in Large Language Models]] 和 [[Learning Agent-Compatible Context Management for Long-Horizon Tasks]]。

LongDS 的价值在于把“状态维护”放进具体工作流。对产品/工程读者来说，数据分析 agent 的失败常不是不会写代码，而是忘了当前分析口径、错误复用旧变量、回滚后又把旧状态混回来。

## 可复用观点

- 长程 agent 失败的核心对象常常是 state，而不是步骤数量。
- 对数据分析类 AI，必须评测 rollback、branch composition 和 dependency span。
- “让 agent 多试几步”可能扩大状态污染，不能替代状态管理。
- 企业内部可以从 notebook、BI 分析记录、实验日志中构造类似 LongDS 的 workflow eval。

## 可加工为公众号角度

- 可成稿方向：`数据分析 Agent 最怕的不是算错，而是状态乱了`。
- 可合并素材：[[Learning Agent-Compatible Context Management for Long-Horizon Tasks]]、[[When Should Models Change Their Minds Contextual Belief Management in Large Language Models]]、[[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]。

目前暂不单独成稿：它是“长程状态管理”的强案例，但单篇写容易变成 benchmark 摘要。适合与 AdaCoM、TraceGraph 合并，写“长任务 agent 的关键不是更长上下文，而是状态治理”。

## 关联笔记

- [[Learning Agent-Compatible Context Management for Long-Horizon Tasks]]
- [[When Should Models Change Their Minds Contextual Belief Management in Large Language Models]]
- [[2026-05-28 Agent 上线后，也会变老]]
- [[Conformal Certification of Reasoning Trace Prefixes]]
- [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]
- 已加工成稿：[[2026-06-02 Agent 的接口，不该只有工具调用]]
