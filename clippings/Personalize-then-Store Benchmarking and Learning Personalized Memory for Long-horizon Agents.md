---
title: "Personalize-then-Store: Benchmarking and Learning Personalized Memory for Long-horizon Agents"
source: "https://arxiv.org/abs/2605.25535"
arxiv_id: "2605.25535"
authors:
  - "Yeonjun In"
  - "Wonjoong Kim"
  - "Sangwu Park"
  - "Kanghoon Yoon"
  - "Chanyoung Park"
submitted: 2026-05-25
created: 2026-05-27
categories:
  - "cs.AI"
description: "提出 PerMemBench 评估个性化记忆系统，并用 session-level storage gating 说明长期记忆的关键不是多存，而是判断什么对这个用户值得存。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "personalization"
  - "long-horizon-agents"
  - "agent-evals"
---

# Personalize-then-Store: Benchmarking and Learning Personalized Memory for Long-horizon Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.25535>
- 提交时间：2026-05-25（v1）
- 作者：Yeonjun In, Wonjoong Kim, Sangwu Park, Kanghoon Yoon, Chanyoung Park
- 分类：cs.AI

## 研究问题

现有 LLM memory 系统常用通用、静态的存储策略：什么信息该存、什么时候更新、哪些交互可以丢弃，往往用同一套规则处理所有用户。

论文指出，这忽略了一个基本事实：不同用户真正值得进入长期记忆的上下文并不一样。统一策略会把有限 memory budget 浪费在短暂互动上，同时漏掉对长程任务真正关键的个性化上下文。

## 方法概览

论文提出 PerMemBench，用于评估 personalized memory systems。这个 benchmark 包含跨多年、跨领域的交互历史，并覆盖不同 user personas。

在方法上，作者提出 session-level storage gating：在会话级别判断是否要绕过 memory operation，从而避免把临时会话写入长期记忆。论文的经验结论是：在 perfect gating 下，个性化能带来明显 retention gains；但准确 gating 仍是开放且关键的问题。

## 关键贡献

- 把“记忆该存什么”从通用策略问题改写为个性化策略问题。
- 提出 PerMemBench，专门评估个性化长期记忆，而不只是对话摘要质量。
- 用 storage gating 强调 memory write 的第一关不是怎么总结，而是是否值得写入。
- 指出准确 gating 是长期 agent 记忆落地的关键瓶颈。

## 与知识库主题的关系

这篇论文补充 [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]：LME-V2 关注环境经验与证据召回，PerMemBench 更关注用户差异下的记忆写入策略。

它也和 [[Built-in memory for Claude Managed Agents]]、[[Memory-R2 Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents]] 构成一个链条：memory 不只是“能不能记住”，还包括何时写、为何写、写给谁、如何评估写入是否真的带来长程收益。

## 可复用观点

- 长期记忆的第一性问题不是容量，而是写入门禁。
- “对别人有用的信息”不等于“对这个用户值得长期保存的信息”。
- Memory hygiene 需要个性化；否则长期记忆会被临时偏好、偶发任务和低价值上下文污染。
- 对内容生产系统来说，个人知识库也需要 storage gating：不是每条信息都值得进入长期选题记忆。

## 可加工为公众号角度

- Agent 记忆不是多存，而是先学会不存。
- 个性化记忆的难点在写入门禁，而不是更长上下文。
- 做个人知识库和企业 agent，都需要一套“什么值得进入长期记忆”的判定规则。

## 关联笔记

- 历史文摘：[[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]、[[Built-in memory for Claude Managed Agents]]、[[Memory-R2 Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents]]
- 相关旧稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]、[[2026-05-15 长上下文不是长期记忆：先把它评测成能用的]]
- 已加工成稿：[[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
