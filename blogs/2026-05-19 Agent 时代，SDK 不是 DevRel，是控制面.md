---
title: "Agent 时代，SDK 不是 DevRel，是控制面"
created: 2026-05-19
tags:
  - "blog"
  - "agent-harness"
  - "developer-tools"
  - "mcp"
---

# Agent 时代，SDK 不是 DevRel，是控制面

![封面](../covers/2026-05-19-agent-sdk-control-plane.png)

当一个产品从“回答问题”转向“替你做事”，你真正依赖的就不再是模型会不会说，而是它**能不能稳定地触达系统、并且在边界内行动**。

这也是我读到 Anthropic 收购 Stainless 的第一反应：这不是一条“买团队”的新闻，而是一次把焦点从“模型能力”挪到“接口层工程”的公开表态——**agent 的上限，来自它能安全触达的系统集合；而系统触达的可靠性，主要写在 SDK/CLI/MCP server 里。**

如果你在做 agent 产品或企业内部 agent 平台，这条消息提醒你：SDK 早就不是“锦上添花的开发者体验”，它正在变成生产系统的控制面——**本文想解决的就是：怎么把“接工具”从临时代码，升级成可治理的能力面。**

## 先把一句话讲清：SDK 是 agent 的“可操作世界”

很多团队把“接工具”理解成：给模型加几个 function call，能跑就行。

但真正上生产后，困难通常不是“能不能调用”，而是：

- 权限边界是不是结构化的（能否明确禁止、能否审计）
- 错误语义是不是稳定的（重试？回滚？升级人工？）
- 行为是不是可迁移的（同一 API 在不同语言/客户端是否一致）
- 依赖是不是可维护的（版本漂移、breaking change、灰度与兼容策略）

这些问题，最后都会落回接口层：你交给 agent 的到底是一堆“易碎的临时代码”，还是一套能长期演进的“能力面（capabilities surface）”。

Stainless 做的事情，本质上是把 API spec 当成源头，把 SDK、CLI、MCP server 当成同一条供应链的不同产物：**把工具从“手工对接”升级为“可生成、可回归、可治理”的资产。**

## 失败现场：手工维护工具链，最先坏在“边界”和“语义”

我见过最典型的事故不是模型幻觉，而是工具链漂移导致的“半正确”：

- 新版本 SDK 把某个错误码从 `401` 变成 `403`，你的 agent 仍按旧逻辑走“刷新 token → 重试”。表面上只是“偶发失败”，但监控里会出现 `403` 告警尖峰、重试风暴、额度/账单异常，最后往往只能紧急降级或回滚版本止血。
- MCP server 的工具参数名改了一个字段（或默认值变了），功能还能跑，但行为悄悄偏了：比如本应只读的查询变成了带副作用的写入，审计时才发现“谁干的”都说不清。
- 团队 A（Python）和团队 B（TypeScript）各自修了“同一个 bug”，但修法不同；半年后你再做审计，只看到一堆分叉逻辑，没人敢动。

这些事故的共同点是：**从外面看像“模型不稳定”，其实是接口层没把边界、错误与版本关系写成硬约束。** 你越依赖 agent 去“执行”，这些隐性不一致越容易放大成成本与风险。

自检问题（Yes/No）：**你的 agent 工具层是否有“版本化 + 最小回归集 + 审计口径”，能让新同事在一周内放心发布一次变更？**

## 真正的护城河：把“能做什么”变成“可治理的能力面”

当大家都能接入相近能力的模型时，差异化会更集中在工程侧：

- 你能提供多完整的工具面（覆盖哪些系统、哪些关键动作）
- 你能把工具做得多可靠（幂等、重试、降级、限流、观测）
- 你能把治理做得多前置（权限、审计、变更、回归）

这也是为什么“SDK/MCP server tooling”会从 DevRel 的边缘地带，变成 agent 时代的平台核心：它决定了你的 agent 能不能规模化复用，能不能被组织信任。

## 给产品/工程团队的落地清单：把 spec 当成控制面的源头

如果你想把这条新闻变成可执行动作，我建议从三件事开始：

- 把 API spec 当成单一事实来源（SSOT）：任何能力变更先改 spec，再生成下游产物（SDK/CLI/MCP server），而不是在某个语言客户端里“顺手修一下”。
- 把“错误语义”产品化：在 SDK 层明确哪些错误该重试、哪些要停止、哪些要升级人工；让 agent 学到的是**稳定策略**而不是临场反应。
- 为工具链做回归与审计：把工具调用当成生产系统接口来对待——有版本、有灰度、有日志口径、有最低可用性门槛。

你会发现：当你把这些做实，agent 才真正从“聪明的聊天窗口”变成“可控的执行系统”。

## 参考链接

- Anthropic：Anthropic acquires Stainless — <https://www.anthropic.com/news/anthropic-acquires-stainless>
- Perplexity Research：Designing, Refining, and Maintaining Agent Skills at Perplexity — <https://research.perplexity.ai/articles/designing-refining-and-maintaining-agent-skills-at-perplexity>

## 关联笔记

- [[Anthropic acquires Stainless]]
- [[The Anatomy of an Agent Harness]]
- [[Thin Harness, Fat Skills]]
- [[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
