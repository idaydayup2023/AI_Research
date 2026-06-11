---
title: "Introducing the Claude Platform on AWS"
source: "https://claude.com/blog/claude-platform-on-aws"
author:
  - "Anthropic"
published: 2026-05-11
created: 2026-05-13
description: "Claude Platform 以 AWS 作为接入与计费层（IAM/CloudTrail/单账单）提供原生 Claude API 功能；同时明确与 Bedrock 的边界：功能齐全 vs 数据处理边界/数据驻留要求。"
tags:
  - "clippings"
  - "claude"
  - "enterprise-ai"
  - "platform"
  - "governance"
---

# Introducing the Claude Platform on AWS

## 原文信息

- 原文：<https://claude.com/blog/claude-platform-on-aws>
- 发布时间：2026-05-11
- 发布方：Claude Blog（Anthropic）

## 核心提取

这篇文章的工程可迁移点在于：它把“企业上云用大模型”的关键变量讲清楚了——**身份与审计（IAM/CloudTrail）、计费与承诺抵扣、功能上线节奏、以及数据处理边界**。对企业来说，这些往往比单次模型指标更决定落地速度。

## 中文译读

### 1) Claude Platform on AWS 的定位

- 让 AWS 客户用 **AWS 身份与账单**接入 Claude Platform 的完整能力（官方宣称与原生 Claude API 功能同步上线新特性）。
- IAM 负责认证与权限，CloudTrail 做审计，账单走单一 AWS invoice，并支持把使用额抵扣到既有承诺（commitment retirement）。

### 2) “功能完整”与“数据边界”的取舍（对比 Bedrock）

- **Claude Platform on AWS**：Anthropic 运营服务；文章强调它提供 day-one feature parity，但**数据处理在 AWS 边界之外**。适合“要全功能、要原生平台体验”的团队。
- **Claude on Amazon Bedrock**：AWS 作为 data processor，在 AWS 边界内处理；更适合严格的数据驻留/合规要求。

### 3) 文章列出的平台能力（作为选型 checklist）

包括 Managed Agents、skills、MCP connector、prompt caching、citations、batch processing、files API、code execution、web search/web fetch、console 内置 eval 等（具体以官方为准，文章给的是能力清单）。

## 可复用观点

- 企业 agent 落地的瓶颈常常在“接入层”：身份、审计、账单与治理决定了迭代速度。
- “feature parity”与“data boundary”是两个必须显式权衡的轴：不要在模糊前提下做架构决策。

## 可加工为公众号角度

- 企业选型不该只看模型：IAM/审计/计费/数据边界，才是 agent 上生产的隐形门槛。

## 关联笔记

- 可补充旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- Claude 平台与 agent 机制：[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]、[[Built-in memory for Claude Managed Agents]]

