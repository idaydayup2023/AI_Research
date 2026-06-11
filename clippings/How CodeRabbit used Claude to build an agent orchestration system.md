---
title: "How CodeRabbit used Claude to build an agent orchestration system"
source: "https://claude.com/blog/how-coderabbit-used-claude-to-build-an-agent-orchestration-system"
author:
  - "Claude Blog"
published: 2026-05-27
created: 2026-05-28
description: "CodeRabbit 在 coding request 与 coding agent 之间加入 Claude 驱动的结构化计划层，让团队先审查意图和方案，再生成代码。"
tags:
  - "clippings"
  - "claude"
  - "coding-agents"
  - "agent-orchestration"
  - "developer-tools"
---

# How CodeRabbit used Claude to build an agent orchestration system

## 原文信息

- 原文：<https://claude.com/blog/how-coderabbit-used-claude-to-build-an-agent-orchestration-system>
- 发布时间：2026-05-27
- 来源：Claude Blog

## 核心提取

这篇文章的价值不在“CodeRabbit 用了 Claude”，而在它暴露了 coding agent 产品的一个关键架构动作：**在用户需求和代码生成 agent 之间，加一层可审查的计划编排层**。

原文描述 CodeRabbit 构建了一个位于 coding request 和 coding agent 之间的 layer，由 Claude 先产出 structured coding plan，团队可在任何代码生成前审查这个计划。换句话说，质量门不再只放在 PR diff 之后，而是前移到“意图、范围、执行路径、验证方式”这一级。

## 中文译读

过去的 AI coding 工作流容易把审查压力全部留给末端：agent 已经改完文件，reviewer 再从 diff 里倒推它想干什么。这个流程的问题是，diff 只展示结果，不展示意图。你看到的是“改了什么”，但很难知道“为什么这么改、有没有其他路径、哪些风险被刻意排除了”。

CodeRabbit 的做法相当于把 coding agent 的第一产物改成计划，而不是代码。计划层可以承载任务拆解、影响范围、风险假设、测试路径和人工确认点。真正的代码生成在计划被接受后才开始。

这让 agent orchestration 从“多调几个模型”变成“把不确定性分段暴露”：先让模型解释它准备怎么做，再让工具执行它被允许做的部分。对企业开发者工具来说，这比单纯提升代码生成速度更重要。

## 可复用观点

- AI coding 的质量门应该从“审 diff”前移到“审计划”。
- 计划层是 agent orchestration 的控制面：它把意图、范围、风险和验证口径从代码生成里分离出来。
- 对高风险代码，最重要的交付物可能不是首版 patch，而是可讨论、可修改、可拒绝的执行方案。
- coding agent 的产品竞争力会从“能写代码”转向“能让团队放心地放权”。

## 可加工为公众号角度

- 可成稿：AI coding 不能只补测试闭环，还要把计划审查变成第一道质量门。
- 可与 [[MUSE-Autoskill Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation]] 结合，讨论计划、skill、memory 都应该是可审查资产。
- 可与 [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]] 形成前后关系：旧稿讲验证闭环，本文可讲前置计划门。

## 关联笔记

- 已加工成稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- [[Lessons from building Claude Code Prompt caching is everything]]
- [[The Anatomy of an Agent Harness]]
- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
