---
title: "What we learned mapping a year's worth of AI-enabled cyber threats"
source: "https://www.anthropic.com/news/AI-enabled-cyber-threats-mitre-attack"
author:
  - "Anthropic"
published: "2026-06-03"
created: "2026-06-06"
description: "Anthropic 分析 2025-03 至 2026-03 被封禁的 832 个恶意网络活动账户，指出 AI-enabled 攻击正在从初始访问走向攻击链后段，传统 MITRE ATT&CK 技术计数不足以衡量 agentic orchestration 风险。"
tags:
  - "clippings"
  - "anthropic"
  - "security"
  - "agent-trust"
  - "cyber-threats"
---

# What we learned mapping a year's worth of AI-enabled cyber threats

## 原文信息

- 原文链接：https://www.anthropic.com/news/AI-enabled-cyber-threats-mitre-attack
- 来源：Anthropic News / Frontier Red Team
- 作者：Anthropic
- 发布时间：2026-06-03

## 核心提取

Anthropic 分析了 2025 年 3 月到 2026 年 3 月期间因恶意网络活动被封禁的 832 个账户，并把这些行为映射到 MITRE ATT&CK 框架。它们不是全部封禁账户，而是有足够细节可做技术评估的样本。

文章给出三个判断：第一，恶意行为者正在把 AI 用到更复杂、更后段的攻击环节；第二，AI 可以把攻击链多个阶段串起来，导致传统“高风险/低风险行为者”的区分信号变弱；第三，MITRE ATT&CK 还没有充分覆盖 AI-enabled 攻击里最危险的 agentic orchestration 行为。

数据上，560/832 个账户使用 AI 写恶意软件或准备攻击；54/832 个账户把 AI 用于 lateral movement。Anthropic 还观察到中高风险行为者比例从前 6 个月的 33% 升至后 6 个月的 56%，并指出平台入口（Claude Code、API、chat interface）本身并不能稳定区分风险。

## 中文译读

这篇文章的价值在于把“AI 安全”从抽象的模型风险，拉回到攻击链组织方式。过去安全团队常看攻击者用了多少技术、用了哪些工具、是否有高级操作。但当 AI 可以替低技能攻击者执行后段操作时，技术数量和入口类型都不再是足够强的风险信号。

更关键的风险是 scaffolding。高风险行为者会围绕模型搭建能串联多个攻击阶段的架构，让模型做实时决策、顺序编排、执行命令和少人介入的攻击推进。文章把这类行为称为现有 ATT&CK 框架难以充分表达的 agentic orchestration。

这对知识库里的 agent 信任主题有直接启发：当 agent 进入企业系统，安全评估不能只问“它调用了哪些工具”，还要问“它是否具备跨阶段编排能力、是否能在少人介入下推进任务、是否有外部脚手架放大了模型能力”。

## 可复用观点

- AI-enabled 风险的重点不只是单个恶意提示，而是模型、工具、状态、脚本和决策循环组成的攻击脚手架。
- 入口类型不是稳定风险信号；更值得看的是 AI 被放在攻击链的哪个阶段，以及是否能串联阶段。
- Agent 安全框架需要新增“agentic orchestration”这类行为维度，否则会低估少人介入、高连续性的攻击系统。

## 可加工为公众号角度

- 可与 [[Zero Trust for AI agents]]、[[OpenAgenet_OAN Open Infrastructure for Trusted Agent Interconnection]]、[[Provably Auditable and Safe LLM Agents from Human-Authored Ontologies]] 合并，写“Agent 安全不是看工具清单，而是看它能不能串起一条攻击链”。
- 可补充 [[2026-05-28 给 AI 员工发临时工牌]]：临时权限不只控制单次调用，还要限制跨阶段连续行动。
- 今天暂不成稿：材料强，但与既有“临时工牌 / trust layer”稿件相邻；更适合作为下一篇 agent trust 新稿的证据，而不是单独写新闻解读。

## 关联笔记

- [[Zero Trust for AI agents]]
- [[OpenAgenet_OAN Open Infrastructure for Trusted Agent Interconnection]]
- [[Provably Auditable and Safe LLM Agents from Human-Authored Ontologies]]
- [[2026-05-28 给 AI 员工发临时工牌]]

