---
title: "Built-in memory for Claude Managed Agents"
source: "https://claude.com/blog/claude-managed-agents-memory"
author:
  - "[[Claude]]"
published: 2026-04-23
created: 2026-05-12
description: "Claude Managed Agents 增加内置 memory，以文件系统形式挂载，支持跨会话学习、权限控制、审计、API 管理和回滚。"
tags:
  - "clippings"
  - "agent-memory"
  - "managed-agents"
  - "enterprise-ai"
  - "claude"
---

# Built-in memory for Claude Managed Agents

## 原文信息

- 原文：<https://claude.com/blog/claude-managed-agents-memory>
- 发布时间：2026-04-23
- 发布方：Claude

## 核心提取

Claude Managed Agents 的 memory 不是一个聊天历史功能，而是面向生产 Agent 的可管理记忆层。它以文件形式挂载到 agent 能使用的工具环境中，让 Claude 可以用 bash 和 code execution 读写记忆。记忆支持 API 管理、权限范围、审计日志、回滚和历史删除。

这篇与 5 月 6 日的 dreaming/outcomes/multiagent orchestration 更新是同一条线：Agent 要从一次性会话变成长期运行系统，必须有可维护、可追踪、可共享、可纠错的记忆层。

## 中文译读

### 一、记忆应该接在 Agent 已经会用的工具上

Anthropic 的设计选择是把 memory 挂到文件系统，而不是做成黑盒向量库。这让 agent 能用已有的文件读写、bash、代码执行能力管理记忆，也方便开发者导出和审计。

### 二、生产记忆必须有治理能力

企业 Agent 的 memory 不能只是“记住更多”。它需要权限、审计、版本、回滚、删除、并发控制。不同 agent 可以共享同一个 store，但权限不同，例如组织级只读、个人级可写。

### 三、记忆层会变成组织知识基础设施

当多个 agent 能共享经验，memory 就不再是个人偏好，而是组织工作方式的一部分。但这也意味着记忆质量、污染、冲突和过期都必须被管理。

## 可复用观点

- Agent memory 的关键不是容量，而是可管理性。
- 文件系统式 memory 更接近 agent 的真实工作方式，也更方便审计和迁移。
- 记忆会成为企业 Agent 从 demo 到生产的必要层。

## 可加工为公众号角度

- 可补充 [[2026-05-11 Agent 产品的护城河正在变成系统工程]] 的记忆层章节。
- 可和 [[AI Knowledge Layer (and why your agents are useless without it)]] 连接：memory 是短中期经验层，knowledge layer 是结构化长期知识层。

## 关联笔记

- 可补充旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- 相关新功能：[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
- 知识层：[[AI Knowledge Layer (and why your agents are useless without it)]]
