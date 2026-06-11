---
title: "Your Agents Are Aging Too: Agent Lifespan Engineering for Deployed Systems"
source: "https://arxiv.org/abs/2605.26302"
arxiv_id: "2605.26302"
authors:
  - "Jianing Zhu"
  - "Yeonju Ro"
  - "John Robertson"
  - "Kevin Wang"
  - "Junbo Li"
  - "Haris Vikalo"
  - "Aditya Akella"
  - "Zhangyang Wang"
submitted: 2026-05-25
published: 2026-05-25
created: 2026-05-28
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.MA"
description: "提出 Agent Lifespan Engineering 与 AgingBench，把长期运行 agent 的可靠性定义为 lifespan property；诊断 compression aging、interference aging、revision aging、maintenance aging 四类老化机制。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evals"
  - "agent-memory"
  - "agent-reliability"
  - "harness"
---

# Your Agents Are Aging Too: Agent Lifespan Engineering for Deployed Systems

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.26302>
- 提交时间：2026-05-25（v1）
- 作者：Jianing Zhu, Yeonju Ro, John Robertson, Kevin Wang, Junbo Li, Haris Vikalo, Aditya Akella, Zhangyang Wang
- 分类：cs.AI / cs.CL / cs.MA

## 研究问题

长期运行的 agent 已经越来越像持续运营系统，但评测方式仍然像“刚初始化的新模型”：给一个任务，看 day-one 成功率。

论文提出的问题更接近生产现实：即使模型权重不变，agent 的有效状态也会因为历史压缩、memory 增长、事实修订和日常维护不断变化。因此可靠性不是一个静态模型属性，而是完整 agent harness 的 lifespan property。

## 方法概览

论文提出 AgingBench，用纵向评测衡量 agent 在 8 到 200 个 session 之间是否退化、如何退化、应该修哪一段。

AgingBench 将 agent aging 分为四类机制：

- compression aging：历史压缩造成关键信息丢失或变形；
- interference aging：越来越多 memory 之间互相干扰；
- revision aging：旧事实更新后，agent 仍沿用过时状态；
- maintenance aging：例行维护或自我整理引入新的不一致。

诊断上，它使用 temporal dependency graphs 和 paired counterfactual probes，定位问题发生在 write、retrieval 还是 utilization 阶段。

## 关键贡献

### 1) 把可靠性从“快照评测”推进到“寿命评测”

论文最重要的贡献是提出 agent lifespan engineering：上线后可靠性要看随时间演化，而不是只看初始化后的 benchmark。

### 2) 证明老化不是单一曲线

论文摘要中提到，行为测试可能仍然干净，但 factual precision 已经下降；同一个错误答案背后，也可能是写入、检索或使用阶段的不同故障。这提醒我们不能只看最终答案。

### 3) 给 memory pipeline 提供阶段化修复视角

如果问题出在 write，应该改写入门禁；如果出在 retrieval，应该改索引和召回；如果出在 utilization，应该改 context constructor 或 reasoning policy。这个分层与知识库中“薄 harness、厚 skills、强验证”的路线一致。

## 与知识库主题的关系

- 与 [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]] 相邻，但视角不同：旧稿讲经验进入系统前的门禁，这篇讲系统运行一段时间后的寿命诊断。
- 与 [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]] 同线：可靠性是 harness-level property。
- 与 [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]] 互补：LongMemEval-V2 评证据提取能力，AgingBench 评长期状态退化。

## 可复用观点

- Agent 上线不是结束，而是可靠性曲线的开始。
- 只做 day-one benchmark 会漏掉 compression、interference、revision 和 maintenance 引发的慢性故障。
- 生产级 agent 要有寿命体检：周期性 replay、counterfactual probes、memory pipeline 分段诊断和 stage-targeted repair。

## 可加工为公众号角度

- 可成稿：别只问 Agent 今天能不能做对，要问它运行 200 个 session 后还能不能少犯旧错。
- 可补充旧稿：[[2026-05-25 Agent 自我改进，不该只改提示词]]、[[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]

## 关联笔记

- 已加工成稿：[[2026-05-28 Agent 上线后，也会变老]]
- [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]
- [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]
- [[Memory-R2 Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents]]
- [[2026-05-25 Agent 自我改进，不该只改提示词]]
- [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
