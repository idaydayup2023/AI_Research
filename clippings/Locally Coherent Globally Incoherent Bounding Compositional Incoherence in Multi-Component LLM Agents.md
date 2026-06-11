---
title: "Locally Coherent, Globally Incoherent: Bounding Compositional Incoherence in Multi-Component LLM Agents"
source: "https://arxiv.org/abs/2605.30335"
arxiv_id: "2605.30335"
authors:
  - "Anany Kotawala"
submitted: 2026-05-28
created: 2026-05-30
categories:
  - "cs.AI"
  - "cs.CL"
description: "形式化多组件 LLM agents 中局部组件各自一致、组合结果却全局不一致的问题，并提出运行时 residual、projection repair 与 sequential monitoring。"
tags:
  - "clippings"
  - "arxiv"
  - "multi-agent"
  - "agent-evals"
  - "agent-harness"
  - "verification"
---

# Locally Coherent, Globally Incoherent: Bounding Compositional Incoherence in Multi-Component LLM Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30335>
- 提交时间：2026-05-28（v1）
- 作者：Anany Kotawala
- 分类：cs.AI, cs.CL

## 研究问题

多组件 LLM agents 往往让不同组件只观察联合问题的一部分，再把各自的概率性判断组合起来。论文指出，即便每个组件局部看起来一致，组合结果仍可能违反基本概率公理，形成“局部一致、全局不一致”的失败模式。

## 方法概览

作者用 compositional residual eps* 形式化这种失败：它衡量组合后的 quote 与 joint coherent polytope 之间的 L2 距离，并可由系统输出和声明的跨组件耦合约束在运行时计算。

论文还提出 product-structure dichotomy 判断何时局部一致足够；用 hierarchical Boyle-Dykstra projection 做确定性修复；用 anytime-valid e-process 做 sequential coherence monitoring。

## 关键贡献

- 把多组件 agent 的组合一致性变成可计算的运行时量，而不是只靠最终答案质量判断。
- 指出 retrieval、partition-aware prompting、aggregator-LLM 等直觉式缓解手段可能失败或回退。
- 在 ensemble cliques 和 resolved bets 上展示全局不一致会带来实际 regret。
- 提醒多 Agent harness 需要显式声明跨组件耦合约束。

## 与知识库主题的关系

这篇补充 [[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]] 的角色审计视角。Removal audit 关注“某个角色是否有贡献”，而 compositional incoherence 关注“各角色都看似合理时，组合是否仍然坏掉”。

它也能补强 [[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]：多组件系统的失败不一定来自单点错误，也可能来自组合约束未被显式建模。

## 可复用观点

- 多 Agent 不是把多个局部好答案拼起来就能得到全局好答案。
- 组件之间的 coupling constraints 必须进入 harness，而不是藏在 prompt 里的自然语言假设。
- Aggregator LLM 不是万能胶；全局一致性需要结构化检查和必要时的确定性修复。
- 轨迹与组合审计应成为多 Agent 系统上线前后的常规指标。

## 可加工为公众号角度

- 新角度候选：多 Agent 系统最危险的不是某个 agent 出错，而是每个 agent 都“像是对的”。
- 可合并素材：[[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]、[[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]。
- 可补充旧稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]。

## 关联笔记

- [[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]]
- [[TraceFix Repairing Agent Coordination Protocols with TLA+ Counterexamples]]
- [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- 已加工成稿：[[2026-05-30 别让 Agent 白白烧掉反馈]]
