---
title: "Thinking as Compression: Your Reasoning Model is Secretly a Context Compressor"
source: "https://arxiv.org/abs/2605.28713"
arxiv_id: "2605.28713"
authors:
  - "Guoxin Ma"
  - "Yibing Liu"
  - "Chengzhengxu Li"
  - "Yu Liang"
  - "Yan Wang"
  - "Yueyang Zhang"
  - "Kecheng Chen"
  - "Zhaohan Zhang"
  - "Zhiyuan Sun"
  - "Daiting Shi"
submitted: 2026-05-27
created: 2026-05-29
categories:
  - "cs.AI"
description: "提出 Thinking as Compression，把 reasoning trace 作为压缩后的上下文，并用 reward-driven optimization 约束预算和 shortcut 行为。"
tags:
  - "clippings"
  - "arxiv"
  - "context-engineering"
  - "reasoning"
  - "context-compression"
  - "inference-optimization"
---

# Thinking as Compression: Your Reasoning Model is Secretly a Context Compressor

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.28713>
- 提交时间：2026-05-27（v1）
- 作者：Guoxin Ma, Yibing Liu, Chengzhengxu Li, Yu Liang, Yan Wang, Yueyang Zhang, Kecheng Chen, Zhaohan Zhang, Zhiyuan Sun, Daiting Shi
- 分类：cs.AI

## 研究问题

长上下文推理的一个核心问题是如何压缩上下文，降低推理成本，同时尽量不损失任务相关信息。已有方法通常依赖专门压缩模块或压缩训练，但论文提出：reasoning model 自身的 thinking trace 就可能天然是任务相关信息的压缩表示。

## 方法概览

作者提出 Thinking as Compression（TaC）：让 thinking model 生成 thinking traces，并把这些 traces 当作压缩后的上下文交给后续推理。进一步，作者提出 TaC-C，用 reward-driven optimization 控制 thinking trace 的长度、预算和 shortcut 行为。

在四个长上下文 QA benchmark 上，TaC-C 在 4x 和 8x 压缩率下超过已有强基线。论文报告其平均 F1 和 Exact Match 均显著领先最强对手。

## 关键贡献

- 把“思考过程”重新定义为 context compression，而不是只把 CoT 当解释或推理中间产物。
- 不依赖专门 compressor，直接利用 reasoning model 的信息组织能力。
- 指出 raw thinking 也有问题：预算不可控、可能走捷径，所以需要约束。
- 把 reasoning budget、compression ratio 和 downstream QA 表现放在同一个优化问题里。

## 与知识库主题的关系

这篇补充 [[推理系统、模型服务与成本]] 和 [[Agent Harness 与多 Agent 编排]]。它与 [[Query-Aware Context Compression for Better Snippets]]、[[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]] 形成上下文成本线索：上下文工程不只是检索多少内容，也包括如何把模型自己的中间组织结果变成可复用压缩表示。

它也能支撑“effort control”主题：如果 thinking 本身可以成为压缩器，那么 effort 不是简单多想，而是用受控思考重写上下文预算。

## 可复用观点

- 推理过程不一定只是生成答案前的成本，也可能是上下文压缩和信息重组资产。
- 长上下文不是全量塞入模型，而是把任务相关证据压成可控中间表示。
- Thinking trace 要进入工程系统，就必须有预算、约束和效果验收。
- Effort control 的底层问题是：多花的 token 是否真的变成了更好的信息组织。

## 可加工为公众号角度

- 新角度候选：别问模型想了多久，要问它把上下文压缩成了什么。
- 可合并素材：[[Introducing Claude Opus 4.8]]、[[Gemini 3.5 frontier intelligence with action]]。
- 可补充旧稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]、[[2026-05-15 长上下文不是长期记忆：先把它评测成能用的]]。

## 关联笔记

- [[Query-Aware Context Compression for Better Snippets]]
- [[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]
- [[New ways to balance cost and reliability in the Gemini API]]
- [[Token计算：下一个十年的成本战争]]
- [[2026-05-15 长上下文不是长期记忆：先把它评测成能用的]]
- 已加工成稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]
