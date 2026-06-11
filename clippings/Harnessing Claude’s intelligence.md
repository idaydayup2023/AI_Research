---
title: "Harnessing Claude’s intelligence"
source: "https://claude.com/blog/harnessing-claudes-intelligence"
author:
  - "[[Claude]]"
published: 2026-04-02
created: 2026-05-12
description: "Claude 官方总结构建应用时平衡智能、延迟和成本的三种模式：用模型已知工具、持续减少不必要 harness、谨慎设置边界。"
tags:
  - "clippings"
  - "agent-harness"
  - "cost-optimization"
  - "tool-use"
  - "claude"
---

# Harnessing Claude’s intelligence

## 原文信息

- 原文：<https://claude.com/blog/harnessing-claudes-intelligence>
- 发布时间：2026-04-02
- 发布方：Claude

## 核心提取

这篇文章的核心不是介绍某个功能，而是提醒开发者：agent harness 会编码关于模型能力的假设，而这些假设会随着模型变强而过期。应用要在智能、延迟和成本之间保持平衡，需要不断问三个问题：模型已经知道什么、哪些外部逻辑可以删除、harness 边界该如何设。

文章强调，Claude Code 的能力建立在 bash 和 text editor 这类通用工具上。Skills、programmatic tool calling、memory 等看起来更高级的能力，本质上也可以看作这些通用工具的组合。

## 中文译读

### 一、优先使用模型已经熟悉的工具

Anthropic 的建议是：尽量用 Claude 已经懂、训练中反复见过、并会随着模型进步而自然变强的工具。过度专用的工具 schema 可能短期提高确定性，但长期会限制模型发挥。

### 二、能力提升会让旧 harness 变成负担

很多工程逻辑原本是为了补模型短板写的。一旦模型变强，这些逻辑可能变成延迟、成本和失败点。所以 agent 应用需要定期反省：哪些步骤可以交还给模型。

### 三、边界依然必要，但要谨慎

不是所有事情都应该让模型自由发挥。安全、成本、权限、合规、不可逆操作仍然需要边界。关键是边界要围绕风险设置，而不是围绕对模型能力的过时低估设置。

## 可复用观点

- Harness 是模型能力假设的集合，因此会过期。
- 越通用、越接近模型已掌握的工具，越能随模型升级自然受益。
- 成本优化不只是选便宜模型，也包括删掉不再必要的编排逻辑。

## 可加工为公众号角度

- 可补充 [[什么才是真正的 Harness Engineering？]]：harness engineering 不是把流程写死，而是不断校准模型能力和系统边界。
- 可补充 [[2026-05-11 Agent 产品的护城河正在变成系统工程]]：系统工程里也包含“删掉过时系统”的能力。

## 关联笔记

- 可补充旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- Harness：[[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]]
- Skills：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
