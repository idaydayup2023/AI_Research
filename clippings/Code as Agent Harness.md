---
title: "Code as Agent Harness"
source: "https://arxiv.org/abs/2605.18747"
arxiv_id: "2605.18747"
authors:
  - "Xuying Ning"
  - "Katherine Tieu"
  - "Dongqi Fu"
  - "Tianxin Wei"
  - "Zihao Li"
  - "et al."
published: 2026-05-18
submitted: 2026-05-18
created: 2026-05-20
categories:
  - "cs.CL"
  - "cs.AI"
  - "cs.LG"
description: "一篇综述论文，将 code 视为 agent reasoning、acting、environment modeling 和 execution-based verification 的统一 harness 基础。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "coding-agents"
  - "tool-use"
  - "multi-agent"
  - "verification"
---

# Code as Agent Harness

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.18747>
- PDF：<https://arxiv.org/pdf/2605.18747>
- 提交时间：2026-05-18
- 分类：cs.CL、cs.AI、cs.LG
- 作者：Xuying Ning, Katherine Tieu, Dongqi Fu, Tianxin Wei, Zihao Li 等

## 研究问题

这篇综述提出一个统一视角：在 agentic systems 中，代码不再只是模型生成的目标产物，而越来越成为 agent 的运行基底。代码连接推理、行动、环境建模和执行式验证，因此可以被视为 agent harness 的核心材料。

换句话说，agent 不是“会写代码的聊天模型”，而是“用代码作为可执行外骨骼的系统”。

## 方法概览

论文把 code as agent harness 分成三个层次：

- Harness interface：代码如何连接 agent 的 reasoning、action 和 environment modeling。
- Harness mechanisms：规划、记忆、工具使用、长程执行、反馈驱动控制和优化。
- Scaling harness：从单 agent 扩展到多 agent，利用共享代码 artifact 支撑协调、评审和验证。

论文覆盖 coding assistants、GUI/OS automation、embodied agents、scientific discovery、personalization/recommendation、DevOps 和 enterprise workflows 等场景。

## 关键贡献

- 把 code 从“输出物”提升为 agent infrastructure 的统一视角。
- 把 harness engineering 的议题系统化：接口、机制、扩展、评估、验证和安全。
- 强调 execution-based verification：代码可以运行、测试、回归，因此比纯自然语言更适合作为 agent 的可核验工作面。
- 指出开放挑战：不能只评最终任务成功率，还要评估中间轨迹、验证不完整反馈、避免 harness regression、多 agent 共享状态一致性、人类监督和多模态环境扩展。

## 与知识库主题的关系

这篇论文直接补强 `Agent Harness 与多 Agent 编排` 主题簇，也能作为 [[The Anatomy of an Agent Harness]]、[[Thin Harness, Fat Skills]]、[[2026-05-13 Agent 上生产前，先管住它的会话]]、[[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]] 的学术侧支撑。

它也与 Google ERA、AlphaEvolve 一起说明一个趋势：coding agent 的价值正在从“写业务代码”扩展为“构造可执行实验与验证系统”。

## 可复用观点

- 代码是 agent 的可执行工作面：能运行、能测试、能回归、能协作。
- Harness 不是包一层 prompt，而是把 reasoning、tools、memory、state、verification 组织成可执行系统。
- 多 agent 协作的关键不是多几个角色，而是共享 artifact、共享状态和可验证变更。
- 未来 agent 评估要从 final answer 转向 trajectory、state consistency、verification quality 和 regression risk。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-13 Agent 上生产前，先管住它的会话]]、[[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- 新角度候选：为什么说代码正在变成 agent 的“操作系统”。
- 新角度候选：AI coding 的终局不是写代码，而是把知识工作变成可执行系统。

## 关联笔记

- [[The Anatomy of an Agent Harness]]
- [[Thin Harness, Fat Skills]]
- [[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- [[2026-05-13 Agent 上生产前，先管住它的会话]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]

