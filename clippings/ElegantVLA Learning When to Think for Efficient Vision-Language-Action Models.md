---
title: "ElegantVLA: Learning When to Think for Efficient Vision-Language-Action Models"
source: "https://arxiv.org/abs/2605.29438"
arxiv_id: "2605.29438"
authors:
  - "Ye Li"
  - "Huanan Liu"
  - "Kangye Ji"
  - "Yuan Meng"
  - "Jiajun Fan"
  - "Yuansong Wang"
  - "Shiyu Qin"
  - "Chenglei Wu"
  - "Shu-Tao Xia"
  - "Zhi Wang"
submitted: 2026-05-28
created: 2026-05-30
categories:
  - "cs.RO"
description: "提出 ElegantVLA，一个面向 VLA 模型的 phase-adaptive inference 框架，让机器人在关键阶段花完整计算，在稳定阶段复用先前计算。"
tags:
  - "clippings"
  - "arxiv"
  - "robotics"
  - "vla"
  - "inference-optimization"
  - "model-serving"
  - "agent-budget"
---

# ElegantVLA: Learning When to Think for Efficient Vision-Language-Action Models

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.29438>
- 提交时间：2026-05-28（v1）
- 作者：Ye Li, Huanan Liu, Kangye Ji, Yuan Meng, Jiajun Fan, Yuansong Wang, Shiyu Qin, Chenglei Wu, Shu-Tao Xia, Zhi Wang
- 分类：cs.RO

## 研究问题

Vision-Language-Action（VLA）模型把视觉、语言和动作连接起来，是机器人控制的重要方向。但大视觉语言 backbone 和迭代式 action head 在每个控制步都完整运行，会带来高计算成本和低控制频率。已有加速方法多优化单个组件或采用固定规则，忽略了 embodied control 中不同阶段的计算需求并不均匀。

论文的核心问题是：机器人什么时候应该认真“想”，什么时候可以复用已有计算？

## 方法概览

作者提出 ElegantVLA，一个 plug-in phase-adaptive inference 框架。它不修改或重训 base model，而是在推理时加入轻量 scheduler，根据 temporal representation similarity、robot-motion cues 和 episode progress，在 vision encoder、LLM 和 action head 之间动态分配计算。

对 perception-language reasoning，scheduler 在五种 Vision-LLM compute mode 中选择，从完整重算到多步 temporal reuse。对 action generation，scheduler 在三种 denoising mode 中选择，在稳定运动阶段复用中间 denoising states，在目标敏感阶段保留完整 refinement。

实验报告在 GR00T 和 CogACT 上分别达到最高 2.55x 和 3.77x speedup；在六个真实 GR00T 任务中，计算量降低 2.18x，控制频率从 13.8 Hz 提升到 26.3 Hz。

## 关键贡献

- 把 VLA 推理成本从固定预算改为 phase-adaptive compute scheduling。
- 同时调度视觉编码、语言推理和动作生成，而不是只优化单个模块。
- 不需要修改或重训 base model，工程迁移性较强。
- 把“何时思考”从语言 agent 扩展到 embodied agent 的实时控制问题。

## 与知识库主题的关系

这篇把 [[2026-05-29 Agent 不该拼命干活，要学会花预算]] 的预算纪律迁移到机器人场景。语言 agent 的 effort routing 关注 token、并发和上下文；VLA agent 的 effort routing 还要关注控制频率、运动阶段、稳定性和实时计算。

它也呼应 Google / DeepMind 对 Gemini Robotics 的叙事：物理 agent 不只是能理解任务，还要在行动过程中动态判断什么时候需要更重的推理。

## 可复用观点

- “什么时候想”本身是 agent 产品能力，不只是模型内部优化。
- 实时 agent 不能每一步都用最高计算；关键阶段和稳定阶段需要不同预算。
- 计算调度可以成为 embodied agent 的安全和可靠性接口：高风险阶段保留完整推理，稳定阶段复用。
- 语言 agent、coding agent 和 robotics agent 都在走向同一个问题：把 effort 做成动态路由。

## 可加工为公众号角度

- 新角度候选：真正聪明的 Agent，不是每一步都深思熟虑，而是知道什么时候该想。
- 可合并素材：[[Introducing Claude Opus 4.8]]、[[Thinking as Compression Your Reasoning Model is Secretly a Context Compressor]]。
- 可补充旧稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]。

## 关联笔记

- [[Towards Long-horizon Embodied Agents with Tool-Aligned Vision-Language-Action Models]]
- [[Gemini 3.5 frontier intelligence with action]]
- [[New ways to balance cost and reliability in the Gemini API]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
