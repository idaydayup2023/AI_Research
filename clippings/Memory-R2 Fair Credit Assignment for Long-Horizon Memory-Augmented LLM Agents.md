---
title: "Memory-R2: Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents"
source: "https://arxiv.org/abs/2605.21768"
arxiv_id: "2605.21768"
authors:
  - "Sikuan Yan"
  - "Ahmed Bahloul"
  - "Ercong Nie"
  - "Susanna Schwarzmann"
  - "Riccardo Trivisonno"
  - "Volker Tresp"
  - "Yunpu Ma"
submitted: 2026-05-20
published: 2026-05-20
created: 2026-05-22
categories:
  - "cs.LG"
  - "cs.MA"
description: "提出 Memory-R2 与 LoGo-GRPO，为长程多 session memory agents 引入从相同中间记忆状态出发的 local rerollouts，以缓解 memory write/update/delete 导致的 credit assignment 偏差。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "reinforcement-learning"
  - "long-horizon-agents"
  - "context-engineering"
---

# Memory-R2: Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.21768>
- 提交时间：2026-05-20（v1）
- 作者：Sikuan Yan, Ahmed Bahloul, Ercong Nie, Susanna Schwarzmann, Riccardo Trivisonno, Volker Tresp, Yunpu Ma
- 分类：cs.LG / cs.MA

## 研究问题

Memory-augmented agents 会跨 session 写入、更新和删除记忆。这样一来，过去动作会改写未来环境：不同 rollout 一旦形成不同 memory state，后续 reward 就不再是在同一个有效环境里比较。

论文聚焦这个 credit assignment 问题：长程 memory operation 的好坏，不能只看终局轨迹奖励，否则容易把早期记忆污染、后续覆盖与当前操作混在一起。

## 方法概览

Memory-R2 的核心是 LoGo-GRPO：

- global objective 保留长程 end-to-end reward；
- local rerollouts 从相同 intermediate memory state 出发，比较不同 memory operation 的后果；
- progressive curriculum 把训练 horizon 从 8、16 提到 32 sessions；
- fact extractor 与 memory manager 共用 LLM backbone，用 role-specific prompts 协同优化 memory formation 与 memory evolution。

## 关键贡献

### 1) 把 memory 训练难点说成了“环境被自己改写”

这比“上下文太长”更接近长期 agent 的真实问题。记忆不是外部数据库而已，它会改变后续 session 的决策条件。

### 2) local rerollout 让比较重新公平

同一中间 memory state 出发，才有资格比较不同记忆操作的价值。这个设计把长程 reward 重新拆回局部可学信号。

### 3) 记忆生命周期需要 formation 与 evolution 一起学

只学 retrieval 不够。先抽出什么事实，再决定 insert/update/delete，本身就是一条协同链路。

## 与知识库主题的关系

- 它补充 [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]：前者偏 memory evaluation 与 evidence gathering，这篇偏 memory policy training。
- 它也与 [[ReasoningBank Enabling agents to learn from experience]] 一起说明“经验”不是聊天摘要，而是会影响后续策略的状态层。

## 可复用观点

- 长期记忆让 agent 进入 non-stationary environment；评估和训练都不能假装每次 rollout 共享同一状态。
- 记忆系统要分别看 formation、evolution、retrieval，不能把所有问题压成“召回率”。
- 对产品团队而言，memory write/update/delete 的审计与回滚会比“能存多久”更早变成生产问题。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]
- 可后续成稿：长期记忆不是给 agent 加仓库，而是在改变它的未来环境。

## 关联笔记

- [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]
- [[ReasoningBank Enabling agents to learn from experience]]
- [[Built-in memory for Claude Managed Agents]]
- [[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]

