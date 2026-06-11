---
title: "Empirical Research Assistance (ERA): From Nature publication to catalyzing Computational Discovery"
source: "https://research.google/blog/empirical-research-assistance-era-from-nature-publication-to-catalyzing-computational-discovery/"
author:
  - "Lizzie Dorfman"
  - "Michael Brenner"
published: 2026-05-19
created: 2026-05-20
description: "Google Research 介绍 ERA：用 Gemini 写作、优化和评测科学代码的研究助手，并作为 Computational Discovery 的基础组件。"
tags:
  - "clippings"
  - "google-research"
  - "scientific-discovery"
  - "coding-agent"
  - "gemini"
  - "agent-workflow"
---

# Empirical Research Assistance (ERA): From Nature publication to catalyzing Computational Discovery

## 原文信息

- 原文链接：<https://research.google/blog/empirical-research-assistance-era-from-nature-publication-to-catalyzing-computational-discovery/>
- 发布时间：2026-05-19
- 来源：Google Research Blog
- 作者：Lizzie Dorfman, Michael Brenner

## 核心提取

ERA 是 Google 用 Gemini 构建的科学编码助手，目标是帮助科学家编写、优化和评估经验研究代码。它接收科学问题和成功度量后，会搜索文献、写代码、探索解决方案、组合技术并评估结果；其方法包含 tree search，用目标函数优化输出代码。

这篇文章进一步说明，ERA 已经成为 Computational Discovery 原型的重要组件，与 AlphaEvolve 一起支撑“生成并评分大量代码变体”的科学实验工作流。

## 中文译读

### ERA 处理的是“把假设变成可跑实验”的中间层

Co-Scientist 更偏向假设生成，ERA 更偏向经验研究和科学编码。它解决的不是“文献读不完”，而是“一个研究想法要变成可复现实验，需要大量代码、模型、参数和评估迭代”。

这类工作过去高度依赖专家经验：知道该查哪些文献、用哪些 baseline、怎么写实验、怎么设指标、怎么比较结果。ERA 的定位是把这套专家级计算建模能力做成 agentic research engine。

### 评测覆盖多个学科，而不是单一 demo

Google 称 ERA 在 Nature 论文中被测试于 genomics、public health、satellite imagery analysis、neuroscience prediction、time-series forecasting 和 mathematics 等领域。文章还列出五个新增应用：流感/COVID/RSV 住院预测、加州融雪径流预测、CO2 浓度映射、3D 太阳能结构优化、零售预测。

这里对知识库最有价值的是：ERA 把“代码生成”从软件工程扩展为科学建模基础设施。

### Computational Discovery 是假设测试机器

Google 将 Computational Discovery 描述为由 AlphaEvolve 和 ERA 构建的工具：生成并评分大量代码变体，帮助科学家探索本来需要数月才能手工尝试的建模方向。

这与 [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]] 一脉相承：AI coding agent 的最高价值不是自动补全，而是把“可执行实验空间”扩大很多倍。

## 可复用观点

- 科学智能体需要两类能力：提出假设的能力，以及把假设转化为可运行实验的能力。
- Coding agent 的迁移价值不止在软件开发，它正在成为经验科学的实验引擎。
- 成功度量是关键接口：给 agent 一个问题还不够，还要给它可优化的衡量标准。
- 让 agent 生成大量代码变体并自动评分，本质是把研究从“手工试错”升级为“可计算搜索”。

## 可加工为公众号角度

- 科研 agent 的核心不是写论文，而是把实验迭代速度提高一个数量级。
- 真正强的 coding agent，不只是帮工程师写代码，也会帮科学家构造实验空间。
- 高价值工作流要把“成功度量”前置，否则 agent 只能给建议，不能迭代。

## 关联笔记

- 已加工成稿：[[2026-05-20 科学智能体不是博士替身，而是研究流水线]]
- [[Co-Scientist A multi-agent AI partner to accelerate research]]
- [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- [[2026-05-12 Agent 不会靠提示词变可靠]]
