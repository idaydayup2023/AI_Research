---
title: "Agent Memory: Characterization and System Implications of Stateful Long-Horizon Workloads"
source: "https://arxiv.org/abs/2606.06448"
arxiv_id: "2606.06448"
authors:
  - "Yasmine Omri"
  - "Ziyu Gan"
  - "Zachary Broveak"
  - "Robin Geens"
  - "Zexue He"
  - "Alex Pentland"
  - "Marian Verhelst"
  - "Tsachy Weissman"
  - "Thierry Tambe"
submitted: "2026-06-04"
created: "2026-06-06"
categories:
  - "cs.AI"
description: "论文从系统角度刻画 agent memory，把长期记忆拆成 taxonomy、phase-aware profiling harness 和 10 条系统建议，重点是读写路径、freshness-latency、摊销和 fleet-scale 管理。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "systems"
  - "long-horizon-agents"
---

# Agent Memory: Characterization and System Implications of Stateful Long-Horizon Workloads

## 论文信息

- arXiv：https://arxiv.org/abs/2606.06448
- 作者：Yasmine Omri、Ziyu Gan、Zachary Broveak、Robin Geens、Zexue He、Alex Pentland、Marian Verhelst、Tsachy Weissman、Thierry Tambe
- 提交时间：2026-06-04
- 分类：cs.AI

## 研究问题

长期运行的 LLM agent 需要跨 session 存储、检索和更新记忆。现有讨论常把记忆写成能力问题：能不能记住、能不能检索、能不能更新。但生产系统还要回答另一组问题：构建记忆花多少成本，检索延迟在什么阶段爆炸，写入和读取路径如何互相转移成本，什么查询量下才值得摊销，fleet-scale 管理怎么做。

## 方法概览

论文提出一个系统导向的 agent memory taxonomy，并构建 phase-aware profiling harness，把成本归因到 construction、retrieval 和 generation 等阶段。作者评估 10 个代表性记忆系统，在两个 benchmark suites 上观察不同设计如何改变读写路径成本。

重点不是再发明一种新记忆，而是把已有 agent memory 系统放到同一个系统剖面里比较。

## 关键贡献

- 给出系统层面的 agent memory 分类轴，覆盖 flat retrieval、LLM-mediated extraction、consolidating fact stores、agentic control flows 等设计。
- 用 profiling harness 分阶段归因成本，避免只看最终准确率。
- 说明记忆架构的成本并不会消失，只会在构建、读取、生成和维护之间转移。
- 提出 10 条系统建议，涉及 construction scheduling、capability floors、query-volume amortization、freshness-latency tradeoff 和 fleet-scale management。

## 与知识库主题的关系

这篇补强了 [[AI 记忆最危险的不是忘，而是混]] 和 [[把 Agent 的运行账本搬出上下文]] 之间的系统层空白。前者关注记忆冲突仲裁，后者关注运行状态外置；这篇则问：一套 agent memory 真的上生产时，成本、延迟和维护边界在哪里。

它也提醒：agent memory 不是“加一个向量库”或“加一套总结器”就结束。不同记忆系统会改变写入频率、读取路径、freshness、延迟和横向扩展方式，这些都必须进入架构评估。

## 可复用观点

- agent memory 应被当作系统工作负载评估，而不是单纯的 recall feature。
- 长期记忆的核心成本口径包括 construction、retrieval、generation、freshness 和 fleet management。
- 记忆设计没有免费午餐：写入时省下的成本，可能会在读取、过期、冲突或生成阶段补回来。

## 可加工为公众号角度

- 可与 [[What we learned mapping a years worth of AI-enabled cyber threats]] 合并，写“长期 agent 的记忆和权限都是持久化风险面，不能只看单次调用”。
- 可与 [[Unlocking dependable responses with Gemini Enterprise Agent Platforms Agentic RAG]] 合并，写“企业知识层要同时管理检索缺口和记忆系统成本”。
- 今天暂不成稿：memory/state 主题在近 7 篇中已经高频出现，此篇更适合作为系统成本证据补库。

## 关联笔记

- [[2026-05-30 AI 记忆最危险的不是忘，而是混]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[Is Agent Memory a Database Rethinking Data Foundations for Long-Term AI Agent Memory]]
- [[Your Agents Are Aging Too Agent Lifespan Engineering for Deployed Systems]]

