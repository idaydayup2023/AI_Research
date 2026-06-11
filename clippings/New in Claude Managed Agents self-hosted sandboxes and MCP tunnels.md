---
title: "New in Claude Managed Agents: self-hosted sandboxes and MCP tunnels"
source: "https://claude.com/blog/claude-managed-agents-updates"
author:
  - "Claude"
published: 2026-05-19
created: 2026-05-22
description: "Claude Managed Agents 新增 self-hosted sandboxes 与 MCP tunnels，把 agent loop 留在平台侧，同时把工具执行、文件、私有服务和网络边界放回企业可控环境。"
tags:
  - "clippings"
  - "claude"
  - "managed-agents"
  - "sandbox"
  - "mcp"
  - "enterprise-ai"
  - "agent-harness"
---

# New in Claude Managed Agents: self-hosted sandboxes and MCP tunnels

## 原文信息

- 原文链接：<https://claude.com/blog/claude-managed-agents-updates>
- 发布时间：2026-05-19
- 来源：Claude Blog
- 作者：Claude

## 核心提取

Claude Managed Agents 新增两项面向企业 agent 落地的能力：

- self-hosted sandboxes：agent 的工具执行环境可以跑在企业自己的基础设施，或 Cloudflare、Daytona、Modal、Vercel 等 sandbox provider 上；
- MCP tunnels：agent 可以通过企业侧轻量 gateway 访问私有 MCP servers，无需把内部服务暴露到公网。

最关键的分层是：Anthropic 继续托管 agent loop、上下文管理和错误恢复；企业把文件、仓库、私有服务、网络策略、审计与算力尺寸留在自己的 perimeter 内。

## 中文译读

### 托管 agent 不等于把执行边界全交出去

这篇文章把 Managed Agents 的价值说得更清楚了：平台可以托管 orchestration，但生产团队仍然需要决定工具在哪里执行、文件是否离开边界、内部服务如何被访问。

这不是“本地还是云端”的二选一，而是 agent runtime 的拆层：

- loop 和 session management 可以平台化；
- execution sandbox 必须可配置；
- 私有工具访问需要专门的网络边界。

### sandbox 是执行面，不只是算力容器

原文强调 self-hosted sandbox 可以继承现有 network policies、audit logging、安全工具和 runtime image。它真正承载的是执行边界：长构建、图像生成、包安装、仓库挂载、资源配额都在这里被控制。

所以 sandbox 不是一个“给 agent 跑 shell 的容器”而已，而是企业把 agent 接进现有治理体系的执行面。

### MCP tunnels 把“工具可达”变成“边界内可达”

MCP tunnels 的设计很直接：企业部署 outbound gateway，让 agent 触达私有数据库、内部 API、知识库和 ticketing 系统，同时避免 inbound firewall rules 与公开 endpoint。

这补上了很多 agent demo 没处理的真实问题：工具越接近业务核心，越不能默认把服务暴露在公网。

## 可复用观点

- Agent 平台正在把 agent loop 与 execution perimeter 分开产品化。
- 企业 agent 的关键不是“能调用多少工具”，而是“工具执行与私有服务访问能否进入现有审计和网络边界”。
- MCP 的生产价值不只在统一工具协议，还在让私有服务以更可治理的方式成为 agent 工具。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]
- 可补充旧稿：[[2026-05-13 Agent 上生产前，先管住它的会话]]
- 新角度候选：Agent 上生产后，真正要拆的是 loop、sandbox 与 private tools 三层边界。

## 关联笔记

- [[Introducing Managed Agents in the Gemini API]]
- [[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
- [[Built-in memory for Claude Managed Agents]]
- [[Anthropic acquires Stainless]]
- [[The Anatomy of an Agent Harness]]
- [[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]

