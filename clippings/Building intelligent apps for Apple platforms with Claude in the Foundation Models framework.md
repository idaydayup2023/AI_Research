---
title: "Building intelligent apps for Apple platforms with Claude in the Foundation Models framework"
source: "https://claude.com/blog/claude-for-foundation-models"
author: "Anthropic"
published: "2026-06-08"
created: "2026-06-09"
description: "Anthropic 为 Apple Foundation Models framework 发布 Claude Swift package，让 Apple 开发者把端侧模型的 typed Swift 输出交给 Claude 处理更复杂的多步推理、代码生成、联网搜索和数据分析。"
tags:
  - "clippings"
  - "claude"
  - "apple"
  - "model-routing"
  - "structured-outputs"
  - "ai-product-workflow"
---

# Building intelligent apps for Apple platforms with Claude in the Foundation Models framework

## 原文信息

- 原文链接：<https://claude.com/blog/claude-for-foundation-models>
- 来源：Claude Blog
- 发布时间：2026-06-08
- 作者：Anthropic

## 核心提取

这篇文章发布了一个面向 Apple 开发者的 Claude Swift package：开发者可以通过 Apple 的 Foundation Models framework 在 Swift 中调用 Claude，用于更复杂的多步推理、代码生成、联网搜索和数据分析。

它真正有价值的地方不是“Claude 支持 Apple 平台”，而是把 AI 应用的模型调用拆成两层：

- Apple 端侧模型适合快速、本地、低延迟的摘要、抽取、提示生成等任务。
- Claude 适合需要更强推理、更长程上下文、工具调用或联网/代码执行的任务。
- Apple framework 可以通过 `@Generable` 返回 typed Swift values，意味着进入 Claude API 前，输入已经不是原始用户文本，而是更干净、更可约束的结构化对象。
- Swift package 负责把 Claude 的 streaming、tool calls 和 structured responses 接回 SwiftUI view。

## 中文译读

Anthropic 的表述可以理解为：不要让一个模型包打天下。端侧模型先完成低风险、低延迟、可本地化的前处理，把用户意图整理成类型明确的 Swift 值；当任务升级到跨月日志分析、复杂解释、多步推理或需要联网/代码执行时，再交给 Claude。

这个模式把“模型路由”从抽象成本优化，推进到产品界面和数据契约层：用户看到的是同一个体验，系统内部则根据任务阶段选择不同模型。

更关键的是，typed values 让 Claude 不必直接吞下含混的 raw text。它收到的是经过第一道模型和应用 schema 整理后的输入，这会影响可靠性、权限边界、可审计性和成本。

## 可复用观点

- 前置小模型不是大模型的低配替代，而是大模型调用前的结构化入口。
- 模型路由不应只按价格、速度、上下文长度切分，还应按“输入是否已经被整理成契约”切分。
- 端侧模型最适合承担 preflight：抽取、分类、意图澄清、隐私过滤、schema 填充、低风险反馈。
- 大模型最适合承担 upgrade path：多步推理、跨资料连接、代码执行、联网搜索、复杂解释。
- AI 应用的关键边界可能不是 prompt，而是从 raw text 到 typed input 的那一层。

## 可加工为公众号角度

- `先结构化，再调用大模型`：端侧/轻量模型先把用户输入整理成结构化契约，大模型再接复杂推理。
- `大模型不该吃原始请求`：把混乱输入直接丢给最强模型，是成本、可靠性和安全边界同时失控的开始。
- `AI 应用要学会分层用脑`：不同模型不只是能力差异，更是工作流里的不同工序。

## 关联笔记

- [[New ways to balance cost and reliability in the Gemini API]]
- [[Gemini 3.5 frontier intelligence with action]]
- [[How CodeRabbit used Claude to build an agent orchestration system]]
- [[Introducing Managed Agents in the Gemini API]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]

## 加工状态

- 已加工成稿：[[2026-06-09 先结构化，再调用大模型]]
