---
title: "Evaluating Deep Research Performance in the Wild with the DRACO Benchmark"
source: "https://research.perplexity.ai/articles/evaluating-deep-research-performance-in-the-wild-with-the-draco-benchmark"
author:
  - "[[Perplexity Research]]"
published: 2026-02-04
created: 2026-05-12
description: "Perplexity 发布 DRACO Benchmark，用真实用户复杂研究任务评估 deep research agents 的准确性、完整性和客观性。"
tags:
  - "clippings"
  - "deep-research"
  - "agent-evaluation"
  - "benchmark"
  - "perplexity"
---

# Evaluating Deep Research Performance in the Wild with the DRACO Benchmark

## 原文信息

- 原文：<https://research.perplexity.ai/articles/evaluating-deep-research-performance-in-the-wild-with-the-draco-benchmark>
- 发布时间：2026-02-04
- 发布方：Perplexity Research

## 核心提取

DRACO 是 Perplexity 为 Deep Research agents 建的开放评测集，全称是 Deep Research Accuracy, Completeness, and Objectivity。它的重点不是测试单点能力，而是用真实用户的复杂研究任务来衡量一个 agent 是否能在多来源、多步骤、带引用的场景里给出准确、完整、客观的输出。

文章指出，很多外部 benchmark 只测试狭窄技能：检索单个事实、回答 trivia、解决定义清楚的问题。但真实研究任务通常要求跨来源综合、权衡证据、给出可行动建议，同时保持事实准确和引用规范。

## 中文译读

### 一、Deep Research 的难点是任务形态，而不是搜索按钮

真实用户不会只问一个可验证事实，而会问一个模糊、开放、有取舍的问题。Deep Research agent 需要把检索、阅读、综合、判断和表达串起来。传统 benchmark 很难覆盖这种链路。

### 二、评估要从合成题走向生产任务

DRACO 的核心价值是 production-grounded evaluation。它试图回答：模型在真实用户需求里表现如何，而不是只在实验室题目里表现如何。这和 Agent 产品化高度相关，因为用户愿意为结果付费，而不是为 benchmark 分数付费。

### 三、Agent 评估需要多维标准

Deep Research 不是只有“答案对不对”。完整性、客观性、引用质量、覆盖面、综合质量都影响用户是否信任结果。DRACO 把这些维度显式化，给后续训练和产品迭代提供方向。

## 可复用观点

- Agent eval 应该尽量贴近真实任务，而不是只贴近模型能力排行榜。
- 复杂研究任务的评估要同时看 accuracy、completeness、objectivity。
- 评估集本身会反向塑造产品：你测什么，团队就会优化什么。

## 可加工为公众号角度

- 可与 [[Advancing Search-Augmented Language Models]] 合并：先定义真实任务评估，再用训练管线优化 agent。
- 可延伸内容生产自动化：如果公众号研究也由 agent 完成，评估标准不能只有“写得像”，还要看覆盖、证据和观点质量。

## 关联笔记

- 已加工成稿：[[2026-05-12 Agent 不会靠提示词变可靠]]
- Search Agent 训练：[[Advancing Search-Augmented Language Models]]
- 内容生产：[[AI 创作者的选题外挂：中英信息差工作流]]
- Agent 系统工程：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
