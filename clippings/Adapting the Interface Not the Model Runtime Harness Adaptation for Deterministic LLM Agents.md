---
title: "Adapting the Interface, Not the Model: Runtime Harness Adaptation for Deterministic LLM Agents"
source: "https://arxiv.org/abs/2605.22166"
arxiv_id: "2605.22166"
authors:
  - "Tianshi Xu"
  - "Huifeng Wen"
  - "Meng Li"
submitted: 2026-05-21
created: 2026-05-25
categories:
  - "cs.AI"
description: "提出 Life-Harness：不改模型权重，也不改评测环境，而是从失败轨迹中演化 runtime harness 介入点，改善确定性环境中的 agent 表现。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "runtime"
  - "agent-evaluation"
  - "tool-use"
---

# Adapting the Interface, Not the Model: Runtime Harness Adaptation for Deterministic LLM Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.22166>
- 提交时间：2026-05-21
- 作者：Tianshi Xu, Huifeng Wen, Meng Li
- 状态：Work in progress

## 研究问题

LLM agent 的失败不一定来自模型能力不足，也可能来自模型和环境之间的接口错配。确定性、规则明确的任务里，模型经常因为 observation 表达、工具契约、动作落地、轨迹调节等 interface 问题失败。

论文的问题是：能不能在不微调模型、不改变评测环境的前提下，通过适配 runtime harness 来提升 frozen LLM agent？

## 方法概览

作者提出 Life-Harness，一个 lifecycle-aware runtime harness。它从训练轨迹里提取 recurring interaction failures，并把这些失败转成可复用的 runtime interventions，主要覆盖四类：

- environment contracts：让环境约束更清晰地进入 agent 可读界面。
- procedural skills：把反复出现的任务步骤固化为流程。
- action realization：改善模型动作到真实环境动作之间的落地方式。
- trajectory regulation：调节中间轨迹，减少偏航和无效循环。

这些 harness interventions 在 held-out evaluation 时保持固定，避免把评测环境本身改掉。

## 关键贡献

- 把 agent adaptation 的重心从模型参数转向 model-environment interface。
- 在 tau-bench、tau2-bench、AgentBench 的 7 个确定性环境上，改善 116/126 个 model-environment settings。
- 平均相对提升 88.5%。
- 只用 Qwen3-4B-Instruct 轨迹演化出的 harness，可以迁移到另外 17 个模型，说明它捕获的是环境侧结构，而不是某个模型的行为习惯。

## 与知识库主题的关系

这篇论文是 [[The Anatomy of an Agent Harness]] 的直接研究化补充：harness 不只是运行 loop 的壳，而是 observation、tool use、action execution、feedback interpretation 和 trajectory control 的中介层。

它也补强 [[Thin Harness, Fat Skills]] 的边界：harness 应该薄，但薄不等于不可学习。真正应该变厚的不是控制流本身，而是那些可复用、可验证、可迁移的接口适配规则。

## 可复用观点

- 很多 agent 失败不是“模型不会”，而是“接口没把任务说成人能做、模型能执行的形态”。
- 不改模型也能改表现，关键是改 observation、动作落地和反馈解释。
- Runtime harness 可以像 adapter 一样，把环境侧结构变成模型可稳定利用的结构。
- 如果 harness adaptation 能跨模型迁移，它就更像系统知识，而不是模型补丁。

## 可加工为公众号角度

- Agent 上生产后，第一件事不是继续调 prompt，而是检查接口是否让模型误解环境。
- Harness adaptation 是“改界面，不改大脑”的 agent 工程。
- 可靠 agent 的升级对象不只有模型，还有模型与世界之间的翻译层。

## 关联笔记

- 历史文摘：[[The Anatomy of an Agent Harness]]、[[Thin Harness, Fat Skills]]、[[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]
- 相关论文：[[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]]
- 相关旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]、[[2026-05-12 Agent 不会靠提示词变可靠]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- 已加工成稿：[[2026-05-25 Agent 自我改进，不该只改提示词]]
- 已加工成稿：[[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
