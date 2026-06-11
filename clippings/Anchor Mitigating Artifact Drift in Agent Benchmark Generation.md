---
title: "Anchor: Mitigating Artifact Drift in Agent Benchmark Generation"
source: "https://arxiv.org/abs/2605.26321"
arxiv_id: "2605.26321"
authors:
  - "Maksim Ivanov"
  - "Abhijay Rana"
submitted: 2026-05-25
published: 2026-05-25
created: 2026-05-28
categories:
  - "cs.AI"
description: "提出 Anchor 与 ERP-Bench，用单一参数化业务规格联合生成自然语言任务、环境配置、求解器认证答案和状态 verifier，缓解 agent benchmark 中 instruction、environment、oracle、verifier 不一致导致的 artifact drift。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evals"
  - "enterprise-ai"
  - "workflow"
  - "harness"
---

# Anchor: Mitigating Artifact Drift in Agent Benchmark Generation

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.26321>
- 提交时间：2026-05-25（v1）
- 作者：Maksim Ivanov, Abhijay Rana
- 分类：cs.AI

## 研究问题

企业 agent 正在进入长程业务操作任务，但评测环境常在 realism、verifiability 和 scale 之间失衡。

论文把一个常见失败命名为 artifact drift：任务指令、环境、oracle 和 verifier 由松散流程分别生成，结果彼此不一致，导致环境不可解、奖励可被 hack，或 verifier 与真实业务目标脱节。

## 方法概览

Anchor 将业务专家的 workflow 规格形式化为 constraint optimization programs，并从同一个参数化规格联合生成：

- natural-language instruction；
- environment configuration；
- solver-certified ground-truth solution；
- state-based verifier。

基于 Anchor，作者构建 ERP-Bench：300 个长程任务，覆盖生产级 ERP 系统中的 procurement 和 manufacturing workflow。

## 关键贡献

### 1) 把“评测环境一致性”变成第一等问题

很多 agent benchmark 的短板不在题目少，而在环境、答案和 verifier 彼此不同步。Anchor 的做法是让这些 artifact 同源生成，减少漂移。

### 2) 用 solver-certified solution 避免含糊奖励

企业 workflow 常有明确约束和最优解。用求解器认证答案，可以让 reward 依赖 end-state business correctness，而不是依赖模型式主观打分。

### 3) ERP-Bench 暴露前沿模型的业务任务差距

论文摘要报告，frontier models 满足显式约束的比例为 26.1%，达到 fully optimal solution 的比例为 17.4%。这说明经济价值任务不是“接上工具就能自动化”，评测环境必须足够可审计。

## 与知识库主题的关系

- 与 [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]] 一起指向“真实工具环境下的可验证评测”。
- 与 [[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]] 互补：Agentic CLEAR 偏 trace/node 诊断，Anchor 偏任务生成与 verifier 同源。
- 与 [[2026-05-12 Agent 不会靠提示词变可靠]] 同线：可靠性来自环境、评测、验证和修复闭环。

## 可复用观点

- 企业 agent benchmark 的核心不是“像不像真实业务”，而是 instruction、environment、oracle、verifier 是否同源一致。
- 可审计评测环境本身就是 harness 的一部分。
- 如果 verifier 与业务终态不一致，模型越强越可能学会绕过评测，而不是完成业务。

## 可加工为公众号角度

- 可合并成稿：Agent 上生产后，需要可持续体检；体检本身也不能漂移。
- 可后续成稿：企业 agent 评测不是写几条 case，而是生成一套不自相矛盾的业务世界。

## 关联笔记

- 已加工成稿：[[2026-05-28 Agent 上线后，也会变老]]
- [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- [[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]]
- [[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]
- [[2026-05-12 Agent 不会靠提示词变可靠]]
