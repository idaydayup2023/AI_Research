---
title: "Towards Long-horizon Embodied Agents with Tool-Aligned Vision-Language-Action Models"
source: "arXiv"
arxiv_id: "2605.13119"
authors:
  - "Zixing Lei"
  - "Changxing Liu"
  - "Yichen Xiong"
  - "Minhao Xiong"
  - "Yuanzhuo Ding"
  - "Zhipeng Zhang"
  - "Weixin Li"
  - "Siheng Chen"
published: "2026-05-13"
submitted: "Wed, 13 May 2026 07:40:34 UTC"
created: "2026-05-15"
categories:
  - "cs.RO"
  - "cs.AI"
  - "cs.CV"
description: "Proposes treating VLA models as tools (VLAs-as-Tools) to handle long-horizon embodied tasks by distributing planning/operation burden."
tags:
  - robotics
  - embodied-agents
  - tool-use
  - planning
  - long-horizon
---

## 论文信息

- 标题：Towards Long-horizon Embodied Agents with Tool-Aligned Vision-Language-Action Models
- arXiv：https://arxiv.org/abs/2605.13119
- 分类：cs.RO / cs.AI / cs.CV
- v1 提交时间：Wed, 13 May 2026 07:40:34 UTC

## 研究问题（作者在解决什么）

Vision-language-action（VLA）模型擅长做动作执行，但在 long-horizon 任务上会同时背负：

- 长时间闭环规划（extended closed-loop planning）
- 多样物理操作（diverse physical operations）

作者想降低这种“双重负担”，让 embodied agent 更能做长任务。

## 方法概览（读 abstract 的结构化理解）

- 提出 **VLAs-as-Tools**：把 VLA 当作“可调用工具”，把规划与执行负担分摊到更可组合的结构中，而不是让单个 VLA 承担全流程。

## 关键贡献（对我最有用的点）

- **把 embodied agent 的难题翻译成 tool-use 语言**：这与软件 agent 的工程直觉一致——当任务跨度变长，把能力拆成可调用工具更容易扩展与评测。
- **长任务的瓶颈往往是“组织方式”，而不是单点模型能力**：abstract 的叙述把问题归因为结构性负担，而非单纯“模型还不够大/数据不够多”。这种 framing 值得借鉴到产品架构讨论里。

## 与知识库主题的关系

- 与“tool use / agent harness / skills”同构：机器人领域在把“能力模块化”，为软件 agent 的工程化提供了一个外部参照系。

## 可复用观点

- **把大模型当工具，不是降级，而是扩展**：当你需要长时程任务，工具化更容易带来可控的执行轨迹与可替换部件。

## 可加工为公众号角度（候选）

- 角度：机器人在用“工具化”解决长任务，软件 agent 反而还在纠结“一个超强模型包打天下”

## 关联笔记

- [[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]

