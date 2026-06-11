---
title: "Lean4Agent: Formal Modeling and Verification for Agent Workflow and Trajectory"
source: "arXiv"
arxiv_id: "2606.06523"
authors: "Ruida Wang, Jerry Huang, Pengcheng Wang, Xuanqing Liu, Luyang Kong, Tong Zhang"
published: "2026-06-02"
created: "2026-06-09"
categories: "cs.AI, cs.LG, cs.LO, cs.SE"
description: "Lean4Agent 使用 Lean4 形式化语言建模和验证 Agent workflow 与执行轨迹，为多步 Agent 行为的规格、调试和演化提供形式方法路径。"
tags:
  - "AI agents"
  - "formal verification"
  - "agent workflow"
  - "agent evaluation"
  - "coding agents"
---

# Lean4Agent

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.06523>
- 标题：Lean4Agent: Formal Modeling and Verification for Agent Workflow and Trajectory
- 作者：Ruida Wang, Jerry Huang, Pengcheng Wang, Xuanqing Liu, Luyang Kong, Tong Zhang
- 提交：2026-06-02
- 分类：cs.AI, cs.LG, cs.LO, cs.SE

## 研究问题

多步 Agent workflow 越来越复杂，但大多数系统仍缺少形式化方法来规格化、验证和调试 workflow 与执行轨迹。自然语言适合描述目标，却不适合证明语义一致性或定位轨迹失败。

## 方法概览

Lean4Agent 使用 Lean4 这个依赖类型形式语言对 Agent 行为建模。它包含：

- FormalAgentLib：用于形式化建模和验证 Agent workflow 语义一致性的 Lean4 库。
- execution-time failure localization：根据轨迹暴露执行失败位置。
- LeanEvolve：利用验证结果修改 workflow，提高后续执行能力。

实验覆盖 SWE-Bench-Verified hard subset 和 ELAIP-Bench 子集，比较多个 leading LLM。

## 关键贡献

- 将形式化验证引入 Agent workflow 和 trajectory 层，而不只是代码证明。
- 结果显示 verification-passing workflows 相比 failing workflows 平均表现更好，LeanEvolve 还能进一步提升 SWE 表现。
- 为“Agent 行为可证明/可调试”开了一个形式方法方向。

## 与知识库主题的关系

这篇论文与 [[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]、[[SpecBench Evaluating Specification-Level Reasoning for Software Engineering LLM Agents]] 和 [[2026-05-28 AI coding 的质量门，要前移到计划层]]形成一条线：质量门正在从代码结果前移到规格、workflow 和轨迹语义。

它也给 [[2026-06-03 把 Agent 的运行账本搬出上下文]]提供补充：运行账本如果要被验证，不能只是日志，还要有可检查的形式语义。

## 可复用观点

- Agent 可靠性不能只靠最终测试，还需要检查 workflow 语义是否一致。
- 执行轨迹不是事后日志，也可以成为 workflow 修复和演化的输入。
- 形式语言适合承担高风险 Agent 的“硬边界”：哪些前提成立、哪些状态转换允许、哪些失败可定位。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]、[[2026-06-03 把 Agent 的运行账本搬出上下文]]。
- 可后续成稿：`Agent 的质量门，还要前移到 workflow 语义`。暂不单独成稿，因为近期已多次写状态外置/质量门。

## 关联笔记

- [[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]
- [[SpecBench Evaluating Specification-Level Reasoning for Software Engineering LLM Agents]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]

