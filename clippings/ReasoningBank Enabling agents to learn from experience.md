---
title: "ReasoningBank: Enabling agents to learn from experience"
source: "https://research.google/blog/reasoningbank-enabling-agents-to-learn-from-experience/"
author:
  - "Google Research"
published: 2026-04-21
created: 2026-05-12
description: "Google Research 提出 ReasoningBank，用成功和失败经验蒸馏可迁移 reasoning memory，让 Agent 在部署后持续从经验中学习。"
tags:
  - "clippings"
  - "google-research"
  - "agent-memory"
  - "reasoning"
  - "self-evolving-agent"
---

# ReasoningBank: Enabling agents to learn from experience

## 原文信息

- 原文：<https://research.google/blog/reasoningbank-enabling-agents-to-learn-from-experience/>
- 论文：<https://arxiv.org/abs/2604.14314>
- 发布时间：2026-04-21
- 发布方：Google Research

## 核心提取

ReasoningBank 是一个 agent memory framework，重点不是保存完整轨迹，而是从成功和失败经验中蒸馏可迁移的高层 reasoning patterns。

它解决的问题很清晰：长期运行的 Agent 如果没有部署后的学习机制，会不断重复同样的策略错误；但如果只是记录每一步操作，又会把 memory 变成低信号日志。ReasoningBank 试图把经验压缩成结构化、可检索、可复用的推理记忆。

## 中文译读

### 一、Agent 需要从失败中学习

很多 memory 方法偏向记录成功 workflow 或详细 action trajectory。Google Research 指出，这两类方法都有缺陷：详细轨迹太低层，成功经验又忽略了失败带来的反事实信号。

ReasoningBank 的关键判断是：失败不是噪音，而是 strategic guardrails 的来源。

### 二、记忆应该是 reasoning pattern，不是操作录像

每条 ReasoningBank memory 包含 title、description 和 content。content 不是“点击了哪个按钮”，而是从过去任务中提取出的推理步骤、决策依据或操作洞察。

例如，不只是学到“点击 Load More”，而是学到“尝试加载更多结果前，先确认当前页面标识，避免掉进无限滚动陷阱”。

这与 [[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]] 的 dreaming 很相近：Agent 需要会后复盘，把经验转成更干净的组织记忆。

### 三、Memory-aware test-time scaling

ReasoningBank 还把 test-time scaling 引入 agentic environments。传统 TTS 往往只看最终答案，但 Agent 的探索轨迹本身就是可学习的数据源。

这补上了当前 Agent 评估的一块短板：任务失败后的轨迹，不应该被丢弃，而应该转成下次行动前可用的战略记忆。

## 可复用观点

- Agent memory 的价值不是记录更多，而是蒸馏更高层的 reasoning pattern。
- 失败经验是最有价值的 guardrail 来源。
- 长期 Agent 的关键能力是部署后学习，而不是一次性提示词优化。
- Memory、rubric、eval 和 skill 本质上都在做同一件事：把经验转成可复用约束。

## 可加工为公众号角度

- Agent 不应该只会记住你，而应该学会从失败中复盘。
- 为什么 “memory” 不是数据库，而是经验蒸馏系统。
- 可与 [[Built-in memory for Claude Managed Agents]]、[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]] 合并成 Agent memory 专题。

## 关联笔记

- 可补充旧稿：[[2026-05-12 Agent 不会靠提示词变可靠]]
- Claude memory：[[Built-in memory for Claude Managed Agents]]、[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
- Skill 与经验沉淀：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- 知识层：[[AI Knowledge Layer (and why your agents are useless without it)]]
