---
title: "Advancing Search-Augmented Language Models"
source: "https://research.perplexity.ai/articles/advancing-search-augmented-language-models"
author:
  - "[[Perplexity Research]]"
published: 2026-04-22
created: 2026-05-12
description: "Perplexity 公开 search-augmented language model 的 SFT + on-policy RL 训练管线，重点在数据构造、奖励设计、工具效率和生产约束。"
tags:
  - "clippings"
  - "search-agent"
  - "reinforcement-learning"
  - "agent-evaluation"
  - "perplexity"
---

# Advancing Search-Augmented Language Models

## 原文信息

- 原文：<https://research.perplexity.ai/articles/advancing-search-augmented-language-models>
- 发布时间：2026-04-22
- 发布方：Perplexity Research

## 核心提取

这篇文章价值很高，因为它把“搜索增强模型”从产品功能拆成了可训练、可评估、可控成本的工程系统。Perplexity 的关键判断是：训练 web search agents 不能只优化准确率，还要同时优化工具使用效率、偏好对齐、格式一致性、安全边界和生产约束。

他们采用两阶段管线：先用 SFT 固化 guardrails、格式、拒答、语言一致性和工具轨迹，再用 on-policy RL 提升搜索能力。RL 数据分成两类：一类是可验证的多跳搜索 QA，另一类是 rubric-based general chat，用来防止 RL 阶段把产品行为训坏。

最有复用价值的是 reward 设计：正确性或 rubric 满足是硬门槛，只有先通过 baseline reward，偏好分和效率分才生效。这样可以降低 reward hacking，避免模型用漂亮表达掩盖事实错误，或者为了少用工具牺牲可靠性。

## 中文译读

### 一、搜索 Agent 的训练目标是多目标系统

Perplexity 明确指出，只看准确率会让模型过度调用工具；只看简洁性又可能损害完整性和可靠性。所以搜索 Agent 的训练必须同时处理几个目标：事实正确、轨迹高效、用户偏好、产品格式和安全边界。

### 二、数据和奖励必须一起设计

文章最重要的方法论是：数据决定哪些行为可被观察和验证，奖励决定这些信号如何转成优化方向。可验证 QA 负责事实能力，rubric-based data 负责非唯一答案场景里的指令遵循、格式和产品要求。

### 三、效率不是粗暴惩罚工具调用

Perplexity 没有简单按工具调用次数扣分，因为这会压制必要探索。他们使用 group-relative、anchored penalty：只惩罚相对有效解法明显多余的工具调用和输出长度。这个设计很适合启发应用层 Agent：成本控制不能伤害完成任务的必要行动。

## 可复用观点

- Agent 可靠性不是 prompt 问题，而是训练数据、reward、eval 和产品约束共同决定的系统问题。
- 对 Agent 来说，“少用工具”不是目标，“在正确前提下少浪费工具”才是目标。
- Rubric 可以把非唯一答案任务变成可训练、可评估的信号。
- Reward 设计要防止“表达好看但事实错误”获得高分。

## 可加工为公众号角度

- Agent 不会靠提示词变可靠：真正的核心是训练信号和评估系统。
- Search Agent 的产品化难点不是能不能联网，而是如何让它知道什么时候查、查多少、何时停。
- 这篇可和 [[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]]、[[Teaching Claude why]]、[[Automated Alignment Researchers Using large language models to scale scalable oversight]] 合并成关于 Agent 评价体系的文章。

## 关联笔记

- 已加工成稿：[[2026-05-12 Agent 不会靠提示词变可靠]]
- 评估体系：[[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]]
- 对齐训练：[[Teaching Claude why]]、[[Automated Alignment Researchers Using large language models to scale scalable oversight]]
- Harness 底座：[[The Anatomy of an Agent Harness]]、[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
