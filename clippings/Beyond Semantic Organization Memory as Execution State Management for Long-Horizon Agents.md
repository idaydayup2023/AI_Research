---
title: "Beyond Semantic Organization: Memory as Execution State Management for Long-Horizon Agents"
source: "https://arxiv.org/abs/2606.06090"
arxiv_id: "2606.06090"
authors:
  - "Yaoqi Chen"
  - "Haibin Lai"
  - "Yuru Feng"
  - "Chuyu Han"
  - "Qianxi Zhang"
  - "Baotong Lu"
  - "Menghao Li"
  - "Xinjiang Wang"
  - "Zhirui Wang"
  - "Shusen Xu"
  - "Zengzhong Li"
  - "Zewen Jin"
  - "Hao Wu"
  - "Cheng Li"
  - "Qi Chen"
submitted: "2026-06-04"
created: "2026-06-07"
categories:
  - "cs.AI"
description: "论文把长任务 Agent 记忆从语义检索改写为执行状态管理：用层级状态树保存当前路径、分支、摘要、验证和回滚边界，避免错误轨迹污染当前决策。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "execution-state"
  - "long-horizon-agents"
---

# Beyond Semantic Organization: Memory as Execution State Management for Long-Horizon Agents

## 论文信息

- arXiv：https://arxiv.org/abs/2606.06090
- 作者：Yaoqi Chen、Haibin Lai、Yuru Feng、Chuyu Han、Qianxi Zhang、Baotong Lu、Menghao Li、Xinjiang Wang、Zhirui Wang、Shusen Xu、Zengzhong Li、Zewen Jin、Hao Wu、Cheng Li、Qi Chen
- 提交时间：2026-06-04
- 分类：cs.AI

## 研究问题

长程 Agent 的每一步动作都会改变后续约束，错误中间状态会沿着任务轨迹级联。传统 RAG 或 memory 系统按语义相似度组织历史，很容易把“相关但不在当前执行路径上”的内容取回来，也会把有效轨迹和错误分支混在一起。

这篇论文的问题意识很明确：Agent 记忆不只是要找相似内容，而是要帮 Agent 重建“我现在执行到哪里、哪些分支已经失败、哪些摘要仍然有效”。

## 方法概览

作者提出 MAGE（Memory as Agent-Guided Exploration），把交互历史组织成层级状态树。Agent 的当前状态来自 active root-to-current path，而不是一批相似片段。

系统包含四类操作：

- Grow：记录新交互轨迹。
- Compress：把完成的子目标压缩成摘要。
- Maintain：验证摘要是否仍然保持状态完整性。
- Revise：回到目标边界，在新分支上恢复执行。

这种设计把“有效路径”和“错误分支”隔离开，同时控制上下文增长。

## 关键贡献

- 把 agent memory 的问题对象从 semantic organization 切到 execution-state dependency。
- 用层级状态树表达任务当前路径、子目标摘要、历史分支和恢复边界。
- 把错误隔离、摘要维护和回滚恢复纳入 memory 操作，而不是只做检索。
- 在 MemoryArena 上报告任务成功率提升，同时减少 token 消耗，说明状态树不仅是质量机制，也能影响预算。

## 与知识库主题的关系

这篇直接补强 [[2026-06-03 把 Agent 的运行账本搬出上下文]]。那篇公众号稿讲状态、证据、预算和错误轨迹要搬出上下文；这篇给出更细的 memory 数据结构：不是一个大记忆库，而是一棵可压缩、可验证、可回滚的执行状态树。

它也延续 [[Agent Memory Characterization and System Implications of Stateful Long-Horizon Workloads]] 的系统视角。前者看不同 memory 系统的成本剖面，这篇更像一个架构主张：长期记忆的核心不是“记得多”，而是“当前路径不被错误分支污染”。

## 可复用观点

- Agent memory 的第一职责不是召回相关内容，而是维护当前执行状态的完整性。
- 语义相似度只解决“像不像”，不解决“现在能不能用”。
- 长任务系统需要把失败分支显式隔离，否则 Agent 会把历史错误重新包装成当前证据。

## 可加工为公众号角度

- 可与 [[When Should Memory Stay Silent Measuring Memory-Use Boundaries in Memory-Augmented Conversational Agents]] 合并，写“AI 记忆该有沉默权”：不是所有可检索内容都该进入当前答案。
- 可与 [[Agent Memory Characterization and System Implications of Stateful Long-Horizon Workloads]] 合并，写“记忆不是资料库，是运行状态机”。
- 今天暂不成稿：memory/state 外置已经是最近 7 篇高频母题，此篇先作为“执行状态树”证据补库。

## 关联笔记

- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[Agent Memory Characterization and System Implications of Stateful Long-Horizon Workloads]]
- [[Is Agent Memory a Database Rethinking Data Foundations for Long-Term AI Agent Memory]]
- [[Your Agents Are Aging Too Agent Lifespan Engineering for Deployed Systems]]
