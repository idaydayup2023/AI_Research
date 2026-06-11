---
title: "Long-running Claude for scientific computing"
source: "https://www.anthropic.com/research/long-running-Claude"
author:
  - "Siddharth Mishra-Sharma"
published: 2026-03-23
created: 2026-06-10
description: "Anthropic 用进度文件、测试 oracle、Git 检查点和 Ralph loop 组织跨会话、长时间运行的科学计算 Agent。"
tags:
  - "clippings"
  - "anthropic"
  - "agent-loop"
  - "long-running-agents"
  - "scientific-computing"
  - "ralph-loop"
---

# Long-running Claude for scientific computing

## 原文信息

- 原文：<https://www.anthropic.com/research/long-running-Claude>
- 作者：Siddharth Mishra-Sharma
- 发布时间：2026-03-23
- 类型：Anthropic Research 实践文章

## 核心提取

文章展示的不是一个更长的 prompt，而是一套跨 session 的运行协议：高层目标写入 `CLAUDE.md`，进度、失败路径和精度表写入 `CHANGELOG.md`，测试 oracle 持续判断是否进步，Git 提供检查点和恢复能力，循环负责在 Agent 提前宣告完成时把任务重新送回执行。

真正支撑长任务的不是模型一直记住全部历史，而是把目标、状态、证据和验收标准外置。每个新 session 可以从稳定文件恢复，而不是依赖不断膨胀的聊天上下文。

## 中文译读

### 长任务首先需要清楚的完成定义

作者选择的科学计算任务有明确目标：与参考实现达到功能等价，并把关键科学输出的误差控制在约定范围内。长程 Agent 可以偶尔接受人类监督，前提是系统能用参考实现、量化目标或测试套件判断自己是否真的前进。

### 文件承担跨会话记忆

进度文件记录当前状态、已完成任务、失败方法及原因、关键精度表和已知限制。尤其重要的是失败路径：如果不写下来，新 session 会反复走同一条死路。

### Ralph loop 解决的是“过早停止”

文章把 Ralph loop 描述为一种简单编排模式：当 Agent 声称完成时，再把它送回上下文并追问是否真的达到规格。它的价值不是机械增加轮数，而是用完成标准抵抗 Agent 的提前收工倾向。

### Git 是恢复与协调层

每个有意义的工作单元都提交，并在提交前运行测试。这样即使会话、机器或计算配额中断，下一轮仍可从可验证的状态恢复。

## 可复用观点

- 长程 Agent 的核心资产是外置状态、可执行 oracle 和可恢复检查点，不是超长对话。
- Loop 必须围绕明确的停止条件运行；没有验收标准的循环只会放大成本和漂移。
- 失败路径也属于记忆，否则循环会把同一种错误重复得更快。
- Ralph loop 是任务内闭环，不等同于跨任务的系统自我改进。

## 可加工为公众号角度

- 可作为“Prompt -> Vibe Coding -> Harness -> Loop”范式文章的任务内循环证据。
- 可补充 [[2026-06-03 把 Agent 的运行账本搬出上下文]]：进度文件和 Git 是循环能够跨 session 继续的状态基础。
- 可与生产 trace/eval 改进循环对照，区分“把一次任务做完”和“让系统下一次做得更好”。

## 关联笔记

- 已加工成稿：[[2026-06-10 AI 工程正在从脚手架走向飞轮]]
- [[Running Guide agent A step towards running unbounded]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]

