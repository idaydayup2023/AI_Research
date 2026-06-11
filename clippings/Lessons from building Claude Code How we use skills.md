---
title: "Lessons from building Claude Code: How we use skills"
source: "https://claude.com/blog/lessons-from-building-claude-code-how-we-use-skills"
author: "Thariq Shihipar"
published: "2026-06-03"
created: "2026-06-04"
description: "Anthropic 总结 Claude Code 内部数百个 skills 的使用经验：九类技能库、验证型技能优先、避免把默认常识写进 skill。"
tags:
  - "clippings"
  - "anthropic"
  - "claude-code"
  - "skills"
  - "agent-harness"
---

# Lessons from building Claude Code: How we use skills

## 原文信息

- 原文链接：https://claude.com/blog/lessons-from-building-claude-code-how-we-use-skills
- 来源：Claude Blog
- 作者：Thariq Shihipar
- 发布时间：2026-06-03

## 核心提取

这篇文章最有价值的地方，不是再次说明“skills 很重要”，而是把 Anthropic 内部数百个 skills 的使用经验压缩成一套可迁移的资产设计方法。

文章先给出一个很实用的分类框架：内部 skills 大致会落在九类里，包括库/API 参考、产品验证、数据分析、团队流程自动化、脚手架模板、代码质量与审查、CI/CD、runbook、基础设施操作。Anthropic 的判断很明确：最好的 skill 往往只服务一个清晰类别，跨太多职责的 skill 会让 agent 困惑。

更关键的经验是“验证型 skill 的回报最高”。文章明确说这类 skill 对内部输出质量的提升最可量化，甚至值得一个工程师花一周专门把验证 skill 做扎实。它们通常不是几段说明文字，而是带脚本、断言、浏览器驱动、TTY 驱动、状态检查的视频或日志能力。

另一条很值得记的是：不要把 Claude 本来就会做的常识重写一遍。skill 的价值不在复述默认能力，而在补足组织内的隐性知识、错误模式、风险边界、查询路径和验证流程。

## 中文译读

这篇文章实际上在回答一个更底层的问题：企业里的 skill 到底该被当成什么。Anthropic 给出的答案不是“prompt 模板”，而是“把组织里的工作方法和验证资产打包成 agent 可调用的目录”。

它把 skill 的重心从“教模型怎么说”移到了“让模型知道该查什么、怎么验证、什么不能乱做”。这和最近几篇关于 harness、接口层、状态外置的线索是一致的：真正可复用的不是一句提示词，而是上下文边界、执行脚本、rubric、验证器、参考片段和操作顺序。

九类 skill 的分类也很有用，因为它把 skill library 从零散收藏夹变成了有空位意识的资产盘点表。团队可以问的不是“我们还要不要写 skill”，而是“我们的验证 skill 是否足够厚”“runbook 是否已经 agent 化”“数据分析 skill 是否有统一的 canonical path”。

## 可复用观点

- skill 应被视为组织经验资产，而不是 prompt 装饰层。
- 最值得优先建设的是验证型 skill，因为它直接决定 agent 输出能否进入交付链路。
- 一个 skill 最好只承担一个清晰职责，避免让 agent 在单个 skill 里同时学习规则、流程、工具和判断边界。
- 好的 skill 应该显式写出 gotchas、canonical path、验证脚本和失败时的停手条件。

## 可加工为公众号角度

- 可与 [[A harness for every task dynamic workflows in Claude Code]]、[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[Thin Harness, Fat Skills]] 合并，写“skill 不是提示词，而是组织验证资产”的新稿。
- 也可补充 [[2026-06-02 Agent 的接口，不该只有工具调用]]：接口层再往上一层，其实是 skill library 的治理。
- 今天暂不成稿：近期公众号连续聚焦 harness、接口、状态与技能治理，再写容易和 6 月 2 日、6 月 3 日两篇形成近距重复。

## 关联笔记

- 已加工成稿：[[2026-06-08 把计划变成 Agent 团队的工作台]]
- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[Thin Harness, Fat Skills]]
- [[A harness for every task dynamic workflows in Claude Code]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
