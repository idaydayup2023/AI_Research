---
title: "Rethinking Search as Code Generation"
source: "https://research.perplexity.ai/articles/rethinking-search-as-code-generation"
author: "Perplexity Research"
published: 2026-06-01
created: 2026-06-02
description: "Perplexity 提出 Search as Code：把搜索从固定端点改造成 agent harness 可编程的 SDK primitives，让模型用代码编排检索、排序、过滤、fan-out、验证和中间状态管理。"
tags:
  - "clippings"
  - "perplexity"
  - "agent-harness"
  - "search-agents"
  - "context-engineering"
  - "tool-use"
  - "cost-optimization"
---

# Rethinking Search as Code Generation

## 原文信息

- 来源：Perplexity Research
- 链接：<https://research.perplexity.ai/articles/rethinking-search-as-code-generation>
- 发布时间：2026-06-01
- 主题：Search as Code、agentic search、programmable retrieval、Agentic Search SDK、sandbox、Agent Skills

## 核心提取

Perplexity 的判断是：传统搜索把搜索引擎当作一个固定管线，模型只能发 query 并消费最终结果；而 agent 任务的检索需求高度异质、长程、并发、需要反复过滤和验证，固定搜索端点会造成上下文污染、串行延迟和成本浪费。

Search as Code 的核心变化是把搜索栈拆成可编程 primitives：retrieval、ranking、filtering、fan-out、rendering、intermediate state 等能力通过 Agentic Search SDK 暴露给 sandbox，模型生成 Python 代码来动态组装任务专用检索管线。

文章特别强调三层协同：

- 模型作为 control plane，决定证据需求、分解检索策略并生成代码；
- sandbox 执行确定性控制流、批处理、重试、聚合、去重和过滤；
- Agentic Search SDK 提供搜索基础设施的可组合 building blocks。

## 中文译读

这篇文章最值得迁移的地方，不是“搜索也可以写代码”，而是它重新划分了 agent 与外部系统的边界。

过去的工具调用把搜索当作一次远程函数调用：agent 发一个 query，工具返回一坨上下文。这个接口适合人类搜索，也适合简单问答，但不适合长任务。长任务往往需要按来源类型 fan-out、对稀疏结果自适应补查、把中间候选状态留在执行环境里、再用 schema 做关系验证。

Perplexity 的 CVE vendor advisory case 很典型：agent 不是“搜 CVE”，而是用代码表达来源约束、年份和厂商展开、候选覆盖统计、补充查询生成、官方来源过滤、CVE 与 fix version 的绑定验证。文章报告这个任务中 SaC 达到 100% accuracy，同时 token 使用相对非 SaC baseline 从 288.7K 降到 42.9K。

它还把 Skills 放在一个清晰位置：不是把 SDK 文档塞进提示词，而是用少于 2000 tokens 的 root `SKILL.md` 教模型如何组合 primitives。Skills 主要承载可泛化组合模式和少量示例，runtime reflection 则负责暴露具体 API。

## 可复用观点

- AI-native search 的接口不应只返回结果，还应暴露可编排的检索 primitives。
- 对 agent 来说，代码是工具编排层：它把并行、过滤、去重、验证和中间状态管理从 token space 移到 deterministic runtime。
- MCP/function calling 适合低频、窄接口工具；高频、长程、可组合的检索工作流更需要 SDK + sandbox。
- Skills 的价值不是罗列 API，而是教模型把 primitives 组合成稳定模式。
- 成本优化不只靠少调用模型，也靠避免把无用中间状态塞回上下文。

## 可加工为公众号角度

- 可成稿方向：`Agent 不该只会调用搜索，它要会编排搜索`。
- 可合并素材：[[Query-Aware Context Compression for Better Snippets]]、[[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]、[[Learning Agent-Compatible Context Management for Long-Horizon Tasks]]。
- 与旧稿差异：不是重复“薄 harness / 厚 skills”，而是把外部知识 I/O 的接口边界下沉到可编程 primitives。

目前暂不单独成稿：它与 2026-06-01 Reharnessing 主题相邻，但提供了一个非常强的新案例。更适合与今日新增的 context manager / TraceGraph 共同合并成“agent 的下一层接口不是工具，而是可编排 primitives”的综合稿。

## 关联笔记

- [[Query-Aware Context Compression for Better Snippets]]
- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[Thin Harness, Fat Skills]]
- [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
- 已加工成稿：[[2026-06-02 Agent 的接口，不该只有工具调用]]
