---
title: "Agent view in Claude Code"
source: "https://claude.com/blog/agent-view-in-claude-code"
author:
  - "Anthropic"
published: 2026-05-11
created: 2026-05-13
description: "Claude Code 新增 agent view：把多会话/并行 agent 的状态、等待输入与最近输出集中到一个列表视图，并支持 /bg 与 claude --bg 启动后台任务，形成“人只在需要决策时介入”的工作流。"
tags:
  - "clippings"
  - "claude"
  - "coding-agents"
  - "multiagent"
  - "workflow"
---

# Agent view in Claude Code

## 原文信息

- 原文：<https://claude.com/blog/agent-view-in-claude-code>
- 发布时间：2026-05-11
- 发布方：Claude Blog（Anthropic）

## 核心提取

这篇文章本质上是在回答一个现实问题：当你开始并行跑多个 coding agents 后，瓶颈会从“模型会不会写代码”变成“人怎么管理会话与注意力”。Agent view 把多 session 的状态变成一个可控的队列：哪些在跑、哪些在等你、哪些已完成，并提供 peek/reply 的轻量交互。

它对应的更大趋势是：**coding agent 的 UX 会逐渐从 chat UX 变成“任务编排/收敛 UX”**。

## 中文译读

### 1) 核心能力：把多会话变成可视化的任务列表

- 从任意 session 按左箭头，或运行 `claude agents` 进入 agent view。
- 每一行显示：session、是否需要你的输入、最近一次回复摘要、上次交互时间。

### 2) Peek & reply：把“等待决策”的交互成本压到最低

- 选中 session 可以直接 peek 最近一轮。
- 若 session 在等关键选择，可在列表里直接回复，让它继续跑；需要深入时再 attach 进入完整 transcript。

### 3) Background-first：默认让 agent 在后台跑

- 用 `/bg` 把当前 session 放回 agent view。
- 用 `claude --bg [task]` 直接启动新任务并后台运行。

### 4) 早期用户的使用模式（更值得学）

- **并行探索**：把多个想法并行 dispatch（可搭配 skill），回到列表里批量收 PR 或决策点。
- **长跑型 agent**：PR babysitter、dashboard updater、循环任务直接在列表里看到下次运行时间。
- **快速切换**：在一个会话里卡住时开新会话问代码库问题，再回到原会话收敛推进。

## 可复用观点

- 并行不是“多开窗口”，而是“把会话变成可调度对象”：状态可见、等待可控、交互可最小化。
- 对 coding agents 来说，理想的人机分工是：agent 跑在后台，人只处理决策与验收。

## 可加工为公众号角度

- 为什么你需要“会话管理层”：生产级 agent 的第一要务是管住并行与注意力，而不是再调 prompt。
- 从 tmux 到 agent view：coding agent 的 IDE 正在重写。

## 关联笔记

- 可补充旧稿：[[2026-05-13 Agent 上生产前，先管住它的会话]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- Claude Code 系列：[[Redesigning Claude Code on desktop for parallel agents]]、[[Lessons from building Claude Code Prompt caching is everything]]

