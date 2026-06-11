---
title: "ComplexMCP: Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox"
source: "https://arxiv.org/abs/2605.10787"
arxiv_id: "2605.10787"
authors:
  - "Yuanyang Li"
  - "Xue Yang"
  - "Longyue Wang"
  - "Weihua Luo"
  - "Hongyang Chen"
submitted: 2026-05-11
published: 2026-05-11
created: 2026-05-13
categories:
  - "cs.AI"
  - "cs.SE"
description: "提出 ComplexMCP：基于 MCP 的大规模、状态化、可注入噪声的工具沙盒（300+ tools / 7 sandboxes），评估 agent 在互相依赖与失败注入条件下的“最后一公里”自动化能力，并用轨迹分析归因工具检索饱和、过度自信与战略性放弃等瓶颈。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evals"
  - "tool-use"
  - "mcp"
---

# ComplexMCP: Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.10787>
- 提交时间：2026-05-11（v1）
- 作者：Yuanyang Li, Xue Yang, Longyue Wang, Weihua Luo, Hongyang Chen
- 分类：cs.AI / cs.SE

## 研究问题

现有 agent 在“会调用单个 API”上表现不错，但在商业软件自动化的最后一公里里，经常崩在三件事上：

- 工具不是独立的：有状态、互相依赖、操作顺序敏感；
- 环境不干净：存在噪声、失败注入、非预期返回；
- 工具空间大：检索/选择成本上升后，agent 的策略会退化。

## 方法概览

ComplexMCP 基于 MCP 构建 benchmark：提供 7 个 stateful sandboxes、300+ 工具，采用 seed-driven 架构在可重复的前提下模拟动态环境状态与 API failure（“deterministic but diverse”）。

论文中用 full-context 与 RAG 两种设置评估多个模型，并用 trajectory 分析对失败模式做归因。

## 关键贡献

### 1) 把“工具系统的现实复杂度”塞进评测

相比只评单工具调用，ComplexMCP 强调 interdependent tools + environmental noise，逼迫 agent 做状态确认、恢复策略与跨工具规划。

### 2) 三个瓶颈归因（很可迁移）

论文给出的三类失败模式可以直接作为工程 debug checklist：

- Tool retrieval saturation：工具空间一大，检索与选择开始失真；
- Over-confidence：跳过必要的环境验证（没查就写、没确认就提交）；
- Strategic defeatism：失败后开始找借口/“合理化失败”，不再积极恢复。

## 与知识库主题的关系

它是对本库“agent 评估/可靠性”主题的直接补强：你要做 production agent，评测必须包含工具依赖、失败注入与状态噪声，否则上线后必然暴露系统性缺陷。

## 可复用观点

- 工具越多，检索越关键；没有工具检索与状态确认的机制，agent 会在规模化时退化。
- 可靠 agent 不是“更聪明”，而是“更会确认、更会恢复、更不自欺”。
- benchmark 的价值在于把失败模式结构化成可改的工程问题。

## 可加工为公众号角度

- “最后一公里”不是模型问题，是工具系统问题：为什么 agent 会在 interdependent workflows 里崩？
- 把 ComplexMCP 的三类瓶颈翻译成工程实践：tool registry、verification step、recovery playbook。

## 关联笔记

- 评估与可靠性：[[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]、[[Evaluating Deep Research Performance in the Wild with the DRACO Benchmark]]
- MCP 生态：[[How to Build AI Agents in 2026 Full Guide]]
- 可补充旧稿：[[2026-05-12 Agent 不会靠提示词变可靠]]、[[2026-05-11 Agent 产品的护城河正在变成系统工程]]

