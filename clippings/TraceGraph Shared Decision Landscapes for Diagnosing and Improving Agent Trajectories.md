---
title: "TraceGraph: Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories"
source: "https://arxiv.org/abs/2605.31308"
arxiv_id: "2605.31308"
authors:
  - "Junjie Nian"
  - "Kang Chen"
  - "Ge Zhang"
  - "Yixin Cao"
  - "Yugang Jiang"
submitted: 2026-05-29
created: 2026-06-02
categories:
  - "cs.AI"
description: "把多模型 agent 轨迹汇聚成 shared decision landscapes，标出 productive cores、trap regions、Access/Trap/Repair 事件，用于诊断模型差异和触发恢复策略。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evaluation"
  - "execution-trace"
  - "coding-agents"
  - "shared-state"
---

# TraceGraph: Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.31308>
- 提交时间：2026-05-29（v1）
- 作者：Junjie Nian, Kang Chen, Ge Zhang, Yixin Cao, Yugang Jiang
- 分类：cs.AI

## 研究问题

Agent benchmark 现在越来越多地记录完整交互轨迹，但评测仍常把轨迹压成 pass rate 或 reward score。这样会丢掉真正有诊断价值的问题：

- 不同模型是否走到了同一类关键状态？
- 失败是因为没进入 productive core，还是掉进 trap region？
- 模型有无从 trap 中 repair 的能力？
- benchmark 到底奖励避坑，还是奖励从坑里恢复？

## 方法概览

TraceGraph 把多个模型在同一任务上的 action-observation states 池化，先不引入模型身份，构造共享决策图。随后在图上叠加 outcome-informed 的 productive cores 和 trap regions，并用三个事件总结每条 rollout：

- Access：是否进入 productive core；
- Trap exposure：是否暴露在历史失败区域；
- Repair：是否从 trap 中恢复。

论文还把这种 landscape 用于 SWE-bench 的 trap-aware recovery：运行时 detector 在进入历史 trap 区域时触发，再从同一 prefix 评估轻量 continuation policies。摘要报告 fired subset 上 resolved rate 从 40.4% 到 43.5%，common-fired instances 从 41.0% 到 44.8%。

## 关键贡献

- 把 agent 轨迹从“单次故事”变成可比较的共享决策地图。
- 提供 Access / Trap / Repair 三个比 pass rate 更细的过程指标。
- 说明 benchmark split 的差异可能不是难度本身，而是奖励避坑或修复的方式不同。
- 把历史轨迹直接转化为 runtime recovery 的触发条件。

## 与知识库主题的关系

这篇直接补强“共享证据地图”和“反馈资产”主线。[[2026-05-30 别让 Agent 白白烧掉反馈]] 强调昂贵 agent run 要沉淀中间判断和失败路径；TraceGraph 给出一种更具体的沉淀方式：把多模型、多次运行的状态压成共享 landscape，再让后续 agent 在接近 trap 时触发恢复策略。

它也与 [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]] 互补：Shepherd 解决 trace/fork/replay 的 runtime substrate，TraceGraph 解决如何从历史 traces 中抽象出过程诊断地图。

## 可复用观点

- Agent 评测不能只看终局分数，要看它在共享决策地图上走到了哪里。
- 失败轨迹不是垃圾数据；历史 trap region 可以变成运行时预警器。
- 多模型对比最有价值的不是谁分高，而是谁绕开了哪些 trap、谁能 repair。
- 并行 agent 的共享状态不应只是“谁搜过什么”，还应包括“哪些状态已被证明危险”。

## 可加工为公众号角度

- 可成稿方向：`别只看 Agent 成败，要看它踩过哪些坑`。
- 可合并素材：[[Conformal Certification of Reasoning Trace Prefixes]]、[[Review Arcade On the Human Alignment and Gameability of LLM Reviews]]、[[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]。

目前暂不单独成稿：它与“反馈资产”和“质量门”相邻，但提供了新机制。更适合与 Search as Code、AdaCoM 合并为一篇“agent 长任务需要共享中间状态，而不是只要更长上下文”的观点稿。

## 关联笔记

- [[2026-05-30 别让 Agent 白白烧掉反馈]]
- [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- [[Conformal Certification of Reasoning Trace Prefixes]]
- [[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]
- [[Review Arcade On the Human Alignment and Gameability of LLM Reviews]]
- 已加工成稿：[[2026-06-02 Agent 的接口，不该只有工具调用]]
