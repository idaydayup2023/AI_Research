---
title: "Observability for Delegated Execution in Agentic AI Systems"
source: "https://arxiv.org/abs/2606.09692"
arxiv_id: "2606.09692"
authors: "Abhinav Mishra; Kumar Sharad"
submitted: 2026-06-08
created: 2026-06-10
categories:
  - "cs.CR"
  - "cs.AI"
description: "指出普通日志无法重建动作属于哪次授权委托，提出在执行时绑定 delegation context 的 Agent 可观测性基底。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-observability"
  - "delegation"
  - "audit"
  - "security"
---

# Observability for Delegated Execution in Agentic AI Systems

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.09692>
- 提交：2026-06-08（v1）
- 作者：Abhinav Mishra, Kumar Sharad
- 分类：cs.CR / cs.AI

## 研究问题

普通 audit log 和 execution trace 可以记录动作，却不一定能回答动作属于哪次委托。多个 Agent 动态选工具、改变执行顺序并生成子 Agent 后，轨迹会交错，同一批日志可能对应不同的 delegation assignment。

论文关注的是 delegation-scoped attribution：给定一次授权或委托，能否准确重建它触发了哪些动作、访问了什么、分享了什么。

## 方法概览

作者提出由轻量 gateway 和 common information model 组成的可观测性基底，在执行发生时绑定 delegation context，而不是事后用时间窗口或因果猜测拼接轨迹。

该方法不试图推断 Agent 意图或完整思维过程，而是提供跨工具的委托归因和访问足迹查询。

## 关键贡献

- 指出“动作被记录”不等于“责任可归因”。
- 将 delegation context 作为执行时必须写入的语义，而不是事后分析标签。
- 支持跨异构工具进行委托范围的取证查询。
- 为多 Agent 权限、审计和责任边界提供比普通 tracing 更精确的对象。

## 与知识库主题的关系

这篇补强 [[2026-05-28 给 AI 员工发临时工牌]] 和 [[2026-06-03 把 Agent 的运行账本搬出上下文]]。临时身份解决 Agent 能做什么，delegation observability 解决某次委托实际做了什么，以及这些动作能否被重新归因。

## 可复用观点

- Agent 审计必须记录“代表谁、基于哪次委托、在什么范围内执行”。
- 时间相近和调用链相连不足以证明责任归属。
- 企业 Agent 平台需要 delegation id、parent delegation、scope 和 artifact linkage 等原生字段。
- 可观测性不能只看模型调用，还要覆盖工具、数据访问和跨 Agent 转交。

## 可加工为公众号角度

- `Agent 日志记了很多，为什么还是说不清谁授权的？`
- 可补充“临时工牌”旧稿，暂不单独成稿，避免再次泛写审计与运行账本。

## 关联笔记

- [[2026-05-28 给 AI 员工发临时工牌]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[Agent System Operations Categorization Challenges and Future Directions]]

