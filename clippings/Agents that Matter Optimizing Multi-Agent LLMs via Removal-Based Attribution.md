---
title: "Agents that Matter: Optimizing Multi-Agent LLMs via Removal-Based Attribution"
source: "https://arxiv.org/abs/2605.27621"
arxiv_id: "2605.27621"
authors:
  - "Mingyu Lu"
  - "Yushan Huang"
  - "Chris Lin"
  - "Su-In Lee"
submitted: 2026-05-26
created: 2026-05-29
categories:
  - "cs.MA"
  - "cs.CL"
description: "把多 Agent 系统中的个体贡献归因为 cooperative game，使用 removal-based attribution 找到瓶颈 agent，并通过替换低贡献 agent 降成本提性能。"
tags:
  - "clippings"
  - "arxiv"
  - "multi-agent"
  - "agent-evals"
  - "cost-optimization"
  - "orchestration"
---

# Agents that Matter: Optimizing Multi-Agent LLMs via Removal-Based Attribution

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.27621>
- 提交时间：2026-05-26（v1）
- 作者：Mingyu Lu, Yushan Huang, Chris Lin, Su-In Lee
- 分类：cs.MA, cs.CL

## 研究问题

多 Agent LLM 系统越来越复杂，但团队经常不知道每个 agent 到底贡献了什么。没有严谨 credit assignment，就很难判断某个角色是瓶颈、冗余、负贡献，还是只是在某些指标上有用。

## 方法概览

论文把 agent attribution 形式化为 cooperative game，并明确三个变量：coalition distribution、removal protocol、target metric。作者发现 Leave-One-Out 能以低得多的计算成本识别 bottleneck agents，效果接近组合方法。

论文还区分了不同 removal protocols：agent ablation 能隔离结构性瓶颈，但让 LLM 自省判断贡献并不能可靠近似真实行为。作者进一步提出 model replacement：替换低贡献 agent 的底层模型，在三个 benchmark 上最多提升 17% 性能，同时最多降低 35% 成本。

## 关键贡献

- 给多 Agent 角色贡献提供了统一归因框架，而不是靠观察日志或主观判断。
- 证明简单 Leave-One-Out 在识别瓶颈 agent 时具有实用价值。
- 说明“让 LLM 评自己贡献”不可靠，真实贡献要通过系统行为变化来测。
- 把 agent attribution 连接到成本优化：低贡献角色可以换模型、改角色或删掉。
- 在医疗 MAS 审计中发现诊断准确率和伦理行为贡献可能解耦。

## 与知识库主题的关系

这篇补充 [[Agent Harness 与多 Agent 编排]] 中“多 Agent 不是越多越好”的治理视角。它和 [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]、[[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]] 都在回答同一个问题：当系统由多个 agent 互动产生结果时，问题不能只归因到最终答案。

它也能补强 [[2026-05-28 AI coding 的质量门，要前移到计划层]]：计划层之外，还需要角色层质量门，判断每个 agent 是否真的值得存在。

## 可复用观点

- 多 Agent 系统应定期做角色审计：谁贡献结果、谁制造成本、谁引入风险。
- 不要相信 agent 对自身贡献的自我解释；看 removal 后系统表现如何变化。
- 降成本不一定靠整体降级模型，而是把低贡献角色替换、合并或删除。
- 多指标归因很重要：一个 agent 对准确率有贡献，不代表对安全、伦理、可解释性也有贡献。

## 可加工为公众号角度

- 新角度候选：多 Agent 系统要先问“谁真的有用”，再问“要不要再加一个 agent”。
- 可合并素材：[[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]、[[Introducing Claude Opus 4.8]]。
- 可补充旧稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]。

## 关联笔记

- [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- [[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]
- [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]
- [[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
- 已加工成稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]
