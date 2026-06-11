---
title: "Collaborative Human-Agent Protocol (CHAP)"
source: "https://arxiv.org/abs/2606.09751"
arxiv_id: "2606.09751"
authors: "Arsalan Shahid; Gordon Suttie; Philip Black"
submitted: 2026-06-08
created: 2026-06-10
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.HC"
description: "提出人机协作协议 CHAP，用 workspace、task、artifact 和追加式 evidence log 记录差分、理由、审批、交接与签名。"
tags:
  - "clippings"
  - "arxiv"
  - "human-agent-collaboration"
  - "protocol"
  - "audit"
  - "artifacts"
---

# Collaborative Human-Agent Protocol (CHAP)

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.09751>
- 提交：2026-06-08（v1）
- 作者：Arsalan Shahid, Gordon Suttie, Philip Black
- 分类：cs.AI / cs.CL / cs.HC
- 规范与参考实现：<https://github.com/BrightbeamAI/chap>

## 研究问题

MCP 解决 Agent 如何访问工具和数据，A2A 解决 Agent 之间如何互操作，但多个人与多个 Agent 共同完成工作时，任务、审稿、覆盖修改、审批和交接仍散落在聊天、工单与应用代码中。

CHAP 试图定义一个可问责的共享工作空间，让人的判断不再作为临时消息消失。

## 方法概览

协议核心包括 workspace、participants、tasks、artifacts 和 append-only evidence log。可组合 profiles 进一步加入 review、routing、deliberation、handoff、identity、signature 和透明度审计。

典型事件不只保存“谁改了”，还保存 diff、rationale 和 content hash；审批成为可重放的签名决策，跨班次交接成为可移植 envelope。

## 关键贡献

- 把人类 override 从聊天意见升级为结构化证据事件。
- 为人、Agent、服务和群组提供同一协作对象模型。
- 将 artifact 版本、差分、理由与审批绑定，为长期审计和回放提供基础。
- 补足工具协议与 Agent 协议之间缺失的人机协作层。

## 与知识库主题的关系

这篇与 [[2026-06-08 把计划变成 Agent 团队的工作台]] 的共享工作台方向相连，但新增的是修订与问责协议：计划共享状态解决大家围着什么协作，CHAP 解决修改、审批和交接如何留下可验证证据。

## 可复用观点

- 人审不是流程外的最后一道签字，而应成为结构化事件。
- Agent 修订应提交 diff 和 rationale，而不是只覆盖最终文件。
- 内容生产、代码审查和企业审批都需要 artifact-level evidence log。
- 可追溯的人机协作需要协议对象，不应只依赖聊天记录。

## 可加工为公众号角度

- `MCP 管工具，A2A 管 Agent，谁来管人机共同返工？`
- 本次作为“差分修订 + 审批证据”的协议材料，已加工成稿：[[2026-06-10 让 Agent 返工像打补丁]]。

## 关联笔记

- [[2026-06-08 把计划变成 Agent 团队的工作台]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[OpenAgenet_OAN Open Infrastructure for Trusted Agent Interconnection]]
- 已加工成稿：[[2026-06-10 让 Agent 返工像打补丁]]

