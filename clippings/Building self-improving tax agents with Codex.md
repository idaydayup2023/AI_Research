---
title: "Building self-improving tax agents with Codex"
source: "https://openai.com/index/building-self-improving-tax-agents-with-codex/"
author:
  - "Aravind Srinivasan"
  - "Samay Shamdasani"
  - "Arthur Fernandes Araujo"
  - "John de Wasseige"
published: 2026-05-27
created: 2026-06-10
description: "OpenAI 与 Thrive 把专家修正、生产轨迹、定向评测和 Codex 工程任务连接成可度量的 Agent 改进循环。"
tags:
  - "clippings"
  - "openai"
  - "codex"
  - "agent-improvement-loop"
  - "production-traces"
  - "evals"
  - "enterprise-ai"
---

# Building self-improving tax agents with Codex

## 原文信息

- 原文：<https://openai.com/index/building-self-improving-tax-agents-with-codex/>
- 作者：Aravind Srinivasan、Samay Shamdasani、Arthur Fernandes Araujo、John de Wasseige
- 发布时间：2026-05-27
- 类型：OpenAI Engineering 生产案例

## 核心提取

这篇文章把“自我改进”落到了生产闭环：专家在真实业务中修正结果，产品保留从源文件、字段抽取、证据出处到最终提交的完整 trace；重复且可行动的差异被聚类成 eval target；Codex 再基于 trace、eval、repo 和 skills 调查根因、实现局部修复，并同时运行定向评测和回归套件。

这里的 loop 不是让 Agent 自由修改自己。只有经过专家判断、重复出现并被结构化的问题，才会变成有明确成功条件的工程任务；模糊或不安全的案例仍回到人类团队。

## 中文译读

### 生产使用必须产生证据

过去的人工修正只是终点：值被改对了，但系统不知道为什么错。新的产品设计把每次修正变成结构化数据，记录 Agent 提议了什么、专家改了什么、最终采用了什么。

### 不是每个差异都值得学习

预测值与最终值不同，可能是抽取错误，也可能是专家偏好、历史数据沿用、业务噪声或尚未支持的产品行为。系统先捕捉差异，再聚类重复失败，最后才把经过审查的模式转成 eval target。

### Eval 给循环一座明确的山

Codex 收到的不是“结果不太好”，而是代表性输入、期望输出、生产 trace、可修改范围和定向/回归评测。这样改进才有边界、验收和回滚基础。

### 自我改进仍有人类所有权

专家负责定义哪些错误重要，工程师保留架构、产品决策和发布责任。Agent 加速的是调查、实现和验证循环，不是取代治理。

## 可复用观点

- 真正的 improvement loop 是 `生产行为 -> 结构化差异 -> 重复模式 -> eval -> 有界修改 -> 回归验证 -> 新证据`。
- 反馈只有被保存为可复现证据并转成 eval，才会产生复利。
- Harness 定义一次运行如何工作；improvement loop 决定多次运行如何积累。
- 自我改进必须区分可自动化的有界层与需要人类判断的高影响层。

## 可加工为公众号角度

- 可作为“Loop 不只是把一次任务做完，而是让每次生产都训练系统”的核心案例。
- 可直接迁移到 ai-research：主编必改项和运行复盘先结构化聚类，再决定仅记录、候选规则、低风险自动改进或总编确认。
- 可补强 [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]] 的生产案例，但新稿应把重点放在双层循环和时间复利上。

## 关联笔记

- 已加工成稿：[[2026-06-10 AI 工程正在从脚手架走向飞轮]]
- [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
- [[2026-05-30 别让 Agent 白白烧掉反馈]]
- [[Evaluation Cards An Interpretive Layer for AI Evaluation Reporting]]

