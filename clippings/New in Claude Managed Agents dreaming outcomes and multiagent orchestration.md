---
title: "New in Claude Managed Agents: dreaming, outcomes, and multiagent orchestration"
source: "https://claude.com/blog/new-in-claude-managed-agents"
author:
  - "Claude"
published: 2026-05-06
created: 2026-05-11
description: "Claude Managed Agents 发布 dreaming、outcomes、multiagent orchestration 和 webhooks，展示了长程 agent 的记忆、评估和多 agent 协作机制。"
tags:
  - "clippings"
  - "claude"
  - "agents"
  - "multiagent"
  - "memory"
---

# New in Claude Managed Agents: dreaming, outcomes, and multiagent orchestration

## 原文信息

- 原文：<https://claude.com/blog/new-in-claude-managed-agents>
- 发布时间：2026-05-06
- 发布方：Claude Blog

## 核心提取

Claude Managed Agents 这次更新的重点不是单个功能，而是一套让 agent 更接近“长期工作系统”的机制：dreaming 负责跨会话整理经验，outcomes 负责用 rubric 驱动自我修正，multiagent orchestration 负责把复杂任务拆给多个 specialist 并行处理，webhooks 则让 agent 完成后能通知外部系统。

它说明 Claude 的 agent 产品正在从“能调用工具”走向“能积累经验、能自我评估、能并行协作、能接入生产流程”。

## 中文译读

### 一、Dreaming：让 agent 在会话之间学习

Dreaming 是一个定时过程，会回看 agent 的历史会话和 memory stores，从中提取模式、整理记忆，并让 agent 随时间改进。

它能发现单个会话里不容易看到的东西，比如：

- agent 反复犯的错误
- 多个 agent 逐渐收敛出的工作流
- 团队共享偏好
- 长期项目中的稳定模式

这和普通 memory 的区别在于：memory 更像工作时记录经验，dreaming 更像工作之后复盘和整理经验。

如果说 [[AI Knowledge Layer (and why your agents are useless without it)]] 讨论的是 agent 需要知识层，那么 dreaming 讨论的是知识层如何在运行过程中持续变干净、变有用。

### 二、Outcomes：让 agent 知道什么叫“好”

Outcomes 的设计很直接：开发者写一个描述成功标准的 rubric，agent 会朝这个标准工作；另一个独立 grader 在自己的上下文窗口中评估输出，不受 agent 推理过程影响。

如果结果不达标，grader 会指出哪里需要修改，agent 再进行下一轮。

这个机制非常像 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 里强调的思路：Agent 不缺“怎么做”的通用知识，缺的是明确的成功标准、边界和评估方式。

Outcomes 特别适合两类任务：

- 需要细节覆盖和完整性的任务，比如文档生成、质量检查。
- 带有主观标准的任务，比如品牌声音、设计规范、编辑原则。

### 三、Multiagent orchestration：复杂任务需要并行 specialist

当一个 agent 难以独立完成复杂任务时，multiagent orchestration 允许 lead agent 把任务拆给多个 specialist。每个 specialist 可以有自己的模型、prompt 和工具。

文章给的典型场景是：lead agent 负责整体调查，同时 subagents 分别查看部署历史、错误日志、指标、支持工单。它们并行工作，共享文件系统，并把结果反馈给 lead agent。

这与 [[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]] 和 [[同步阻塞 vs 异步编排：Hermes  Delegate 与 OpenClaw 多 Agent 机制深度实战对比]] 形成了很好的对照：Claude Managed Agents 正在把多 agent 编排产品化。

### 四、真实案例：记忆、评估和并行的组合

文章提到多个团队的使用方式：

- Harvey 用 Managed Agents 协调法律长文写作和文件创建，dreaming 帮 agent 记住跨会话经验。
- Netflix 平台团队用多 agent 分析大量 build logs，从重复模式中找出真正值得处理的问题。
- Spiral by Every 用 lead agent 接收请求，再把多个草稿交给 Opus subagents 并行生成，用 outcomes 按编辑原则和用户声音评分。
- Wisedocs 用 outcomes 做文档质量检查，让审核更快并保持团队标准。

这些案例共同说明：agent 的价值不只是自动执行，而是把记忆、评估和并行协作组合成可靠 workflow。

## 可复用观点

- 长程 agent 需要“会话中记忆”和“会话后整理”两个层次。
- Rubric 是 agent 产品化的关键：没有标准，agent 很难稳定变好。
- 多 agent 编排的价值在于并行探索，再由 lead agent 汇总判断。
- 高价值 agent 工作流往往由 memory、outcomes、orchestration 三件事共同构成。
- 生产级 agent 不是“更聪明的聊天”，而是可追踪、可复盘、可评估的工作系统。

## 可加工为公众号角度

### 角度 1：Claude 正在把 Agent 从工具变成组织成员

围绕 dreaming、outcomes、multiagent orchestration，写一篇关于 agent 产品形态进化的文章。

### 角度 2：为什么 Agent 需要 rubric，而不是只需要 prompt

连接 [[别再把 Agent Skill 当提示词了]]，讲成功标准、负例和评估机制比提示词更重要。

### 角度 3：多 Agent 编排终于进入产品化阶段

结合已有多 agent 笔记，分析 Claude Managed Agents 与 Hermes/OpenClaw 等机制的异同。

## 关联笔记

- 已加工成稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- Skill 与评估：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[别再把 Agent Skill 当提示词了]]
- 多 Agent 编排：[[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]]、[[同步阻塞 vs 异步编排：Hermes  Delegate 与 OpenClaw 多 Agent 机制深度实战对比]]
- 知识层与记忆：[[AI Knowledge Layer (and why your agents are useless without it)]]、[[LLM Knowledge Bases  Post by @karpathy on X]]
- Harness 底座：[[The Anatomy of an Agent Harness]]
