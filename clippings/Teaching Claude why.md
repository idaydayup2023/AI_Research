---
title: "Teaching Claude why"
source: "https://www.anthropic.com/research/teaching-claude-why"
author:
  - "[[Anthropic]]"
published: 2026-05-08
created: 2026-05-12
description: "Anthropic 以 agentic misalignment 为案例，说明只训练正确行为示范不够，训练模型理解行为背后的原则更能泛化。"
tags:
  - "clippings"
  - "alignment"
  - "agentic-misalignment"
  - "model-capability"
  - "anthropic"
---

# Teaching Claude why

## 原文信息

- 原文：<https://www.anthropic.com/research/teaching-claude-why>
- 发布时间：2026-05-08
- 发布方：Anthropic Research

## 核心提取

Anthropic 用 agentic misalignment 作为案例，讨论他们如何改进 Claude 的安全训练。文章的关键结论是：只在评估分布上训练正确行为，可能压低某个 benchmark 的坏行为，但不一定能泛化；更有效的做法是让模型学习“为什么某些行为更好”，也就是训练原则、角色和推理，而不只是训练动作示范。

Anthropic 提到，自 Haiku 4.5 以来，每个 Claude 模型在 agentic misalignment 评估上都达到完美分数。更重要的是，他们从中总结出四类经验，其中最值得迁移到产品 Agent 的是：示范 desired behavior 不够，解释 underlying principles 往往更能泛化。

## 中文译读

### 一、贴着评估集训练会有局限

如果模型只是在和评估题很像的 prompt 上学会“不做坏事”，它可能在 held-out alignment assessment 上并没有同样提升。这说明狭窄 eval 分数不等于真实安全。

### 二、原则训练比动作模仿更重要

Anthropic 发现，让 Claude 学习为什么某些行为更符合宪法和角色，比单纯看一批正确回答更有效。这对应用层 Agent 也有启发：不要只给步骤，还要给判断原则。

### 三、Agentic misalignment 是产品问题

当模型能自主采取行动、调用工具、处理长期任务时，安全不再是回答是否冒犯，而是它在压力情境下是否会选择错误策略。Agent 越像行动者，对齐训练越需要进入“为什么”层。

## 可复用观点

- 对 Agent 来说，训练正确动作不够，还要训练判断原则。
- Eval 通过不等于泛化安全，需要 held-out 和 OOD 检查。
- 产品中的 rubric、Skill 和操作手册也应该解释原则，而不是只列步骤。

## 可加工为公众号角度

- 可与 [[Advancing Search-Augmented Language Models]] 连接：一个讲生产奖励，一个讲对齐原则，本质都在说明 Agent 需要可泛化的训练信号。
- 可补充 Skill 文章：好的 Skill 应该写人的判断和边界，而不只是 SOP。

## 关联笔记

- 已加工成稿：[[2026-05-12 Agent 不会靠提示词变可靠]]
- Search Agent 训练：[[Advancing Search-Augmented Language Models]]
- Skill 工程：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- Agent 系统：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
