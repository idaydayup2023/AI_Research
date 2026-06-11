---
title: "Measuring the impact of learning with AI in Sierra Leone and beyond"
source: "https://deepmind.google/blog/measuring-the-impact-of-learning-with-ai-in-sierra-leone-and-beyond"
author: "Zoubin Ghahramani"
published: 2026-06-09
created: 2026-06-10
description: "Google DeepMind 公布一项覆盖 1,763 名学生的预注册随机对照试验：教师主导的 Gemini Guided Learning 在八周内显著提高数学成绩，同时暴露收益分配不均的问题。"
tags:
  - "clippings"
  - "google-deepmind"
  - "ai-evaluation"
  - "education"
  - "human-ai-collaboration"
---

# Measuring the impact of learning with AI in Sierra Leone and beyond

## 原文信息

- 原文：<https://deepmind.google/blog/measuring-the-impact-of-learning-with-ai-in-sierra-leone-and-beyond>
- 发布：2026-06-09
- 作者：Zoubin Ghahramani
- 类型：Google DeepMind 责任与安全研究 / 真实场景随机对照试验

## 核心提取

Google DeepMind 与 Fab AI、塞拉利昂教育部门合作，在 12 所学校、1,763 名初中学生中开展了为期八周的预注册随机对照试验。研究不是只看 Gemini 的回答质量或使用次数，而是把学生数学成绩作为主要结果指标。

试验报告的关键结果包括：

- 使用 Guided Learning 的学生相对对照组提高了 0.258 个标准差；
- 达到约 12 小时使用目标的课堂收益更高；
- 113,000 多次交互中，91.4% 被归为概念理解型对话；
- Gemini 在 76% 的消息中使用支架式提问，直接给答案的比例只有 2%；
- 学生的技能构建型问题从首周 68% 上升到末周 90%；
- 基础较好的学生受益更多，说明总体平均收益不能掩盖分配差异。

## 中文译读

这项研究最值得迁移的不是“AI 教育有效”这个口号，而是它把产品机制、过程行为和最终结果分开测量。

产品机制是 Guided Learning 不直接充当答案引擎，而是用追问和分步支架保留学生的认知劳动。过程行为是学生究竟在寻求答案还是建立技能。最终结果则是预注册 RCT 中的数学成绩变化。

三层证据能够互相校验：如果只看使用时长，无法证明学习发生；如果只看对话风格，无法证明成绩改善；如果只看平均分，又可能看不到不同基础学生之间的收益差异。

## 可复用观点

- AI 项目评估应区分使用量、过程行为与真实结果，不能把 adoption 当 impact。
- 机制指标必须能解释结果指标，例如支架式提问是否真的保留了用户的认知劳动。
- 平均收益之外还要报告谁受益、谁没有受益，避免总体提升掩盖差距扩大。
- 人机协作项目的有效性可能来自“教师设计目标 + AI 个性化支架”，而不是模型替代专业角色。

## 可加工为公众号角度

- `AI 项目别先晒调用量，先证明它改变了结果`。
- 可与 [[Evaluation Cards An Interpretive Layer for AI Evaluation Reporting]] 合并，讨论企业 AI 试点需要一张可解释的评价卡。
- 暂不单独成稿：今天更强的突破口是 Agent 修订协议；本篇适合后续与企业采用数据、evaluation cards 合并成“从 adoption 到 impact”的文章。

## 关联笔记

- [[Evaluation Cards An Interpretive Layer for AI Evaluation Reporting]]
- [[Review Arcade On the Human Alignment and Gameability of LLM Reviews]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]

