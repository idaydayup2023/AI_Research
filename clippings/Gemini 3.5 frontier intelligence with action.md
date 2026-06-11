---
title: "Gemini 3.5: frontier intelligence with action"
source: "https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-5/"
author:
  - "Koray Kavukcuoglu"
  - "Jeff Dean"
  - "Oriol Vinyals"
  - "Noam Shazeer"
published: 2026-05-19
created: 2026-05-29
description: "Google 发布 Gemini 3.5 系列，强调面向复杂 agentic workflows、长程任务、coding、个人 AI agents 和安全保障的模型能力。"
tags:
  - "clippings"
  - "google"
  - "deepmind"
  - "gemini"
  - "model-capability"
  - "agentic-workflows"
  - "coding-agents"
---

# Gemini 3.5: frontier intelligence with action

## 原文信息

- 原文链接：<https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-5/>
- 发布时间：2026-05-19
- 来源：Google Blog / Google DeepMind
- 作者：Koray Kavukcuoglu, Jeff Dean, Oriol Vinyals, Noam Shazeer

## 核心提取

Google 发布 Gemini 3.5 系列，首发 Gemini 3.5 Flash。官方叙事不是单纯 benchmark，而是“frontier intelligence with action”：面向复杂 agentic workflows、coding、长程任务、图形能力、个人 AI agents 和安全保障。页面明确把 Gemini 3.5 与“执行复杂 agentic workflows”绑定。

## 中文译读

### 模型叙事从回答转向执行

Gemini 3.5 的关键词是 action。Google 把模型能力放进 agentic workflows，而不是只讲问答、写作或多模态理解。这与 Gemini API Managed Agents、Antigravity、Gemini for Science 等更新方向一致：模型被设计成更适合进入可执行流程。

对知识库主题来说，它补充的是“模型能力和 harness 如何互相塑形”：当平台主打长程任务、工具使用、coding 和个人 agents 时，模型输出不只是答案，而是要能承受计划、执行、观察、修正、验证的循环。

### Flash 不只是便宜版本

官方把 3.5 Flash 放在首发位置，说明高频 agentic workflow 不只需要最强模型，也需要速度、成本和规模之间的平衡。Agent 系统里的模型选择越来越像资源调度：哪些步骤用高 intelligence，哪些步骤用低延迟，哪些步骤需要多路并行，哪些步骤必须压成本。

这能与 [[New ways to balance cost and reliability in the Gemini API]]、[[Token计算：下一个十年的成本战争]] 串联。

### 个人 AI agents 是模型发布的目标场景

Gemini 3.5 页面把 personal AI agents 放进故事线，这说明“模型发布”越来越会直接绑定具体 workflow 形态。对产品团队来说，不能只问新模型分数高多少，而要问：它让哪些以前太慢、太贵、太不稳定的 agent 流程变成可用？

## 可复用观点

- 下一代模型发布的核心语言正在从“回答更好”转向“执行更可靠”。
- Agentic workflow 的模型选择是资源调度问题，不是单一模型崇拜。
- Flash 类模型如果能承接大量中低风险步骤，会改变 agent 成本结构。
- 模型能力、托管 runtime、developer tools 和安全机制正在被一起发布，说明 agent 产品竞争是系统栈竞争。

## 可加工为公众号角度

- 可与 [[Introducing Claude Opus 4.8]] 合并成稿：模型厂商都在把“努力/行动/成本”做成 agent 控制面。
- 可补充旧稿：[[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]、[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]。

## 关联笔记

- [[Introducing Managed Agents in the Gemini API]]
- [[New ways to balance cost and reliability in the Gemini API]]
- [[Gemini for Science AI experiments and tools for a new era of discovery]]
- [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]]
- [[Token计算：下一个十年的成本战争]]
- 已加工成稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]
