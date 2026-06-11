---
title: "Provably Auditable and Safe LLM Agents from Human-Authored Ontologies"
source: "https://arxiv.org/abs/2606.04903"
arxiv_id: "2606.04903"
authors:
  - "Aaron Sterling"
published: "2026-06-03"
created: "2026-06-05"
categories:
  - "cs.LO"
  - "cs.AI"
  - "cs.MA"
  - "cs.PL"
description: "论文提出 Agentic Redux 和 ontology-first agent design，用本体、追加式账本和语义正确性证明来构造可审计 agent。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-trust"
  - "auditability"
  - "ontology"
---

# Provably Auditable and Safe LLM Agents from Human-Authored Ontologies

## 论文信息

- arXiv：https://arxiv.org/abs/2606.04903
- 作者：Aaron Sterling
- 提交时间：2026-06-03
- 分类：cs.LO、cs.AI、cs.MA、cs.PL

## 研究问题

很多 agent 安全讨论停在 guardrail 或提示约束层，但对高风险领域来说，真正的问题是：能不能让 agent 的决策过程天然可审计，并在结构上保证它不会脱离人类预先定义的问题本体。

## 方法概览

论文提出 Agentic Redux 架构，目标是用于需要线性审计能力的复杂领域。作者声称在合适领域下，可以借助 typed lambda calculus 证明执行语义正确，并把所有决策记录在 append-only ledger 中。

同时作者提出 ontology-first agent design：先由人类专家用本体论方式组织问题域，再让 LLM 从这个本体中派生角色，由 agent 和 human-in-the-loop 共同执行。

## 关键贡献

- 把 agent 安全和审计问题推进到“先定义本体、再允许推导角色和行为”的设计顺序。
- 强调 append-only ledger，不把审计当成事后日志，而当成执行结构的一部分。
- 给出两个生产级领域示例：医疗账单合规和安全漏洞披露。
- 提供一种比“多写一点规则”更强的 agent 约束思路：让 agent 在人类定义的本体中展开。

## 与知识库主题的关系

这篇论文和运行账本、Zero Trust、AgentOps 都有直接连接。它补的是“为什么账本和审计不能只是运维附属物”，因为在某些场景里，审计链本身就是 agent 架构的核心。

它也把知识层主题推进到更强约束形式。此前我们更多讨论 canonical path、schema、query transcript，这篇论文进一步提示：如果问题域足够高风险，知识结构本身就需要先被本体化。

## 可复用观点

- 对高风险 agent，审计不该只是日志，而应是执行语义的一部分。
- ontology-first 的价值不在形式化本身，而在于把 agent 可行动空间先压进人类定义的对象、关系和角色边界。
- append-only ledger 是“状态外置”的更强形态：不仅为了回放，更是为了责任归属。

## 可加工为公众号角度

- 可与 [[OpenAgenet_OAN Open Infrastructure for Trusted Agent Interconnection]]、[[Zero Trust for AI agents]]、[[2026-06-03 把 Agent 的运行账本搬出上下文]] 合并，写“可信 agent 的关键不是更聪明，而是先有账本、本体和门禁”。
- 也可作为“智能体信任与安全”母题的理论支撑材料，补足之前更偏产品治理的写法。
- 今天暂不成稿：理论框架强，但要形成公众号稿仍需更多工程个案或企业协议层案例配合，避免写成纯抽象规范文。

## 关联笔记

- [[Zero Trust for AI agents]]
- [[OpenAgenet_OAN Open Infrastructure for Trusted Agent Interconnection]]
- [[Agent System Operations Categorization Challenges and Future Directions]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]

