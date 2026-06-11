---
title: "Code w/ Claude SF 2026 recap: Building on the AI exponential"
source: "https://claude.com/blog/code-w-claude-sf-2026-sf"
author:
  - "Anthropic"
published: 2026-05-12
created: 2026-05-17
description: "Claude 开发者大会回顾：围绕 prompting、模型选择、skills 架构与 AI-native 工程团队扩展；并补充披露 Claude Managed Agents 的 Dreaming、Multiagent orchestration、Outcomes 与 Webhooks 等能力与内部效果口径。"
tags:
  - "clippings"
  - "agents"
  - "skills"
  - "workflows"
  - "enterprise-ai"
  - "anthropic"
---

# Code w/ Claude SF 2026 recap: Building on the AI exponential

## 原文信息

- 原文：<https://claude.com/blog/code-w-claude-sf-2026-sf>
- 发布时间：2026-05-12
- 发布方：Claude Blog（Anthropic）

## 核心提取

这篇内容的“资讯性”不高，但有两条对工程化很有价值的信号：

1) Anthropic 把“AI-native 工程团队”当作可被组织化、可被扩展的一套方法论：从 prompting 与模型选择，到 skills 架构与团队扩展，核心判断是“从想法到生产软件的距离正在缩短”，而优势来自对这种缩短的系统性设计。

2) 文章补充了 Claude Managed Agents 的四项能力（Dreaming / Multiagent orchestration / Outcomes / Webhooks）以及一条效果口径：Outcomes 在内部基准上对最难任务可提升成功率约 10 个点（10 points）。

## 中文译读

### 1) “AI exponential”更像工程组织问题

文章把一个变化说得很直白：不只是模型更强，而是“把想法变成可部署软件”的链路在缩短。能拿到最大杠杆的团队，不是被动跟随工具迭代，而是在流程与系统层面主动设计，让团队能持续享受这种缩短带来的复利。

这类表述对选题的启发是：我们写 agent 与工具时，读者更关心“怎么把它变成团队默认工作方式”，而不是“它又多了一个按钮”。

### 2) 四个能力其实在回答同一个问题：如何让 agent 在团队里可控地跑起来

文章对 Claude Managed Agents 的四项能力描述得很“产品化”，但背后指向同一件事：把 agent 从一次性任务执行器，变成能被团队治理的持续系统。

- Dreaming：定时回看历史 session，抽取模式、整理记忆，让 agent 在运行之间也能“变得更像团队成员”（把重复错误、工作流、偏好沉淀进更有用的 memory store）。
- Multiagent orchestration：主 agent 将任务并行委派给子 agent，共享文件系统；每个子 agent 可用不同模型/提示/工具；整个流程可在控制台追踪。
- Outcomes：开发者先定义“好输出长什么样”的 rubric，由独立 grader 在单独 context window 里评估，不达标就让 agent 继续修订。
- Webhooks：当 outcome 定义完成后，可让 agent 自行运行，并用 webhook 通知完成。

如果把它们串起来看，这其实是一套“把输出质量与执行流程放进可审计框架”的组合拳：有记忆、有并行、有验收、有通知，才可能进入团队默认工作流。

## 可复用观点

- 当“从想法到生产”的距离缩短时，竞争力更来自流程与系统设计，而不是临场技巧（prompt）本身。
- agent 能不能进团队主流程，取决于是否具备：可沉淀（memory）/可分工（parallel）/可验收（rubric+grader）/可集成（webhooks）这类工程化接口。
- “效果口径”很重要：哪怕只是一个“难题提升 10 points”的指标，也比“更强大”更可操作。

## 可加工为公众号角度

### 角度 1：团队要的是“可验收的 agent”，不是“会聊天的 agent”

把 Outcomes（rubric+grader）当成入口，讲为什么 agent 的质量控制要像 CI：先定义验收，再允许自动执行。

### 角度 2：并行不是多开窗口，而是组织分工的接口

把 multiagent orchestration 解读为“面向任务分解的系统接口”，而不是“多 agent 更酷”。

## 关联笔记

- 可补充旧稿：[[2026-05-13 Agent 上生产前，先管住它的会话]]
- 相关同主题摘录：[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]、[[Built-in memory for Claude Managed Agents]]
- Harness / Skills / 可复现：[[Thin Harness, Fat Skills]]、[[The Anatomy of an Agent Harness]]
