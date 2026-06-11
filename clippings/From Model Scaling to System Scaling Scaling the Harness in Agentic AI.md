---
title: "From Model Scaling to System Scaling: Scaling the Harness in Agentic AI"
source: "https://arxiv.org/abs/2605.26112"
arxiv_id: "2605.26112"
authors:
  - "Shangding Gu"
submitted: 2026-05-25
created: 2026-05-27
categories:
  - "cs.AI"
  - "cs.LG"
description: "把 agentic AI 的下一阶段瓶颈定义为 system scaling：围绕 foundation model 的 memory、context、skills、orchestration、verification 和 governance 必须作为可评测、可优化的 harness 来扩展。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "system-scaling"
  - "context-engineering"
  - "agent-evals"
---

# From Model Scaling to System Scaling: Scaling the Harness in Agentic AI

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.26112>
- 提交时间：2026-05-25（v1）
- 作者：Shangding Gu
- 分类：cs.AI, cs.LG
- 代码/项目：论文页面提到 CheetahClaws：<https://github.com/SafeRL-Lab/cheetahclaws>

## 研究问题

这篇论文把 agentic AI 的瓶颈从“模型继续变强”转向“模型周围的系统怎么扩展”。作者称之为 scaling the harness：把 foundation model 外层的结构化执行层作为一等对象来设计、评测和优化。

问题是，很多 agent 评测仍然是 model-centric：看最终任务是否成功，却把 memory、retrieval、tool use、orchestration、verification、governance 当作实现细节。论文认为这种口径已经不够，因为 agent 的长期行为来自模型、记忆基底、上下文构造器、skill 路由、编排循环和验证治理层之间的交互。

## 方法概览

论文把 agent harness 拆成几个核心瓶颈：

- Context governance：上下文不是越长越好，而是要管理进入上下文的证据、约束和任务状态。
- Trustworthy memory：记忆不只是存储，还要保证写入、更新、清理和调用的可信度。
- Dynamic skill routing：不同任务需要不同 skill，路由策略会直接影响长程行为。
- Orchestration and governance：编排、权限、验证、审计和演化机制共同决定 agent 是否能安全扩展。

作者还提出 harness-level benchmark 的研究议程：不只测一次任务成功率，还要测 trajectory quality、memory hygiene、context efficiency、communication fidelity、verification cost、safe evolution over time。

## 关键贡献

- 明确提出“从 model scaling 到 system scaling”的叙事，把 agent 能力放回系统工程框架。
- 把 harness 定义为模型能力转化为长程行为的关键执行层，而不是外围胶水代码。
- 将 context、memory、skill routing、orchestration、verification 和 governance 放到同一张系统图里。
- 给出 harness-level 评测指标，避免只用最终成功率掩盖过程质量和治理成本。
- 通过 CheetahClaws 参考 harness 与 Claude Code、OpenClaw 做对比，让讨论更接近工程实现。

## 与知识库主题的关系

这篇论文直接补强 [[Agent Harness 与多 Agent 编排]] 主题簇。它和 [[The Anatomy of an Agent Harness]]、[[Thin Harness, Fat Skills]]、[[Harnessing Claude’s intelligence]] 同向，但更强调“扩展对象”从模型参数转向系统层。

它也能串联 [[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]] 和 [[Adapting the Interface Not the Model Runtime Harness Adaptation for Deterministic LLM Agents]]：前者关心 source-level evolution，后者关心 runtime interface adaptation，而本篇给出更上层的 system scaling 语言。

## 可复用观点

- Agent 的能力不是模型能力的直接外溢，而是模型与 harness 共同产生的系统行为。
- 长上下文、记忆、skills、工具和验证不是功能列表，而是同一个 harness 的可扩展组件。
- 只看最终成功率会低估“过程质量”和“治理成本”的重要性。
- 下一代 agent 平台要竞争的不是单点功能，而是 harness 是否可观测、可验证、可演化。

## 可加工为公众号角度

- Agent 时代，真正要 scale 的不是模型，而是 harness。
- 企业上 agent 的瓶颈，不是“模型够不够聪明”，而是系统能不能管理上下文、记忆、skills 和验证。
- 不要把 agent harness 当胶水代码；它正在变成产品护城河。

## 关联笔记

- 历史文摘：[[The Anatomy of an Agent Harness]]、[[Thin Harness, Fat Skills]]、[[Harnessing Claude’s intelligence]]
- 相关论文：[[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]]、[[Adapting the Interface Not the Model Runtime Harness Adaptation for Deterministic LLM Agents]]、[[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- 相关旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]、[[2026-05-25 Agent 自我改进，不该只改提示词]]
- 已加工成稿：[[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
