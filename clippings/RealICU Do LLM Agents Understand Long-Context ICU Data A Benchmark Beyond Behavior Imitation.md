---
title: "RealICU: Do LLM Agents Understand Long-Context ICU Data? A Benchmark Beyond Behavior Imitation"
source: "arXiv"
arxiv_id: "2605.13542"
authors:
  - "Chengzhi Shen"
  - "Weixiang Shen"
  - "Tobias Susetzky"
  - "Chen (Cherise)Chen"
  - "Jun Li"
  - "Yuyuan Liu"
  - "Xuepeng Zhang"
  - "Zhenyu Gong"
  - "Daniel Rueckert"
  - "Jiazhen Pan"
published: "2026-05-13"
submitted: "Wed, 13 May 2026 13:52:42 UTC"
created: "2026-05-15"
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.LG"
  - "cs.MA"
description: "A benchmark studying whether LLM agents can understand long-context ICU streams beyond behavior imitation."
tags:
  - agents
  - evaluation
  - long-context
  - memory
  - benchmark
  - reliability
---

## 论文信息

- 标题：RealICU: Do LLM Agents Understand Long-Context ICU Data? A Benchmark Beyond Behavior Imitation
- arXiv：https://arxiv.org/abs/2605.13542
- 分类：cs.AI / cs.CL / cs.LG / cs.MA
- v1 提交时间：Wed, 13 May 2026 13:52:42 UTC

## 研究问题（作者在解决什么）

ICU 场景会产生**长、密集、持续演化**的临床信息流。作者关心的是：LLM agent 在这种长上下文里，是否真的“理解并能做决策支持”，还是只是在**模仿历史行为**（behavior imitation）。

## 方法概览（读 abstract 的结构化理解）

- 以 ICU 的长时间序列信息为背景，构建用于评估 LLM agent 的基准（benchmark）。
- 强调“超越行为模仿”的评估目标：不仅看模型能否复现某些动作/建议，更看其对长上下文信息的理解与持续推理能力。

## 关键贡献（对我最有用的点）

- **把 long-context 能力落到可评测对象**：相比泛化的“长上下文很重要”，这种面向真实高噪声信息流的 benchmark 更贴近 agent 可靠性问题。
- **把“理解”与“模仿”区分开**：对 agent 来说，能复刻动作不代表能解释/纠错/持续更新判断；基准如果能逼出这种差异，会对产品落地更有价值。

## 与知识库主题的关系

- 与“agent 可靠性”“长期记忆/长上下文”“评测与证据链”高度相关：这是把抽象能力讨论拉回工程指标的一类材料。

## 可复用观点

- **长上下文不是卖点，是风险暴露器**：上下文越长，越容易出现“看起来像理解、其实是拟合”的错觉；因此评测要能区分“行为相似”与“状态理解”。  
- **评测要逼近真实信息形态**：真实业务里的“上下文”往往不是一段漂亮的文档，而是带噪、缺失、时间演化的记录流。

## 可加工为公众号角度（候选）

- 角度：你以为 agent 记得很久，其实只是“在更长的上下文里更会装懂”

## 关联笔记

- [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]
- [[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]
- 已加工成稿：[[2026-05-15 长上下文不是长期记忆：先把它评测成能用的]]
