---
title: "Harness design for long-running application development"
source: "https://www.anthropic.com/engineering/harness-design-long-running-apps"
author:
  - "Prithvi Rajasekaran"
published: 2026-03-24
created: 2026-06-10
description: "Anthropic 通过 generator-evaluator loop、明确评分标准和跨会话产物交接，突破单次 prompt 与静态 harness 的质量上限。"
tags:
  - "clippings"
  - "anthropic"
  - "harness-engineering"
  - "generator-evaluator"
  - "coding-agents"
  - "long-running-agents"
---

# Harness design for long-running application development

## 原文信息

- 原文：<https://www.anthropic.com/engineering/harness-design-long-running-apps>
- 作者：Prithvi Rajasekaran
- 发布时间：2026-03-24
- 类型：Anthropic Engineering

## 核心提取

Anthropic 的早期方法已经用 prompt engineering 和长程 harness 显著提高了 Agent 表现，但两者最终都遇到上限。新的突破来自 generator-evaluator loop：生成者产出，独立评价者按具体标准找差距，反馈再进入下一轮生成。

关键不是多加一个“批评 Agent”，而是先把主观质量转译为可评分标准，并让评价结果能指向下一轮的局部改进。否则 evaluator 只会输出泛泛意见，循环不会收敛。

## 中文译读

### Harness 解决可执行，Loop 解决可收敛

初始化 Agent、任务清单、跨 session 产物和上下文重置，让长任务可以连续执行；generator-evaluator loop 则让每轮都拥有外部质量信号，避免只按原计划机械推进。

### 评价标准是循环的方向盘

设计质量很主观。作者先把“好不好看”拆成具体、可评分的 criteria，再让 evaluator 依据标准提出反馈。这个方法同样适用于代码审查、QA 和内容审稿：没有 rubric，循环只能产生更多文本；有 rubric，反馈才能变成可验证差距。

### 独立评价制造有效反压力

单一 Agent 容易为自己的方案辩护。生成者与评价者分离，可以让系统在不依赖人类逐步盯守的情况下，持续发现当前产物与目标之间的距离。

## 可复用观点

- Prompt 和静态 harness 都可能触顶，突破点往往来自可执行的评价反馈。
- Loop 的最小结构不是“重复调用模型”，而是“生成 -> 评价 -> 定位差距 -> 局部修订 -> 再评价”。
- 评价标准必须具体到能改变下一步动作，并配合停止条件避免无限优化。
- evaluator 自身也需要回归检查，不能把 LLM judge 当作天然真相。

## 可加工为公众号角度

- 可作为“Loop 是 Harness 的时间维度”核心证据。
- 可迁移到主编审稿：审稿意见需要 target、evidence、acceptance 和 regression，才能驱动最小修订循环。
- 与 [[2026-06-10 让 Agent 返工像打补丁]] 互补：该稿讲如何修，这篇材料解释为什么评价反馈必须能定位差距。

## 关联笔记

- 已加工成稿：[[2026-06-10 AI 工程正在从脚手架走向飞轮]]
- [[2026-06-10 让 Agent 返工像打补丁]]
- [[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]
- [[Review Arcade On the Human Alignment and Gameability of LLM Reviews]]

