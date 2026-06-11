---
title: "Learning When Not to Act: Mitigating Tool Abuse in Agentic Reinforcement Learning"
source: "https://arxiv.org/abs/2606.02132"
arxiv_id: "2606.02132"
authors: "Liuji Chen; Dianxing Tang; Xing Shi; Dingshuo Chen; Qiang Liu; Shu Wu; Liang Wang"
submitted: "2026-06-01"
created: "2026-06-03"
categories:
  - "cs.AI"
description: "提出 EAPO，通过 tool-free trajectories、difficulty-aware reward shaping 和 confidence-aware token reweighting 缓解 Agentic RL 中的工具滥用。"
tags:
  - "clippings"
  - "arxiv"
  - "tool-use"
  - "agent-rl"
  - "cost-optimization"
---

# Learning When Not to Act: Mitigating Tool Abuse in Agentic Reinforcement Learning

## 论文信息

- arXiv：https://arxiv.org/abs/2606.02132
- 提交时间：2026-06-01
- 分类：cs.AI
- 作者：Liuji Chen 等

## 研究问题

Agentic RL 可能诱导工具滥用：模型即使面对可以靠内部推理解决的问题，也会过度调用外部工具。简单的统一惩罚或硬限制虽然能减少工具调用，但可能同时压制真正有价值的工具辅助探索。

## 方法概览

论文提出 EAPO。核心做法包括：在每个 rollout group 中加入 tool-free trajectories；对较简单问题用 difficulty-aware reward shaping 重点惩罚冗余工具调用；用 confidence-aware token reweighting 改善策略学习。

## 关键贡献

- 将工具使用优化从“少用工具”改成“该不用时不用，该用时仍能用”。
- 在多个数学和知识密集推理 benchmark 上改善 accuracy-efficiency trade-off。
- 表明工具预算可以作为训练信号，而不是只靠推理时硬限制。

## 与知识库主题的关系

这篇直接补强 [[2026-05-29 Agent 不该拼命干活，要学会花预算]]：预算纪律不只是 runtime router，也可以进入 RL 训练过程。它还补充 [[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]：冗余不只发生在步骤层，也发生在工具调用层。

## 可复用观点

- 工具调用不是 Agent 能力的同义词，过度调用工具是一种训练出来的坏习惯。
- 工具预算应按问题难度和模型置信度调节，而不是统一惩罚。
- “学会不行动”是 Agent cost optimization 的核心能力。

## 可加工为公众号角度

- 可补充预算纪律稿：从 inference-time routing 延展到 training-time tool discipline。
- 可与 Harness-1 合并成“工具预算也应外置成可学习、可审计的系统信号”。

## 关联笔记

- 已加工成稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- [[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]
- [[Thinking as Compression Your Reasoning Model is Secretly a Context Compressor]]
