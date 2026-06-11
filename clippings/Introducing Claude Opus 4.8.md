---
title: "Introducing Claude Opus 4.8"
source: "https://www.anthropic.com/news/claude-opus-4-8"
author:
  - "Anthropic"
published: 2026-05-28
created: 2026-05-29
description: "Anthropic 发布 Claude Opus 4.8，同时推出 effort control、Claude Code dynamic workflows，以及 Messages API 中可中途更新的 system entries。"
tags:
  - "clippings"
  - "anthropic"
  - "claude"
  - "model-capability"
  - "coding-agents"
  - "agent-harness"
  - "cost-optimization"
---

# Introducing Claude Opus 4.8

## 原文信息

- 原文链接：<https://www.anthropic.com/news/claude-opus-4-8>
- 发布时间：2026-05-28
- 来源：Anthropic News
- 作者：Anthropic

## 核心提取

Anthropic 发布 Claude Opus 4.8，强调 coding、agentic skills、reasoning、知识工作任务上的综合提升。更值得入库的不是“模型更强”本身，而是同时出现的三类控制面变化：用户可选择 effort，Claude Code dynamic workflows 可在单个 session 中规划并运行大量并行 subagents，Messages API 支持在 messages array 中插入 system entries，从而在不中断 prompt cache 的情况下更新 agent 指令。

## 中文译读

### 模型升级开始绑定“努力程度”

Opus 4.8 的发布把模型能力和 effort control 放在同一叙事里：用户可以在速度、rate limit 消耗和回答质量之间选择不同努力档位。对 coding 和长程异步任务，Anthropic 建议使用更高 effort。

这说明“推理预算”正在从后台参数变成产品交互。未来 agent 工作流里，用户或 harness 不只选择模型，还要选择任务应该花多少思考、多少 token、多少并行执行资源。

### 并行子代理被包装成动态工作流

Claude Code dynamic workflows 支持模型先规划任务，再在一个 session 中运行上百个并行 subagents，并在汇报前做验证。官方例子是跨几十万行代码的大规模迁移，验收标准是现有测试套件。

这不是简单的“多开几个 agent”。真正变化是：规划、并发、验证和汇报被放进同一个可控 workflow。它与此前的 [[Redesigning Claude Code on desktop for parallel agents]]、[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]] 连成一条线。

### 中途更新 system entries 是 harness 信号

Messages API 支持在 messages array 中加入 system entries，允许开发者在任务中途更新 instructions，而不破坏 prompt cache，也不必通过 user turn 绕路。原文给的例子包括更新权限、token budget 或环境上下文。

这对 agent harness 很关键：长期任务不是一次性 prompt，而是动态控制循环。权限、预算、上下文和环境状态需要在执行中被更新，同时保持缓存与轨迹连续。

## 可复用观点

- Agent 产品正在把“努力程度”产品化：不是每个任务都应该默认最大推理、最大并发、最大成本。
- 并行 subagents 的价值不在数量，而在规划、共享状态、验证和汇报是否被同一个 workflow 管住。
- system entries mid-task 是一个明显的 harness 控制面信号：agent 指令不再只在任务开始时设定。
- 诚实和不确定性标注正在成为 agent 可靠性的核心指标，而不是附属品。

## 可加工为公众号角度

- 新角度候选：Agent 的下一步不是更聪明，而是把 effort、并发和权限做成可调预算。
- 可合并素材：[[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]、[[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]]。
- 可补充旧稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]。

## 关联笔记

- [[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
- [[Redesigning Claude Code on desktop for parallel agents]]
- [[Lessons from building Claude Code Prompt caching is everything]]
- [[The Anatomy of an Agent Harness]]
- [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
- 已加工成稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]
