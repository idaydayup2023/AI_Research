---
title: "New ways to balance cost and reliability in the Gemini API"
source: "https://blog.google/innovation-and-ai/technology/developers-tools/introducing-flex-and-priority-inference/"
author:
  - "Lucia Loher"
  - "Hussein Hassan Harrirou"
published: 2026-04-02
created: 2026-05-14
description: "Google 在 Gemini API 引入两种推理层级（Flex 与 Priority），用“价格/延迟/可靠性”分层来帮助开发者做成本优化与 SLA 权衡。"
tags:
  - "clippings"
  - "google"
  - "gemini"
  - "inference"
  - "cost-optimization"
  - "serving"
---

# New ways to balance cost and reliability in the Gemini API

## 原文信息

- 原文：<https://blog.google/innovation-and-ai/technology/developers-tools/introducing-flex-and-priority-inference/>
- 发布时间：2026-04-02
- 作者：Lucia Loher, Hussein Hassan Harrirou
- 发布方：Google

## 核心提取

这篇文章最有价值的不是“又多了两个选项”，而是它把推理系统的一个现实事实公开化：**同一个模型能力，在不同的调度/容量策略下，会呈现不同的价格、延迟和可靠性曲线**。

Google 用 Flex 与 Priority 把这种差异产品化，等于在 API 层引入了“推理分层”的显式开关：让开发者可以把不同任务分配到不同层级，从而把预算用在最关键的交互上。

## 中文译读

### 1) 推理分层正在成为开发者体验的一部分

过去大家讨论成本优化，更多在应用侧做：

- prompt 压缩、缓存、去冗余
- retrieval / memory 让上下文不必无限增长
- batching / speculative decoding 这些系统优化

但现在平台直接给出 tier，让“你愿意为了更可靠/更低延迟付多少钱”变成一个产品选项。

### 2) 对 agent/workflow 的意义：把任务分级

对 agent 系统来说，很多环节不需要最强 SLA：

- nightly indexing / offline synthesis
- 长链路规划的草稿推演
- 低优先级的候选生成

而用户在场的交互、关键动作前的校验与最终输出，则更需要稳定。

因此，一个可操作的架构是：

- harness 层做任务分级与路由（什么时候用哪个 tier）
- skills 层把“证据检索/核验”做得更结构化，减少对高价推理的依赖

### 3) 这也暗示了企业采购的一个新话语体系

从“买模型”转向“买一套可控的推理系统”：tier、容量、SLA、计费口径、缓存策略、审计与配额，会成为 enterprise AI 的真实壁垒。

## 可复用观点

- 推理系统分层（价格/延迟/可靠性）会成为 agent 产品的基本设计维度。
- “同模型不同 tier”是成本杠杆：把预算集中在用户在场、风险最高的步骤。

## 可加工为公众号角度

- 为什么未来的 agent 产品不是“选模型”，而是“选推理层级 + 任务分级”？
- 价格/延迟/可靠性三角：平台正在把系统工程显式卖给开发者。

## 关联笔记

- 已加工成稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]
- 成本口径与系统设计：[[Token计算：下一个十年的成本战争]]
- agent harness：[[The Anatomy of an Agent Harness]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- 长上下文/缓存路线：[[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]
