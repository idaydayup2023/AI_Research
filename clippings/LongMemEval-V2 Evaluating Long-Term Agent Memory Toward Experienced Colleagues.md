---
title: "LongMemEval-V2: Evaluating Long-Term Agent Memory Toward Experienced Colleagues"
source: "https://arxiv.org/abs/2605.12493"
arxiv_id: "2605.12493"
authors:
  - "Di Wu"
  - "Zixiang Ji"
  - "Asmi Kawatkar"
  - "Bryan Kwan"
  - "Jia-Chen Gu"
  - "Nanyun Peng"
  - "Kai-Wei Chang"
submitted: 2026-05-12
published: 2026-05-12
created: 2026-05-14
categories:
  - "cs.CL"
description: "提出 LongMemEval-V2：面向 Web/GUI agent 的“长期环境经验记忆”评测（451 问，覆盖静态/动态状态、workflow、gotchas、premise awareness），并用 AgentRunbook-R（RAG）与 AgentRunbook-C（把轨迹存成文件并调用 coding agent 取证）对比准确率与成本。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "agent-evals"
  - "runbook"
  - "coding-agent"
---

# LongMemEval-V2: Evaluating Long-Term Agent Memory Toward Experienced Colleagues

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.12493>
- 提交时间：2026-05-12（v1）
- 作者：Di Wu, Zixiang Ji, Asmi Kawatkar, Bryan Kwan, Jia-Chen Gu, Nanyun Peng, Kai-Wei Chang
- 分类：cs.CL

## 研究问题

“Agent 记忆”常被简化为用户偏好或对话摘要，但生产级 web/GUI agent 更需要另一类记忆：**对具体环境的经验**——界面 affordances、状态变化规律、workflow 步骤、常见坑与失败模式。

问题在于：现有 benchmark 很少直接评估“记忆是否真的把环境经验内化成可复用知识”，更多只看最终任务成败或短轨迹。

## 方法概览

LongMemEval-V2（LME-V2）提供 451 个人工问题，覆盖五类能力：

- Static state recall：静态事实/配置/界面元素
- Dynamic state tracking：状态随操作变化的追踪
- Workflow knowledge：流程步骤与顺序依赖
- Environment gotchas：常见失败模式与规避策略
- Premise awareness：前提条件/隐藏约束是否被记住

评测形式采用“context gathering”：记忆系统先从长历史轨迹中返回**紧凑证据**，再用于下游问答。

论文对比两类方法：

- AgentRunbook-R：更传统的 RAG memory，把 observations / events / strategy notes 组织进知识池
- AgentRunbook-C：把轨迹以文件形式存储，让 coding agent 在一个增强的 sandbox 中“检索/定位/引用证据”

## 关键贡献

### 1) 把“环境经验”从 chat history 中剥离出来

LME-V2 强调不是“用户说过什么”，而是“这个环境里怎么做才不踩坑”。这更接近真实岗位：新同事要变强，靠的是 runbook 和案例库，而不是背诵聊天记录。

### 2) 直接暴露“记忆系统的证据能力”

用 context gathering 让系统必须给出可核验的 evidence，而不是仅凭模型“觉得自己记得”。这和 [[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]、[[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]] 这种“以失败形态逼出工程短板”的思路一致。

### 3) 一个很工程化的对照：RAG vs coding-agent 取证

AgentRunbook-C 的核心信号是：当历史规模巨大时，**让 coding agent 在文件/轨迹上做检索与引用**，能显著提高准确率，但会付出高延迟成本。

这对“厚 skills / 薄 harness”也有启发：记忆不一定要进上下文；更像一个可调用的“证据检索 skill”，输出可验证片段即可。

## 与知识库主题的关系

- 与“会话管理 / 记忆”直接相关：[[Built-in memory for Claude Managed Agents]]、[[2026-05-13 Agent 上生产前，先管住它的会话]]
- 与“知识层工程”同一个方向：[[AI Knowledge Layer (and why your agents are useless without it)]]、[[Building a Virtual Filesystem for Mintlify's AI Assistant]]
- 与“评测驱动的系统工程”同源：[[ReasoningBank Enabling agents to learn from experience]]

## 可复用观点

- Agent 的长期记忆不该是“总结对话”，而应是“环境 runbook + gotchas + 证据链”。
- Memory 的关键不是容量，而是**能否以证据形式被调用、被核验、被迭代**。
- 用 coding agent 做 evidence gathering 可能是短期有效路线，但成本会逼迫我们做“更结构化、更便宜”的记忆索引与检索。

## 可加工为公众号角度

- 把 Agent 当同事：它需要的是 runbook，不是聊天记录。
- 为什么“记忆”最终会变成一种技能库（skills + evidence），而不是上下文越来越长。
- 从 LME-V2 看 agent 上线后的真正护城河：经验如何沉淀、如何可审计、如何复用。

## 关联笔记

- 已加工成稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]
- 可用于成稿：[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- 记忆与会话：[[Built-in memory for Claude Managed Agents]]、[[2026-05-13 Agent 上生产前，先管住它的会话]]
- 工具与评测：[[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]、[[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]
