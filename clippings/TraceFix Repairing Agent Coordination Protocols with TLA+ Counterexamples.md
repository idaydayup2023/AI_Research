---
title: "TraceFix: Repairing Agent Coordination Protocols with TLA+ Counterexamples"
source: "https://arxiv.org/abs/2605.07935"
arxiv_id: "2605.07935"
authors:
  - "Shuren Xia"
  - "Qiwei Li"
  - "Taqiya Ehsan"
  - "Jorge Ortiz"
submitted: 2026-05
created: 2026-05-12
categories:
  - "cs.AI"
  - "cs.MA"
description: "提出 TraceFix，用 TLA+ counterexamples 修复 LLM multi-agent coordination protocols，并通过 runtime monitor 约束执行。"
tags:
  - "clippings"
  - "arxiv"
  - "multiagent"
  - "formal-verification"
  - "agent-harness"
---

# TraceFix: Repairing Agent Coordination Protocols with TLA+ Counterexamples

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.07935>
- 提交时间：2026-05
- 作者：Shuren Xia, Qiwei Li, Taqiya Ehsan, Jorge Ortiz

## 研究问题

多 Agent 系统的难点不只是任务拆分，还包括协议是否会死锁、是否违反拓扑、在模型能力下降或故障注入时是否仍然稳定。

TraceFix 试图把形式化验证引入 LLM multi-agent coordination：让 agent 生成 protocol topology 和 PlusCal coordination logic，再用 TLA+ model checker 找 counterexamples，并迭代修复协议。

## 方法概览

TraceFix 先把任务描述转成结构化 IR，再生成协调逻辑。TLA+ 的 TLC model checker 会检查协议；如果出现 counterexample，系统用反例修复协议，直到验证通过。最终 verified process bodies 会被编译成各 agent 的 system prompts，并由 runtime monitor 拒绝越界协作操作。

论文报告称，在 48 个任务中全部达到 TLC verification；runtime 对比中，topology-monitored execution 的任务完成率最高，并能显著降低 deadlock/livelock。

## 与知识库主题的关系

这篇论文直接补强 [[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]] 和 [[同步阻塞 vs 异步编排：Hermes  Delegate 与 OpenClaw 多 Agent 机制深度实战对比]]：多 Agent 编排不能只靠 prompt 约定，需要协议、验证和 runtime 约束。

它也延续了 [[2026-05-11 Agent 产品的护城河正在变成系统工程]] 的主线：可靠 Agent 的护城河在系统工程，而不是“更聪明的单模型”。

## 可复用观点

- 多 Agent 系统需要 verification-first，而不是 prompt-first。
- 协议拓扑、system prompt 和 runtime monitor 可以形成闭环。
- TLA+ counterexamples 可以作为修复 agent coordination 的高质量反馈。
- 对复杂工作流来说，可靠性来自“允许哪些协作、不允许哪些协作”的显式边界。

## 可加工为公众号角度

- 多 Agent 编排的下一步：从角色扮演到协议验证。
- 为什么 Claude/Perplexity 的 agent 系统还需要形式化约束。
- 可与 [[2026-05-11 Agent 产品的护城河正在变成系统工程]] 合并扩展。

## 关联笔记

- 多 Agent 编排：[[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]]、[[同步阻塞 vs 异步编排：Hermes  Delegate 与 OpenClaw 多 Agent 机制深度实战对比]]
- Harness 底座：[[The Anatomy of an Agent Harness]]
- 相关旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- Claude 多 Agent：[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
