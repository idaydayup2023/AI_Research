---
title: "Lessons from building Claude Code: Prompt caching is everything"
source: "https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything"
author:
  - "Claude"
published: 2026-04-30
created: 2026-05-11
description: "Claude Code 团队总结 prompt caching 的工程经验：稳定前缀、不要中途换模型或工具、用消息承载动态信息、用 cache-safe forking 做 compaction。"
tags:
  - "clippings"
  - "claude-code"
  - "prompt-caching"
  - "agent-harness"
  - "cost"
---

# Lessons from building Claude Code: Prompt caching is everything

## 原文信息

- 原文：<https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything>
- 发布时间：2026-04-30
- 发布方：Claude Blog

## 核心提取

这篇文章是 Claude Code 团队关于 prompt caching 的工程复盘。核心结论很硬：长程 agent 产品能跑得起、跑得快，很大程度上依赖 prompt cache 命中率。

Claude Code 把整个 harness 都围绕 prompt caching 设计。缓存命中率下降不是小优化问题，而会直接影响成本、延迟和订阅额度，所以他们会像监控 uptime 一样监控 cache hit rate。

## 中文译读

### 一、Prompt caching 是 prefix match

Prompt caching 的基本机制是前缀匹配。API 会从请求开头开始缓存，直到 cache breakpoint。只要前缀中某处变化，后面的缓存就可能失效。

因此，prompt 的组织顺序非常关键。Claude Code 的思路是把稳定内容放前面，动态内容放后面：

- 静态 system prompt 和 tools
- 项目级 `CLAUDE.md`
- session context
- 对话消息

这个设计让不同 session 能尽可能共享前缀缓存。

真正反直觉的地方在于，很多看似无害的变化都会破坏缓存：比如把精确时间戳塞进 system prompt、工具定义顺序不稳定、工具参数变化。

### 二、动态信息不要改 system prompt

如果时间、文件状态、用户偏好发生变化，直觉上可能想更新 system prompt。但这会破坏缓存。

Claude Code 的做法是把动态变化作为后续 message 或 tool result 里的补充信息传给模型，而不是修改前面的稳定 prompt。

这其实是一条很重要的 agent harness 原则：**系统稳定性有时比上下文洁癖更重要。**

你可以给模型新信息，但不要轻易改掉缓存前缀。

### 三、不要在会话中途换模型

Prompt cache 是跟模型绑定的。如果一个会话在 Opus 上已经积累了大量缓存，中途切到 Haiku，可能反而更贵，因为要为 Haiku 重新构建缓存。

Claude Code 的建议是：如果确实需要换模型，用 subagent 做 handoff。让主模型准备一段交接信息，再把明确任务交给另一个模型。

这和 [[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]] 的观点能接上：subagent 不只是并行工具，也可以成为不同成本/能力模型之间的边界。

### 四、不要中途增删工具

工具定义也是 cached prefix 的一部分。中途增删工具会让整个会话缓存失效。

Claude Code 的 Plan Mode 是一个典型例子。直觉做法是进入计划模式时只保留只读工具，但这会破坏缓存。他们反而把 EnterPlanMode 和 ExitPlanMode 做成工具，让工具集合保持不变，用消息说明当前模式。

对于大量 MCP 工具，Claude Code 也不通过动态删除来省 token，而是使用 tool search/defer loading：先给模型轻量 stub，等模型需要时再加载完整 schema。

这和 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 的渐进加载思路高度一致：不要把所有东西都塞进上下文，但也不要用破坏稳定前缀的方式省上下文。

### 五、Compaction 也要 cache-safe

上下文快满时，Claude Code 会做 compaction，把之前对话总结后继续。

最简单的做法是另起一个总结请求，但这会因为 system prompt 和工具集不同而无法复用缓存。Claude Code 的方案是 cache-safe forking：用与父会话相同的 system prompt、user context、system context 和 tool definitions，把原对话作为前缀，再在末尾追加 compaction prompt。

这样 API 视角下请求前缀几乎相同，只需要为新增的 compaction 指令付出额外成本。

## 可复用观点

- 长程 agent 的成本优化不是后端小事，而是产品架构问题。
- Prompt caching 的核心约束是稳定前缀；稳定内容越靠前，缓存收益越大。
- 动态信息应通过消息进入，而不是频繁修改 system prompt。
- 不要中途切换模型或工具集；用 subagent 和 tool search 作为边界。
- Compaction 不是简单总结，而是需要围绕缓存机制设计的 harness 能力。
- Cache hit rate 应该像 uptime 一样被监控。

## 可加工为公众号角度

### 角度 1：Claude Code 为什么说缓存决定一切

面向开发者解释长程 agent 的成本、延迟和可用性为什么取决于缓存命中率。

### 角度 2：Agent Harness 的隐藏战场：稳定前缀

结合 [[The Anatomy of an Agent Harness]]，讲 harness 设计如何被 prompt caching 反向塑造。

### 角度 3：Token 成本战争不是价格表，而是架构能力

连接 [[Token计算：下一个十年的成本战争]]，说明真正的成本控制来自 cache、tool loading、compaction、subagent handoff 等系统设计。

## 关联笔记

- 已加工成稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- Harness 底座：[[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]]
- Skill 与渐进加载：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[别再把 Agent Skill 当提示词了]]
- 成本主题：[[Token计算：下一个十年的成本战争]]
- 多 Agent 边界：[[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]]
