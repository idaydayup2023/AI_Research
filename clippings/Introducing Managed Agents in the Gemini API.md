---
title: "Introducing Managed Agents in the Gemini API"
source: "https://blog.google/innovation-and-ai/technology/developers-tools/managed-agents-gemini-api/"
author:
  - "Ali Çevik"
  - "Philipp Schmid"
published: 2026-05-19
created: 2026-05-20
description: "Google 在 Gemini API 中推出 Managed Agents，提供 Antigravity agent、云端 Linux sandbox、session state、AGENTS.md 和 SKILL.md 定义能力。"
tags:
  - "clippings"
  - "google"
  - "gemini-api"
  - "managed-agents"
  - "agent-harness"
  - "skills"
  - "developer-tools"
---

# Introducing Managed Agents in the Gemini API

## 原文信息

- 原文链接：<https://blog.google/innovation-and-ai/technology/developers-tools/managed-agents-gemini-api/>
- 发布时间：2026-05-19
- 来源：Google Blog
- 作者：Ali Çevik, Philipp Schmid

## 核心提取

Google 在 Gemini API 中推出 Managed Agents。开发者可以通过 API 启动基于 Antigravity agent 的托管 agent，它运行在安全云端 sandbox 中，能够推理、使用工具、执行代码、管理文件、浏览网页，并保留环境状态以便后续调用恢复。

它还支持用 `AGENTS.md` 和 `SKILL.md` 这样的版本化文件定义自定义 agent，把 instructions、skills 和数据注册为 managed agent。

## 中文译读

### 托管的是 agent runtime，不只是模型调用

原文最关键的信息是：Google 不只是给 Gemini API 增加一个工具调用接口，而是开放 agent harness 和运行基础设施。一次调用会创建或接收一个远程 Linux 环境，agent 可以在其中执行代码、读写文件、浏览网页，并保留 session state。

这与 Anthropic Managed Agents、Claude Code、OpenAI/Codex 方向相互印证：agent 平台竞争正在从“模型 API”走向“可运行、可恢复、可治理的 agent runtime”。

### `AGENTS.md` 和 `SKILL.md` 变成产品接口

Google 明确把 agent 定义放进 Markdown 文件：开发者不用写复杂编排代码，可以通过 instructions 和 skills 扩展 Antigravity agent，并把它们注册成托管 agent。

这说明 `AGENTS.md` / `SKILL.md` 正在从 repo 内部约定变成跨平台产品接口：它们不是文档，而是 agent 的行为配置、知识入口和版本化能力面。

### 可补充旧稿：SDK 是控制面，runtime 是执行面

这条更新与 [[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]] 形成互补：SDK/CLI/MCP server 解决 agent 如何安全触达外部系统；Managed Agents 解决 agent 在哪里运行、如何保留状态、如何被隔离和恢复。

## 可复用观点

- Agent 产品的基础设施正在分层：接口层是 SDK/MCP，执行层是 sandbox/session/runtime，知识层是 skills/memory。
- Markdown 正在成为 agent 配置和能力封装的事实接口，但它必须进入版本、审计和回归流程。
- 托管 agent 的价值不是“省服务器”，而是把 sandbox、state、tool use、web access 和 skills 变成一个可复用 runtime。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]
- 新角度候选：Agent 平台的下一层竞争，是托管运行环境。
- 新角度候选：`AGENTS.md` 和 `SKILL.md` 正在变成 agent 时代的产品接口。

## 关联笔记

- [[Anthropic acquires Stainless]]
- [[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
- [[Built-in memory for Claude Managed Agents]]
- [[The Anatomy of an Agent Harness]]
- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]

