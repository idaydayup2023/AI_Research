---
title: "Agentic CLEAR: Automating Multi-Level Evaluation of LLM Agents"
source: "https://arxiv.org/abs/2605.22608"
arxiv_id: "2605.22608"
authors:
  - "Asaf Yehudai"
  - "Lilach Eden"
  - "Michal Shmueli-Scheuer"
submitted: 2026-05-21
published: 2026-05-21
created: 2026-05-22
categories:
  - "cs.CL"
  - "cs.AI"
description: "提出 Agentic CLEAR，在 observability 之上为 agent traces 生成 system、trace、node 三层文本诊断，并用动态 task-specific rubrics 与聚合 insight 辅助定位重复失败模式。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evals"
  - "observability"
  - "trace-analysis"
  - "agent-harness"
---

# Agentic CLEAR: Automating Multi-Level Evaluation of LLM Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.22608>
- 提交时间：2026-05-21（v1）
- 作者：Asaf Yehudai, Lilach Eden, Michal Shmueli-Scheuer
- 分类：cs.CL / cs.AI

## 研究问题

Agent traces 越来越长，最后输出又经常掩盖中间失败。现有 observability 工具能记录轨迹，但评估层常停留在指标汇总或对完整 trace 做一次粗粒度 LLM judge；研究侧的 error taxonomy 又往往太静态，难适配不同 agent 工作流。

论文要解决的是：在不先手工写完一套错误分类的情况下，如何从一批执行轨迹里得到能指导迭代的诊断。

## 方法概览

Agentic CLEAR 把 agent evaluation 放在 observability layer 之上，流程分两段：

- 先对每条 trace 做 step-wise、trace-wise 与 rubric evaluation；
- 再把 critique 和 judgment 聚合成 system-wide 与 node-specific insights，并回链到触发问题的具体 trace / step。

论文强调三层粒度：

- system：跨数据集的重复模式；
- trace：单次执行的整体质量；
- node：sub-agent 或组件级输入输出问题。

## 关键贡献

### 1) 把“有日志”推进到“有诊断”

Agentic CLEAR 的核心不是多存一份 trace，而是用聚合和分层诊断把大量轨迹变成可处理的问题簇。对开发者而言，这比逐条人工翻日志更接近真正的迭代入口。

### 2) rubric 不必先写死

它会针对任务生成 task-specific criteria，再据此检查 trace 是否满足要求。这个方向适合 bespoke agent workflow，因为很多失败不在统一 benchmark 标签里，而在具体流程的边界条件里。

### 3) node-level 评测适合多 Agent / workflow 架构

只看最终回答很难分清是 planning、tool use、sub-agent handoff 还是 recovery 坏了。node-level insight 把失败往组件边界上拉，便于转成工程动作。

## 与知识库主题的关系

- 它补强 [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]] 与 [[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]] 的 agent 评估线：benchmark 之外，还需要 trace diagnostics。
- 它与 [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]] 相邻：execution trace 只有可聚合、可诊断，才会变成生产资产。

## 可复用观点

- Observability 记录“发生了什么”，evaluation layer 要回答“反复坏在哪里”。
- Agent 评测不该只看 final answer；system、trace、node 三层诊断更接近系统调优。
- 对新工作流，动态 rubric 往往比先造一套静态 error taxonomy 更快进入真实问题。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-12 Agent 不会靠提示词变可靠]]
- 新角度候选：Agent 团队下一步不缺 trace，缺 trace 上面的诊断层。

## 关联笔记

- [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- [[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]
- [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- [[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]
- [[2026-05-12 Agent 不会靠提示词变可靠]]

