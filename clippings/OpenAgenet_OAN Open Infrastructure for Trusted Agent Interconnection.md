---
title: "OpenAgenet/OAN: Open Infrastructure for Trusted Agent Interconnection"
source: "https://arxiv.org/abs/2606.03161"
arxiv_id: "2606.03161"
authors:
  - "Jinliang Xu"
published: "2026-06-02"
created: "2026-06-05"
categories:
  - "cs.AI"
description: "OAN 把开放 agent 网络中的身份、治理状态、发现授权和可信调用前移成独立信任层，补的是 Agent 接入前的验证与授权基础设施。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-trust"
  - "identity"
  - "protocol"
---

# OpenAgenet/OAN: Open Infrastructure for Trusted Agent Interconnection

## 论文信息

- arXiv：https://arxiv.org/abs/2606.03161
- 作者：Jinliang Xu
- 提交时间：2026-06-02
- 分类：cs.AI

## 研究问题

当 agent 从单体应用走向开放网络后，真正先发生的问题不是“它会不会调用工具”，而是“它凭什么相信另一个 agent 值得连接”。在开放、多运营方环境里，agent 在发现、选择和调用另一个 agent 之前，需要先验证身份来源、治理状态、授权边界、时效性和连接前信任证据。

## 方法概览

论文提出 OpenAgenet（OAN），把这部分能力定义为一个 protocol-neutral trust layer。它不试图替代 MCP、A2A 或具体业务协议，而是前置处理另一类问题：Root-governed identity admission、Registrar-assisted onboarding、Root-verified package publication、authorization-aware discovery 和 signed trusted invocation。

这个框架的重点不是再发明一个“万能 agent 协议”，而是把“连接前的可验证信任”从具体工具调用里拆出来，单独做成治理层。

## 关键贡献

- 把开放 agent 互联中的信任问题前置为独立基础设施层，而不是把授权逻辑塞进每次工具调用。
- 给出 agent identity、注册、发现、包发布、受信调用的整体治理框架。
- 明确说明它与 MCP、A2A、ANP 等协议的关系：不是替代，而是补上连接前的身份与授权验证。
- 为“可信 agent discovery”提供了更贴近现实网络部署的语言。

## 与知识库主题的关系

这篇论文和已有的 Zero Trust、MCP-Persona、运行账本、权限边界主题直接相连。它补的不是 agent 内部推理，而是 agent 之间开始协作之前的“门禁层”。

如果说之前的知识库更关注工具调用时的权限和审计，这篇文章把视角再往前推了一步：在 agent 能否进入你的系统、出现在发现目录、被其他 agent 选中之前，信任证据应该如何产生和验证。

## 可复用观点

- agent 信任边界不该只建在调用时，还应建在发现、注册和身份生命周期上。
- MCP/A2A 解决的是“怎么连”，OAN 这类框架补的是“凭什么能连”。
- 开放 agent 网络里最值钱的不是更多协议，而是可验证的 admission、authorization 和 freshness 证据。

## 可加工为公众号角度

- 可与 [[Zero Trust for AI agents]]、[[MCP-Persona Benchmarking LLM Agents on Real-World Personal Applications via Environment Simulation]]、[[Provably Auditable and Safe LLM Agents from Human-Authored Ontologies]] 合并，写“Agent 可信协作的第一层不是工具，而是身份和门禁”。
- 也可补强“给 AI 员工发临时工牌”这条线：从单系统权限控制扩展到跨 agent 网络的身份准入。
- 今天暂不成稿：观点成立，但还缺更多企业落地或协议互操作案例来支撑，不宜只凭单篇协议论文起稿。

## 关联笔记

- [[Zero Trust for AI agents]]
- [[MCP-Persona Benchmarking LLM Agents on Real-World Personal Applications via Environment Simulation]]
- [[Provably Auditable and Safe LLM Agents from Human-Authored Ontologies]]
- [[2026-05-28 给 AI 员工发临时工牌]]

