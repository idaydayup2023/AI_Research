---
title: "Harness-1: Reinforcement Learning for Search Agents with State-Externalizing Harnesses"
source: "https://arxiv.org/abs/2606.02373"
arxiv_id: "2606.02373"
authors: "Pengcheng Jiang; Zhiyi Shi; Kelly Hong; Xueqiang Xu; Jiashuo Sun; Jimeng Sun; Hammad Bashir; Jiawei Han"
submitted: "2026-06-01"
created: "2026-06-03"
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.IR"
description: "提出把 search agent 的工作记忆、证据链接、验证记录和预算感知上下文渲染外置到 stateful harness，再用 RL 训练模型做语义搜索决策。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "search-agent"
  - "context-engineering"
---

# Harness-1: Reinforcement Learning for Search Agents with State-Externalizing Harnesses

## 论文信息

- arXiv：https://arxiv.org/abs/2606.02373
- 提交时间：2026-06-01
- 分类：cs.AI, cs.CL, cs.IR
- 作者：Pengcheng Jiang 等

## 研究问题

搜索 Agent 往往被训练成“在不断增长的 transcript 上行动”的策略模型：模型既要决定搜什么、看什么、验证什么，又要在上下文里记住候选文档、证据、约束和预算。论文认为，这把太多常规状态管理压进了模型策略，导致 RL 同时优化语义搜索和可由环境更可靠维护的 bookkeeping。

## 方法概览

Harness-1 把搜索过程里的状态外置到一个 stateful search harness 中。Harness 维护候选池、重要性标记的 curated set、证据链接、验证记录、压缩与去重后的观察、预算感知的 context rendering；模型策略保留语义决策：搜索什么、保留或丢弃什么、验证什么、何时停止。

论文训练了一个 20B search agent / retrieval subagent，并在 web、finance、patents、multi-hop QA 等 8 个检索基准上评测。

## 关键贡献

- 把 search agent 的“工作记忆”从模型上下文转移到 harness 状态层。
- 把 RL 的目标从“在长 transcript 里同时推理和记账”改成“在外置状态上做语义搜索决策”。
- 实验显示 Harness-1 在 curated recall 上优于其他 open search subagent，并在 held-out transfer 上表现较强。

## 与知识库主题的关系

这篇直接补强 [[Rethinking Search as Code Generation]] 和 [[2026-06-02 Agent 的接口，不该只有工具调用]]：如果昨天的主线是“搜索接口要变成可编排 primitives”，这篇则进一步说明 primitives 背后必须有外置状态层，否则 Agent 仍会把证据、预算和验证塞回 transcript。

它也延展 [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]：执行轨迹、工作状态和验证记录应成为 runtime substrate，而不是模型临时记忆。

## 可复用观点

- Agent 训练不应把“语义决策”和“状态记账”混成一个模型任务。
- Harness 的价值不是替模型思考，而是把可结构化、可压缩、可复用、可审计的状态搬出上下文。
- Search agent 的强能力来自“模型会选证据”与“系统会保管证据”的分工。

## 可加工为公众号角度

- “把 Agent 的运行账本搬出上下文”：从工具接口升级到状态外置。
- “Agent 的工作记忆应该由系统托管”：与 AgentCL、deep-research error localization、MCP-Persona 合并成运行治理稿。

## 关联笔记

- 已加工成稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[Rethinking Search as Code Generation]]
- [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
