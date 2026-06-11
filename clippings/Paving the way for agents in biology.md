---
title: "Paving the way for agents in biology"
source: "Anthropic Research"
author: "Laura Luebbert"
published: "2026-06-08"
created: "2026-06-09"
description: "Anthropic Science 以病毒序列检索为案例，说明科学 Agent 的瓶颈不只是推理能力，而是缺少确定性、可复现、可审计的数据访问层。"
tags:
  - "AI agents"
  - "AI for Science"
  - "scientific workflow"
  - "deterministic tools"
  - "agent infrastructure"
---

# Paving the way for agents in biology

## 原文信息

- 原文：<https://www.anthropic.com/research/agents-in-biology>
- 关联预印本：<https://arxiv.org/pdf/2606.06749>
- 来源：Anthropic Research
- 发布时间：2026-06-08
- 作者：Laura Luebbert，基于 Ferdous Nasri、Sarah Gurev、Patrick Varilly、Krithik Ramesh、Nuala A. O'Leary、Jonah Cool、Bernhard Y. Renard、Pardis Sabeti、Laura Luebbert 的研究

## 核心提取

这篇文章讨论的是科学 Agent 的基础设施缺口：模型已经能理解复杂生物学任务，但现实数据系统仍然主要为人类点击、筛选、下载和手动整理而设计。Anthropic Science 用 NCBI Virus 序列检索做案例，测试 Claude、Biomni、Edison Analysis、GPT 等科学研究 Agent 能否完成 120 个真实病毒序列查询。

结果很有迁移价值：

- 没有专用检索层时，即使强模型也无法稳定达到科学数据构建所需的准确性和可复现性。
- 同一 prompt 多次运行会得到不同序列集合，进而影响系统发育树、疫情起源时间、抗体靶点覆盖等下游科学结论。
- 加入 `gget virus` 这样的确定性检索层后，所有 evaluated agents 的准确率都提升到 90% 以上，最高接近 99.7%，模型间差距显著缩小，运行稳定性提升。

## 中文译读

这篇文章最值得抽出的判断是：**科学 Agent 的可靠性，不应该靠模型每次重新穿越混乱数据门户，而应该靠可调用、可记录、可复现的确定性基础设施。**

生物数据库的问题不是没有信息，而是信息分散在多个数据库、API、网页过滤逻辑和领域约定里。人类专家知道哪些 filter 该点、哪些字段有隐含语义、哪些记录应该排除；Agent 只能在文档、网页和工具之间猜。猜错一次，后面的科学分析可能全部建立在错误数据集上。

因此，这篇文章把 AI for Science 的问题从“模型能不能做科学推理”转向“科学基础设施是否 agent-accessible”。真正需要确定性的不是假设生成，而是底层数据坐标、schema、过滤逻辑、标识符、下载边界和日志。

## 可复用观点

- 在高风险科学工作流里，Agent 的创造力应该在上层，底层数据访问必须尽量无聊、确定、可审计。
- “Agent 能自己摸索出来”不等于“应该每次让 Agent 重新摸索”。即使模型能力继续进步，成本、延迟、审计和可复现性仍然支持把常规路径做成确定性工具。
- Agent-ready infrastructure 的衡量标准不是有没有 API，而是 API 是否暴露与人类界面一致的过滤语义、是否返回机器可读日志、是否覆盖分页/批处理/字段歧义。
- 科学 Agent 的失败常常不是 reasoning failure，而是 environment / interface failure。

## 可加工为公众号角度

- 可与 [[Making Claude a chemist]]、[[Physics Is All You Need A Case Study in Physicist-Supervised AI Development of Scientific Software]] 合并成科学工作流稿：`科学 Agent 的底座不是更会猜，而是更少需要猜`。
- 也可补充 Agent Harness 主题：确定性工具不是过时脚手架，而是让模型能力从“会做”变成“可复现地做”的执行地基。
- 暂不单独成稿原因：6 月 8 日刚补过科学工作流材料，今天更适合作为“确定性数据层”证据入库，等待更多科学基础设施案例后合并。

## 关联笔记

- [[Making Claude a chemist]]
- [[Physics Is All You Need A Case Study in Physicist-Supervised AI Development of Scientific Software]]
- [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]]
- [[Co-Scientist A multi-agent AI partner to accelerate research]]

