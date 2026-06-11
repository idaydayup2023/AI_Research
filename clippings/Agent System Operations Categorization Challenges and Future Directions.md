---
title: "Agent System Operations: Categorization, Challenges, and Future Directions"
source: "https://arxiv.org/abs/2606.01581"
arxiv_id: "2606.01581"
authors:
  - "Zexin Wang"
  - "Changhua Pei"
  - "Yuanhao Liu"
  - "Jingjing Li"
  - "Yintong Huo"
  - "Quan Zhou"
  - "Haotian Si"
  - "Hang Cui"
  - "Zihan Liu"
  - "Gaogang Xie"
  - "Fei Sun"
  - "Dan Pei"
  - "David Lo"
published: "2026-06-01"
created: "2026-06-04"
categories:
  - "cs.MA"
description: "这篇论文把 AgentOps 系统化为 monitoring、anomaly detection、root cause localization、resolution 四阶段，并区分 intra-agent 与 inter-agent 异常，为 agent 运维和可观测性提供统一框架。"
tags:
  - "clippings"
  - "arxiv"
  - "agentops"
  - "observability"
  - "multi-agent"
---

# Agent System Operations: Categorization, Challenges, and Future Directions

## 论文信息

- arXiv：https://arxiv.org/abs/2606.01581
- 作者：Zexin Wang、Changhua Pei、Yuanhao Liu、Jingjing Li、Yintong Huo、Quan Zhou、Haotian Si、Hang Cui、Zihan Liu、Gaogang Xie、Fei Sun、Dan Pei、David Lo
- 提交时间：2026-06-01
- 分类：cs.MA

## 研究问题

Agent 系统正在快速进入真实部署，但相比 DevOps、MLOps、AIOps，围绕 agent 的运维与故障治理仍缺少一个统一框架。论文要解决的是：agent 系统的异常到底该怎么分型，运维流程应该围绕什么阶段组织。

## 方法概览

作者把 Agent System Operations（AgentOps）定义成四个核心阶段：monitoring、anomaly detection、root cause localization、resolution。与此同时，论文先对异常做两大类划分：intra-agent anomalies 和 inter-agent anomalies，再讨论这些异常如何映射到运维流程。

这不是一篇提出新 benchmark 或新模型的论文，而是一篇框架型综述。它的价值在于把 agent 的不稳定性从“模型偶尔犯错”提升为一个系统操作对象。

## 关键贡献

- 明确提出 AgentOps 的四阶段框架：监控、异常检测、根因定位、修复。
- 指出 agent 系统异常既有单 agent 内部的 reasoning/planning/action/memory 问题，也有多 agent 之间的通信、协调、信任和安全问题。
- 把 agent 运维的难点从传统 infra 指标扩展到语义级、轨迹级和协同级异常。
- 为后续做 replay、对比诊断、状态快照、policy gate、trajectory audit 提供了统一语境。

## 与知识库主题的关系

这篇论文和最近的运行账本、接口层、反馈资产主线高度契合。它等于给“为什么要把状态、错误证据和反馈资产外置”补了一层运维解释：因为 agent 上线后会出现的不是单一 bug，而是跨推理、跨工具、跨角色的复合异常。

它也能和 [[Where Do Deep-Research Agents Go Wrong Span-Level Error Localization in Agent Trajectories]]、[[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]、[[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]] 连起来，形成“AgentOps / 轨迹诊断 / 根因定位”支线。

## 可复用观点

- agent 系统的可运维对象应从 infra 指标扩展到 memory、plan、trace、role interaction 和 semantic anomalies。
- “上线后观察”不能只看成功率，还要看异常类型分布和根因归属。
- AgentOps 的关键不只是 guardrail，而是让 replay、root cause localization 和 resolution 有统一坐标系。

## 可加工为公众号角度

- 可与 [[Where Do Deep-Research Agents Go Wrong Span-Level Error Localization in Agent Trajectories]]、[[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]、[[2026-06-03 把 Agent 的运行账本搬出上下文]] 合并，写“Agent 上线后的新工种不是提示词工程，而是 AgentOps”。
- 暂不成稿：今天同时补到 skills、AI-native engineering、analytics governance 三个更贴近产品与组织的案例，单独把 AgentOps 写成观点稿会偏综述。

## 关联笔记

- [[Where Do Deep-Research Agents Go Wrong Span-Level Error Localization in Agent Trajectories]]
- [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]
- [[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[2026-05-28 Agent 上线后，也会变老]]
