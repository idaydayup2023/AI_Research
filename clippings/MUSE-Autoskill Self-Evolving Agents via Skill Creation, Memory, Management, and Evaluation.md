---
title: "MUSE-Autoskill: Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation"
source: "https://arxiv.org/abs/2605.27366"
arxiv_id: "2605.27366"
authors:
  - "Huawei Lin"
  - "Peng Li"
  - "Jie Song"
  - "Fuxin Jiang"
  - "Tieying Zhang"
published: 2026-05-27
submitted: 2026-05-27
created: 2026-05-28
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.LG"
  - "cs.MA"
description: "提出 MUSE-Autoskill，把 agent skill 视为可创建、记忆、管理、评估和持续改进的长期资产，而非静态提示片段。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-skills"
  - "agent-memory"
  - "self-evolving-agents"
---

# MUSE-Autoskill: Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.27366>
- 提交时间：2026-05-27（v1）
- 作者：Huawei Lin, Peng Li, Jie Song, Fuxin Jiang, Tieying Zhang
- 分类：cs.AI / cs.CL / cs.LG / cs.MA

## 研究问题

现有 skill creation 方法常把 skill 当成孤立、静态的 artifact：生成一次、存起来、下次检索调用。但长期运行的 agent 需要 skill 能被创建、复用、管理、评估、修订，并随任务经验积累而变得更可靠。

论文提出的问题是：如果 skill 已经成为 agent 解决复杂任务的核心资产，是否应该给它完整生命周期，而不是只把它当 prompt 片段？

## 方法概览

MUSE-Autoskill（Memory-Utilizing Skill Evolution）把 skill 生命周期拆为 creation、memory、management、evaluation、refinement。Agent 可以按需创建 skill，跨任务存储与复用，组织和选择 skill，并通过单元测试与运行时反馈持续优化。

论文还提出 skill-level memory：每个 skill 自己积累跨任务经验，用于后续复用和适配，而不是把所有经验混在一个全局 memory 里。

## 关键贡献

- 把 skill 从静态文件升级为长期资产，有创建、调用、评估和修订闭环。
- 提出 skill-level memory，使经验沉淀和具体能力单元绑定。
- 用 SkillsBench 给出初步证据：生命周期管理后的 skill 有助于任务成功率、效率、复用和跨 agent transfer。

## 与知识库主题的关系

这篇论文与 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 高度相邻。Perplexity 的文章是工程手册：description、渐进加载、eval、gotchas。MUSE-Autoskill 则把同一方向形式化为 self-evolving framework，强调 skill lifecycle 和 skill-level memory。

它也补充了 [[CODESKILL Learning Self-Evolving Skills for Coding Agents]]：CODESKILL 更聚焦 coding trajectory 到 procedural skills，MUSE-Autoskill 更强调完整生命周期管理。

## 可复用观点

- Skill 不是提示词，而是长期能力资产。
- Skill 的质量来自生命周期管理：创建、复用、评估、修订、淘汰。
- 经验应尽量绑定到具体 skill，而不是全部写进全局 memory。
- 如果没有 evaluation 和 refinement，自动生成 skill 很容易变成“把旧错误长期化”。

## 可加工为公众号角度

- 可补充今日成稿：计划层决定“这次怎么做”，skill 生命周期决定“下次复用什么能力”。
- 可后续成稿：Agent 的能力库也需要资产负债表，不能只看 skill 数量。

## 关联笔记

- 已加工成稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]
- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[CODESKILL Learning Self-Evolving Skills for Coding Agents]]
- [[Trace2Skill Verifier-Guided Skill Evolution for Long-Context EDA Agents]]
- [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
