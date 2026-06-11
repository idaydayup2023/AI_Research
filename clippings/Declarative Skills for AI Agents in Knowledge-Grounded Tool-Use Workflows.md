---
title: "Declarative Skills for AI Agents in Knowledge-Grounded Tool-Use Workflows"
source: "arXiv"
arxiv_id: "2606.06923"
authors: "M. Danish Lim, I. Danial Bin Sharudin, Wen Han Chen, Cedric Lim, Laura Wynter"
published: "2026-06-05"
created: "2026-06-09"
categories: "cs.AI, cs.SE"
description: "论文比较 declarative skill files、imperative state machine 和无脚手架 baseline 在知识库客服工作流中的表现，指出 retrieval 质量是 skill 无法弥补的瓶颈。"
tags:
  - "AI agents"
  - "skills"
  - "tool use"
  - "RAG"
  - "agent orchestration"
---

# Declarative Skills for AI Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.06923>
- 标题：Declarative Skills for AI Agents in Knowledge-Grounded Tool-Use Workflows
- 作者：M. Danish Lim, I. Danial Bin Sharudin, Wen Han Chen, Cedric Lim, Laura Wynter
- 提交：2026-06-05
- 分类：cs.AI, cs.SE

## 研究问题

在真实客服类 tool-use 工作流里，Agent 既要检索非结构化知识库，又要执行流程决策。到底应该用自然语言 skill files 让 Agent 自主控制流程，还是用程序化状态机显式编排？

## 方法概览

论文比较三类 Agent：

- DeclarativeAgent：在 inference time 读取三份领域 skill files，自行决定控制流。
- ImperativeAgent：使用显式阶段和程序化状态机。
- baseline：类似 tau-Knowledge benchmark 的无脚手架 Agent。

作者把三类 Agent 形式化为去中心化部分可观测 MDP 中的 policy classes，并在五种语言模型、两种检索 regime 下实验。

## 关键贡献

- 证明 declarative skill files 在高质量检索条件下能稳定提升程序性任务准确率、减少编排错误。
- 指出 retrieval 质量是主导瓶颈：如果证据不完整或偏斜，skill files 不能弥补缺失证据。
- 显式状态机并不天然更强，过硬的 imperative orchestration 可能脆弱，未必提升成功率或 compliance。

## 与知识库主题的关系

这篇论文直接补充 [[别再把 Agent Skill 当提示词了]]、[[Thin Harness, Fat Skills]] 和 [[Lessons from building Claude Code How we use skills]]。它给出一个重要边界：Skill 的价值依赖证据层质量。Skill 可以减少流程编排错误，但不能把缺失检索变成事实。

也补充 [[Unlocking dependable responses with Gemini Enterprise Agent Platforms Agentic RAG]]：RAG / retrieval 层决定了 skill 是否有材料可用。

## 可复用观点

- Skill 不是万能流程药。它能组织程序性判断，但不能修复底层 evidence recall。
- Declarative skill 的优势在于让模型保留适应性，同时把领域流程、检查点和约束放进可读的能力包。
- Imperative state machine 的确定性不等于更可靠；如果状态设计脆弱，反而会放大边界条件问题。

## 可加工为公众号角度

- 可补充旧稿：[[别再把 Agent Skill 当提示词了]] 和 [[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]。
- 可后续成稿：`Skill 再厚，也补不上证据层的洞`。近期 skills 主题已经多次出现，暂不单独成稿。

## 关联笔记

- [[别再把 Agent Skill 当提示词了]]
- [[Thin Harness, Fat Skills]]
- [[Lessons from building Claude Code How we use skills]]
- [[Unlocking dependable responses with Gemini Enterprise Agent Platforms Agentic RAG]]

