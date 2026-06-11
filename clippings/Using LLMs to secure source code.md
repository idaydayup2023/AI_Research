---
title: "Using LLMs to secure source code"
source: "https://claude.com/blog/using-llms-to-secure-source-code"
author:
  - "Claude Blog"
published: 2026-05-27
created: 2026-05-28
description: "Claude Blog 总结用 Claude Opus 做源码安全的流程：建立威胁模型、发现漏洞、验证、分流并修补。"
tags:
  - "clippings"
  - "claude"
  - "coding-agents"
  - "security"
  - "developer-workflows"
---

# Using LLMs to secure source code

## 原文信息

- 原文：<https://claude.com/blog/using-llms-to-secure-source-code>
- 发布时间：2026-05-27
- 来源：Claude Blog

## 核心提取

这篇文章的主题是用 LLM 辅助源码安全：让 Claude Opus 帮助建立 threat model、发现漏洞，再经过 verify、triage、patch。它不是简单“让模型扫代码”，而是把安全工作拆成一条可复核链路。

对本库更有价值的部分，是它把 AI coding 的“生成”与安全团队的“查找-验证-分流-修补”闭环接起来。模型不是替代安全审计，而是把人工专家的注意力从海量搜索转向判断和确认。

## 中文译读

安全场景里，LLM 最容易被误用成“给我找漏洞”的黑箱。更稳妥的使用方式，是先让模型建立 threat model：系统边界在哪里、资产是什么、攻击者可能从哪里进来、哪些路径后果最大。

然后再进入代码搜索和漏洞发现。即使模型找到了可疑点，也不能直接当成事实；还要验证是否可达、是否可利用、是否已有防护、是否值得修。最后才是 triage 和 patch。

这条链路很适合迁移到普通 AI coding：先 threat model，后代码；先验证风险，后自动修补。

## 可复用观点

- 安全型 AI coding 不应该从 patch 开始，而应该从 threat model 开始。
- LLM 的强项是广域搜索和假设生成，人工/工具闭环负责验证与优先级。
- “发现漏洞”不是结果，verify 和 triage 才决定它是否进入修复队列。
- 普通业务代码也可以借鉴安全流程：先定义资产、入口、失败后果，再让 agent 改代码。

## 可加工为公众号角度

- 可补充今日成稿：把计划审查前移时，安全类任务应把 threat model 作为计划层的一部分。
- 可后续成稿：安全工作流给 AI coding 的启示，是先让模型暴露假设，而不是先让它提交 patch。

## 关联笔记

- 已加工成稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]
- 已加工成稿：[[2026-05-28 给 AI 员工发临时工牌]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- [[Zero Trust for AI agents]]
- [[Teaching Claude why]]
- [[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]]
