---
title: "Scaling Laws for Agent Harnesses via Effective Feedback Compute"
source: "https://arxiv.org/abs/2605.29682"
arxiv_id: "2605.29682"
authors:
  - "Xuanliang Zhang"
  - "Dingzirui Wang"
  - "Keyan Xu"
  - "Qingfu Zhu"
  - "Wanxiang Che"
submitted: 2026-05-28
created: 2026-05-30
categories:
  - "cs.CL"
description: "提出 Effective Feedback Compute，把 agent harness 的扩展轴从 raw tokens/tool calls 转向有效、非冗余、可保留并影响后续决策的反馈。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "agent-evals"
  - "cost-optimization"
  - "feedback"
---

# Scaling Laws for Agent Harnesses via Effective Feedback Compute

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.29682>
- 提交时间：2026-05-28（v1）
- 作者：Xuanliang Zhang, Dingzirui Wang, Keyan Xu, Qingfu Zhu, Wanxiang Che
- 分类：cs.CL

## 研究问题

Agent harness 会决定模型如何调用工具、接收反馈、验证中间状态、存储记忆和修订方案。但现有 test-time scaling 常用 raw tokens、tool calls、wall time 或 cost 来衡量扩展，无法区分有用反馈和重复、无效、未被后续利用的反馈。

## 方法概览

论文提出 Effective Feedback Compute（EFC）：一种 trace-level scaling coordinate。只有当反馈满足 informative、valid、non-redundant，并且 retained for subsequent decisions，才计入有效反馈计算。为比较不同任务，还用 task demand 做归一化。

作者在 synthetic controllable tasks、executable code tasks、real benchmark traces、held-out splits 和 prospective validation batch 上比较 EFC 与 raw-compute baselines。摘要报告中，raw tokens 和 tool calls 解释力有限，而 EFC-based coordinates 对 failure rates 的预测明显更强。

## 关键贡献

- 把 agent harness 的“扩展”从花费多少资源，改写为资源是否转化成有效反馈。
- 把 feedback quality 纳入可度量口径：有效、非冗余、可保留、能影响后续决策。
- 在 matched-budget interventions 中，保持 raw cost 和 tool calls 固定，只提升反馈质量，成功率从 0.27 提升到 0.90。
- 解释了为什么更多 tokens、更多工具调用、更多并行 agent 未必带来更好结果。

## 与知识库主题的关系

这篇是 [[2026-05-29 Agent 不该拼命干活，要学会花预算]] 的自然延伸。昨天的中心是“预算不能乱花”；这篇进一步回答“什么叫花得值”：预算只有变成可保留、可复用、能改变后续决策的反馈，才是有效 compute。

它也补充 [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]：system scaling 不能只统计执行规模，还要统计反馈是否真的进入系统状态。

## 可复用观点

- Agent 预算的核心指标不应只是 token、tool calls 和耗时，而应是有效反馈密度。
- 高 effort run 如果没有产出可复用反馈，就是一次性消耗。
- Harness 应该记录哪些反馈被采用、被丢弃、被后续决策引用。
- 评测 Agent 不应只看最终 success，也要看成功路径里有多少冗余、无效和未保留反馈。

## 可加工为公众号角度

- 新角度候选：别让 Agent 白白烧掉反馈；贵的运行必须把反馈沉淀成资产。
- 可合并素材：[[Introducing dynamic workflows in Claude Code]]、[[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]。
- 可补充旧稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]。

## 关联笔记

- [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]
- [[Thinking as Compression Your Reasoning Model is Secretly a Context Compressor]]
- [[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- 已加工成稿：[[2026-05-30 别让 Agent 白白烧掉反馈]]
- 已加工成稿：[[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
