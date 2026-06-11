---
title: "Zero Trust for AI agents"
source: "https://claude.com/blog/zero-trust-for-ai-agents"
author:
  - "Claude Blog"
published: 2026-05-27
created: 2026-05-28
description: "Claude Blog 提出面向企业 autonomous AI agents 的 Zero Trust 框架，覆盖威胁、分层架构、八阶段落地流程和 agentic SOAR。"
tags:
  - "clippings"
  - "claude"
  - "agent-security"
  - "enterprise-ai"
  - "zero-trust"
---

# Zero Trust for AI agents

## 原文信息

- 原文：<https://claude.com/blog/zero-trust-for-ai-agents>
- 发布时间：2026-05-27
- 来源：Claude Blog

## 核心提取

这篇文章把 Zero Trust 从人和服务账号扩展到 autonomous AI agents：不要默认信任 agent 的身份、意图、工具调用或输出，而要把权限、上下文、动作和审计都纳入持续验证。

原文提供的是一个企业部署框架：当前威胁、分层架构、八阶段实施流程，以及 agentic SOAR。对知识库主线的价值在于，它把 agent 上生产的安全问题从“模型会不会乱来”改写成“运行时有没有最小权限、隔离边界、授权策略、行为监控和事后取证”。

## 中文译读

Agent 的风险不只是回答错，而是它能持续拿着工具权限行动。传统应用的 Zero Trust 关注用户、设备、网络和服务边界；agent 场景还要关注任务意图、prompt/context 来源、工具调用链、外部数据注入、记忆污染和自动化动作的回滚能力。

对企业来说，安全策略不能停在“给 agent 一组 API key”。更合理的做法是把 agent 当作动态主体：每次任务都要重新确认身份、权限、数据范围、可调用工具、动作上限和审计要求。权限应该按任务发放，而不是按 agent 固定长期发放。

## 可复用观点

- Agent 安全不是 prompt policy，而是身份、权限、隔离、审计和回滚组成的运行时架构。
- 最小权限要按任务切片，而不是按 agent 角色一次性授予。
- Memory、tool use 和 external context 都应被视作可污染面。
- 企业 agent 的信任边界应落在 harness/runtime，而不是落在模型“会自觉遵守”。

## 可加工为公众号角度

- 可后续成稿：Agent 上生产以后，安全问题会从“防提示注入”升级成“给 AI 员工发放临时工牌”。
- 可补充 [[2026-05-13 Agent 上生产前，先管住它的会话]] 和 [[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]。

## 关联笔记

- 已加工成稿：[[2026-05-28 给 AI 员工发临时工牌]]
- [[2026-05-13 Agent 上生产前，先管住它的会话]]
- [[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]
- [[New in Claude Managed Agents self-hosted sandboxes and MCP tunnels]]
- [[Introducing the Claude Platform on AWS]]
