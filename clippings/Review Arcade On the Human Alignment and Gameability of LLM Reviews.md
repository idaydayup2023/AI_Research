---
title: "Review Arcade: On the Human Alignment and Gameability of LLM Reviews"
source: "arXiv"
arxiv_id: "2605.28897"
authors: "Hans Ole Hatzel, Sebastian Steindl, Jan Strich"
submitted: "2026-05-27"
created: "2026-06-01"
categories:
  - "cs.AI"
  - "cs.MA"
description: "研究 LLM 生成论文审稿与人类审稿的一致性，以及作者是否能通过迭代修改来博弈 LLM 审稿。"
tags:
  - "arxiv"
  - "llm-review"
  - "evaluation"
  - "content-workflow"
  - "multi-agent"
---

# Review Arcade: On the Human Alignment and Gameability of LLM Reviews

## 论文信息

- 原文链接：https://arxiv.org/abs/2605.28897
- 提交日期：2026-05-27
- 作者：Hans Ole Hatzel, Sebastian Steindl, Jan Strich
- 类别：cs.AI, cs.MA

## 研究问题

LLM 生成审稿正在进入学术会议流程。问题不只是“LLM 审稿准不准”，还包括另一面：如果作者也用 LLM 根据审稿意见迭代修改，是否会出现针对 LLM reviewer 的博弈？

这篇论文把 LLM review 同时放在 reviewer 和 author 两个视角下看，适合迁移到内容生产、代码审查、自动化主编审稿等工作流。

## 方法概览

作者使用 2025 ACL Rolling Review 的论文数据，比较 LLM review 与人类 review 的一致性，并模拟作者根据 LLM review 反复修改投稿文本的场景。

论文关注两个问题：

- LLM review 与人类 review 的对齐程度如何，是否受 prompt 和模型影响。
- 作者能否通过迭代 draft-revise workflow 提升 LLM review 评分，从而“刷”自动审稿系统。

## 关键贡献

- 发现 LLM review 与人类 review 的对齐有限；最好情况下可以达到合理水平，但不同 prompt 和模型之间差异明显。
- 证明作者侧的迭代修改在某些场景中可以有效博弈 LLM review，并使部分论文评分显著提高。
- 这提示自动审稿不能只看一次性评分，还要关注审稿标准是否稳定、是否容易被表面优化攻击。

## 与知识库主题的关系

这篇可以补充当前知识库里的“质量门”主题，尤其是 [[2026-05-28 AI coding 的质量门，要前移到计划层]] 和自动化中的“主编审稿 + 自动修订”流程。

它提醒我们：一旦审稿单、评分器或 LLM judge 成为明确目标，作者或 agent 会优化文本去迎合这个目标。质量门因此需要反博弈设计，例如多视角审稿、随机化 rubric、证据级检查、人工抽样复核和历史一致性审计。

## 可复用观点

- 自动审稿不是中立裁判，它会变成作者优化的目标函数。
- LLM judge 的风险不只是假阴性/假阳性，还包括被 workflow 学会“刷分”。
- 内容生产自动化里，审稿单要推动真实质量提升，而不是诱导文章堆砌符合 rubric 的表面特征。

## 可加工为公众号角度

- 当 AI 开始审稿，写作者会学会讨好 AI。
- 质量门一旦可预测，就会变成刷分游戏。
- AI 审稿真正该防的不是不准，而是被流程反向训练。

目前暂不单独成稿：材料很有启发，但单篇证据仍偏学术审稿场景。后续可与 LLM judge、agent eval、主编审稿自动化、代码审查材料合并，写“AI 质量门会被博弈”。

## 关联笔记

- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
- [[2026-05-30 别让 Agent 白白烧掉反馈]]
- [[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]]
- [[Rubric-Grounded RL Structured Judge Rewards for Generalizable Reasoning]]
