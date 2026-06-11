---
title: "Introducing dynamic workflows in Claude Code"
source: "https://claude.com/blog/introducing-dynamic-workflows-in-claude-code"
author:
  - "Anthropic"
published: 2026-05-28
created: 2026-05-30
description: "Claude Code dynamic workflows 将规划、并行 subagents、独立验证和进度持久化组织成研究预览能力，用于大规模代码迁移、审计和高风险任务复核。"
tags:
  - "clippings"
  - "anthropic"
  - "claude-code"
  - "coding-agents"
  - "agent-harness"
  - "multi-agent"
  - "cost-optimization"
---

# Introducing dynamic workflows in Claude Code

## 原文信息

- 原文链接：<https://claude.com/blog/introducing-dynamic-workflows-in-claude-code>
- 发布时间：2026-05-28
- 来源：Claude Blog
- 作者：Anthropic

## 核心提取

Anthropic 单独发布 Claude Code dynamic workflows：Claude 可以根据任务动态写 orchestration scripts，在一个 session 中运行数十到数百个并行 subagents，并在交付前进行检查。它适用于代码库级 bug hunt、性能审计、安全审计、大规模迁移和高风险任务的复核。

这篇的价值不在“更多 subagents”，而在一个产品信号：coding agent 正从聊天式助手，进入可规划、可并行、可恢复、可验证的长程 workflow 形态。

## 中文译读

### 并行被做成工作流

Dynamic workflows 会先根据 prompt 做计划，再把任务拆给并行 subagents。结果在合并前经过检查，部分 agent 从独立角度解决问题，另一些 agent 尝试反驳发现，直到答案收敛。

这说明多 Agent 的产品化边界正在变清楚：不是让用户手动开十几个窗口，而是让 harness 负责拆分、调度、合并和验收。

### 复杂任务需要恢复能力

官方强调工作流可以运行数小时甚至数天，进度会保存；中断后可以继续，而不是从头开始。这个点对工程任务很关键：长程 agent 不能只是长聊天，它需要 durable execution state。

如果任务涉及几十万行代码迁移或跨仓库审计，单靠上下文窗口里的临时状态很难稳定。进度持久化本身就是 harness 能力。

### 成本提示比宣传更重要

文章明确提醒 dynamic workflows 会消耗显著更多 usage，并建议从 scoped task 开始。`ultracode` 设置会把 effort 调到 xhigh，并让 Claude 自动判断何时使用 workflow。

这与近期的预算纪律主题直接相连：强 workflow 不能默认泛用，必须先定义触发条件、成本上限和验收标准。

## 可复用观点

- 多 Agent 的核心不是数量，而是 orchestration、verification、resume 和 acceptance function。
- 高成本 workflow 必须从小范围任务试跑，先建立本团队的 token、时延和质量口径。
- 如果一个工作流不能把中间反馈、失败路径和验证结论沉淀下来，它只是一次更昂贵的长调用。
- `ultracode` 这类设置提示未来 agent 产品需要 effort routing：哪些任务值得进入高 effort，哪些任务必须挡在入口。

## 可加工为公众号角度

- 新角度候选：昂贵的 agent run 不应该只交付结果，还要交付可复用反馈。
- 可合并素材：[[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]、[[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]、[[Locally Coherent Globally Incoherent Bounding Compositional Incoherence in Multi-Component LLM Agents]]。
- 可补充旧稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]。

## 关联笔记

- [[Introducing Claude Opus 4.8]]
- [[Redesigning Claude Code on desktop for parallel agents]]
- [[How CodeRabbit used Claude to build an agent orchestration system]]
- [[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- 已加工成稿：[[2026-05-30 别让 Agent 白白烧掉反馈]]
