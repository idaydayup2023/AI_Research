---
title: "mcp-proto-okn: Natural-language access to open scientific knowledge graphs through the Model Context Protocol"
source: "https://arxiv.org/abs/2605.30283"
arxiv_id: "2605.30283"
authors:
  - "Peter W. Rose"
  - "Benjamin M. Good"
  - "Amanda M. Saravia-Butler"
  - "Charlotte A. Nelson"
  - "James P. Balhoff"
  - "Yaphet Kebede"
  - "Patricia L. Whetzel"
  - "Christopher Bizon"
  - "Andrew I. Su"
  - "Sergio E. Baranzini"
submitted: 2026-05-28
created: 2026-05-31
categories:
  - "cs.AI"
  - "cs.ET"
description: "一个基于 FastMCP 的科学知识图谱 MCP server，让 AI assistant 可以发现、检查、查询和组合开放科学知识图谱，并保留查询 transcript。"
tags:
  - "clippings"
  - "arxiv"
  - "mcp"
  - "knowledge-graph"
  - "tool-use"
  - "scientific-discovery"
  - "knowledge-management"
---

# mcp-proto-okn: Natural-language access to open scientific knowledge graphs through the Model Context Protocol

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30283>
- 提交时间：2026-05-28（v1）
- 作者：Peter W. Rose, Benjamin M. Good, Amanda M. Saravia-Butler, Charlotte A. Nelson, James P. Balhoff, Yaphet Kebede, Patricia L. Whetzel, Christopher Bizon, Andrew I. Su, Sergio E. Baranzini
- 分类：cs.AI; cs.ET

## 研究问题

科学知识图谱已经积累了大量结构化证据，但普通研究者和 AI assistant 很难直接使用：图谱入口分散，schema 不同，SPARQL 门槛高，跨图谱查询更难复盘。

这篇论文的重点是把开放科学知识图谱接入 Model Context Protocol，让 AI assistant 可以用自然语言发现图谱、检查 schema、执行查询和组合多图谱结果。

## 方法概览

作者实现了一个 Python-based MCP server `mcp-proto-okn`，基于 FastMCP 框架。它向 AI assistant 暴露几类能力：

- graph routing：根据问题选择合适知识图谱。
- schema inspection：先看图谱结构、实体和关系，而不是直接瞎查。
- SPARQL execution：把自然语言意图落到可执行查询。
- ontology expansion：扩展相关实体和关系，提升跨域探索能力。
- multi-graph querying：跨图谱组合证据。
- transcript generation：保留分析过程，便于审计和复盘。

论文同时提供 GitHub 仓库、文档、客户端配置和示例分析 transcript。

## 关键贡献

- 把 MCP 从“工具调用协议”推进到科学知识图谱的可探索接口。
- 将 schema inspection 和 query transcript 放到工作流里，避免 agent 只给出不可复盘答案。
- 为跨领域知识图谱分析提供了可复用的服务层形态：自然语言入口 + 结构化查询 + 可审计轨迹。
- 给科学 AI agent 提供了一个低门槛但仍保留形式化证据的工具接口。

## 与知识库主题的关系

这篇和 [[AI Knowledge Layer (and why your agents are useless without it)]]、[[Gemini API File Search is now multimodal build efficient verifiable RAG]]、[[Building a Virtual Filesystem for Mintlify's AI Assistant]] 都在同一条线上：知识层不能只是向量召回，还要给 agent 一个能检查结构、追踪证据、复盘查询路径的操作界面。

它也补充 [[2026-05-20 科学智能体不是博士替身，而是研究流水线]]：科研 agent 的“查证据”环节需要可执行、可审计、可复用的图谱工具，而不是只靠网页搜索和自然语言摘要。

## 可复用观点

- MCP 的关键价值不是“又多一个插件”，而是把外部知识系统变成可检查、可记录、可组合的 agent 工具。
- 对科学和企业知识库来说，schema inspection 应该成为默认前置步骤，避免 agent 在不理解数据结构时直接生成结论。
- Transcript 是知识层的资产：它记录 agent 问了什么、查了哪里、如何把证据合并。
- GraphRAG 的下一步不是只提高召回，而是让查询路径能被人和其他 agent 复用。

## 可加工为公众号角度

- 角度一：`MCP 真正有价值的地方，是让知识库可被审计`。从工具市场叙事转向知识层治理。
- 角度二：`别让 Agent 直接问知识库，先让它看 schema`。面向企业数据、科研图谱和内容生产系统。
- 角度三：`未来的 RAG 不只是返回答案，还要返回查询轨迹`。可连接 File Search citations、虚拟文件系统和决策本体。

## 关联笔记

- [[AI Knowledge Layer (and why your agents are useless without it)]]
- [[Gemini API File Search is now multimodal build efficient verifiable RAG]]
- [[Building a Virtual Filesystem for Mintlify's AI Assistant]]
- [[Connecting Agents to Decisions]]
- [[PersonalAI 2.0 Enhancing knowledge graph traversal retrieval with planning mechanism for Personalized LLM Agents]]
- [[2026-05-20 科学智能体不是博士替身，而是研究流水线]]
