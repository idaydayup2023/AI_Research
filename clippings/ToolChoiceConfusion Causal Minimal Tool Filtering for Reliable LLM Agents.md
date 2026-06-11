---
title: "ToolChoiceConfusion: Causal Minimal Tool Filtering for Reliable LLM Agents"
source: "https://arxiv.org/abs/2606.06284"
arxiv_id: "2606.06284"
authors:
  - "Rahul Suresh Babu"
  - "Laxmipriya Ganesh Iyer"
submitted: "2026-06-04"
created: "2026-06-06"
categories:
  - "cs.AI"
description: "论文提出 Causal Minimal Tool Filtering，用 precondition-effect contracts 每一步只暴露因果上必要的最小工具前沿，在 102 个任务、100 个工具设置下把可见工具从 100 个降到每步 1 个，并相对全工具暴露减少约 90% token。"
tags:
  - "clippings"
  - "arxiv"
  - "tool-use"
  - "agent-reliability"
  - "permissions"
  - "cost-optimization"
---

# ToolChoiceConfusion: Causal Minimal Tool Filtering for Reliable LLM Agents

## 论文信息

- arXiv：https://arxiv.org/abs/2606.06284
- 作者：Rahul Suresh Babu、Laxmipriya Ganesh Iyer
- 提交时间：2026-06-04
- 分类：cs.AI

## 研究问题

LLM agents 越来越依赖外部工具，但工具菜单越大，错误工具调用、过早行动和 token 成本越容易上升。常见 tool selection 方法主要根据语义相关性筛工具，但“相关”不等于“当前步骤必要”。一个工具可能和最终任务相关，却还没到使用它的时候。

论文的问题是：能否每一步只暴露因果上足够推进任务的最小工具集合。

## 方法概览

作者提出 Causal Minimal Tool Filtering（CMTF），一种 training-free 方法。它用轻量 precondition-effect contracts 判断当前状态到用户目标之间，下一步需要哪些工具构成 minimal next-step frontier。

它不是做关键词或 embedding 相关性检索，而是问：当前状态下，哪个工具的前置条件已满足，调用后能把状态推进到目标。

## 关键贡献

- 把工具选择从“语义相关”改为“因果充分”。
- 用 102 个 multi-step tool-use tasks、100 个工具、4 个 LLM backend 和 2448 组 task-method-model runs 做比较。
- 在 aggregate success 上匹配最强 causal baseline，同时把每步可见工具从 100 个降到 1 个。
- 相比 all-tools exposure，token usage 约减少 90%，并降低 wrong-tool calls 和 premature actions 风险。

## 与知识库主题的关系

这篇直接补强 [[2026-05-28 给 AI 员工发临时工牌]] 和 [[2026-06-02 Agent 的接口，不该只有工具调用]]。它说明权限最小化不仅是安全策略，也能是可靠性和成本策略。

此前的“临时工牌”更关注身份、权限和审计；这篇把边界推到执行步骤内部：不是给 agent 一整排工具，而是根据状态和目标，每一步只给它当前因果上必要的工具。

## 可复用观点

- tool relevance 不等于 tool readiness；工具相关但前置条件未满足时，暴露给模型反而会诱导 premature action。
- 最小权限原则可以改写成最小工具前沿：每一步只给 agent 能推进状态的下一步工具。
- 工具菜单越大，可靠性和成本问题会同时出现；工具过滤不是 UX 优化，而是 agent harness 控制面。

## 可加工为公众号角度

- 可与 [[What we learned mapping a years worth of AI-enabled cyber threats]] 合并，写“限制 agent 风险，不只看权限大小，还要看它能不能连续推进攻击链”。
- 可与 [[Unlocking dependable responses with Gemini Enterprise Agent Platforms Agentic RAG]] 合并，写“可靠 Agent 的共同模式：先识别当前缺口，再只开放下一步必要动作”。
- 今天暂不成稿：角度很强，但与近期接口和权限主题相邻；先入库，等待更多“step-level control”材料再形成新稿。

## 关联笔记

- [[2026-05-28 给 AI 员工发临时工牌]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
- [[Learning When Not to Act Mitigating Tool Abuse in Agentic Reinforcement Learning]]
- [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]

