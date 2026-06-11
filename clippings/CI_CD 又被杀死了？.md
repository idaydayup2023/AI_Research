---
title: "CI/CD 又被杀死了？"
source: "https://www.toutiao.com/article/7640768511802933775/"
author: "代码筑星河"
published: "2026-05-17 16:05"
created: "2026-05-18"
description: "基于 AI Engineer 大会演讲的转述与推演：当 agent 并发开 PR 成为常态，传统 CI/CD（PR、Merge Queue、人类评审）会一起失灵，需要把流水线升级为“Continuous Compute（持续计算）”式的编排与资源治理。"
tags:
  - "cicd"
  - "devtools"
  - "agentic-workflow"
  - "merge-queue"
  - "continuous-compute"
  - "compute-orchestration"
  - "cache"
---

# CI/CD 又被杀死了？

## 原文信息

- 标题：CI/CD 又被杀死了？
- 作者：代码筑星河
- 发布时间：2026-05-17 16:05
- 链接：<https://www.toutiao.com/article/7640768511802933775/>
- 文章脉络：围绕 AI Engineer 大会上 Madison Faulkner（NEA）与 Hugo Santos（Namespace Labs）的一场联合演讲，讨论 agent 化开发下 CI/CD 的结构性失灵点与替代形态。

## 可能的英文原文/一手来源（用于更准确理解）

说明：这篇头条文的叙事结构与术语（Continuous Compute、Ingress shaping、Agentic identity、cache as orchestration layer、merge queue serialization）高度吻合 AI Engineer Europe 2026 的同名演讲与其衍生笔记，推测属于“演讲内容的中文转述/翻译”。建议以一手视频/官方 session 描述校准含义，再把中文文章当作二手解读。

- AI Engineer Europe 2026 议程（可定位到该 session）：<https://www.ai.engineer/europe/schedule>
- 官方 sessions.json 中该 talk 的英文摘要（标题完全一致）：<https://www.ai.engineer/europe/sessions.json>
- 衍生英文笔记（引用该 YouTube 视频为 source）：<https://exenova.dk/notes/why-cicd-fails-ai-agents-and-what-replaces-it/>
- YouTube 视频页（AI Engineer 频道，同名 talk；链接来自上述英文笔记）：<https://www.youtube.com/watch?v=VktrqzQgytY>

## 核心提取（对知识库最有用的部分）

校准说明：以下要点以 **AI Engineer Europe 2026 官方 session 摘要**为“更可信的一手口径”；头条文中部分更偏“外延推演/二次解读”的术语（例如 Ingress shaping、Agentic identity）我会下移到“延伸观点”，避免与一手内容混淆。

1) **agent 规模下，CI/CD 的瓶颈变成“机器延迟 + 成本”**  
官方摘要强调：当自主 coding agents 持续开 PR、改 infra、触发 workflows（甚至跨数百 repo），传统 CI/CD（为低频人类变更调优）会直接变成 SDLC 的 latency 与 cost bottleneck。

2) **典型失败模式是“runner 饱和 + cache thrash + 冷启动 build + 测试爆炸 + flakiness 变得不可解释”**  
官方摘要点名的 failure modes 很具体：runner saturation、cache thrash、cold Docker builds、test explosion、opaque flakiness。这些都指向同一件事：CI/CD 必须被当作高性能系统来对待，而不是 DevOps 的“脚本拼装”。

3) **“Continuous Compute”的工程落点：缓存、增量与可观测**  
官方摘要给出 Namespace case study 的具体方向：remote caching、Turbo-style Docker builds、Git-aware incrementality、以及把 time/spend 绑定到具体 jobs/repos/agents 的 workflow analytics；还包括 ephemeral 高性能集群、为构建负载优化的私有 registry、以及面向人类与 agent 的交互式 debug。

## 中文译读（结构化转述）

这篇文章其实在讲一个更底层的变化：**软件交付从“流程”变成“计算系统”**。

在传统 CI/CD 里，CI 是“把代码跑一遍”，CD 是“把版本发出去”。它们默认前提是：变更速率接近人类节奏，PR 数量和分支寿命都可控，评审者能在有限时间里理解关键差异。

当 agent 把 PR 产能提高一个数量级后，这些前提同时失效。于是你会看到三类现象一起出现：

- PR 数量暴涨，人类评审不可扩展；
- merge queue 像数据库串行化一样成为全局瓶颈；
- CI 的重试风暴与资源争抢，让“跑得过”比“跑得对”更难。

所谓 Continuous Compute，本质上是在说：你需要把 CI/CD 的关键能力从“流水线脚本”升级为“资源治理 + 编排 + 身份 + 可观测”的系统工程。

## 可复用观点（可直接迁移到你的团队/产品）

- **缓存与增量是“吞吐底盘”**：remote cache + Git-aware incrementality 能把“重复编译/重复测试”从默认变成例外。
- **把 CI/CD 当高性能系统来设计**：针对 build/test 的 cold start、cache thrash、runner 饱和与 flake 建立可观测指标与优化路径。
- **让成本口径可追踪**：把 time/spend 绑定到 job/repo/agent，才能谈配额、SLO 与规模化治理。

## 延伸观点（来自衍生笔记/作者推演，非官方摘要原话）

以下更像“从 talk 里抽象出来的下一步治理问题”，常见于衍生笔记（如 exenova）而不一定出现在官方摘要原文中：

- Ingress shaping / rate limiting：当 agent PR 变成流量，需要入口整形与限流，否则重试风暴会自激。
- Agentic identity：当 agent 成为执行主体，需要服务账号式身份（权限/审计/配额/追责）。

## 可加工为公众号角度（候选）

- 角度 A：CI/CD 不是死了，是“被 agent 逼着进化”：从流水线到持续计算系统。
- 角度 B：AI coding 的新瓶颈不是写代码，是合代码：merge queue 会像数据库一样爆。
- 角度 C：Agentic Identity 才是企业落地的第一公里：没有身份与审计，自动化越多越危险。

## 关联笔记

- [[2026-05-13 Agent 上生产前，先管住它的会话]]
- [[Lessons from building Claude Code Prompt caching is everything]]
- [[The Anatomy of an Agent Harness]]
- [[Token计算：下一个十年的成本战争]]

## 已加工成稿

- [[2026-05-18 从流水线到持续计算系统]]
