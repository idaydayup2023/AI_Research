---
title: "Trace2Skill: Verifier-Guided Skill Evolution for Long-Context EDA Agents"
source: "https://arxiv.org/abs/2605.21810"
arxiv_id: "2605.21810"
authors:
  - "Zijian Du"
  - "Nathaniel Pinckney"
submitted: 2026-05-20
published: 2026-05-20
created: 2026-05-22
categories:
  - "cs.AI"
  - "cs.MA"
description: "提出 Trace2Skill：从 hard-failure rollout traces、oracle lessons 与 bounded verifier feedback 中演化 task-specific natural-language skills，在不更新模型权重的前提下改善长上下文 EDA agent。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-skills"
  - "coding-agents"
  - "verifier"
  - "test-time-scaling"
---

# Trace2Skill: Verifier-Guided Skill Evolution for Long-Context EDA Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.21810>
- 提交时间：2026-05-20（v1）
- 作者：Zijian Du, Nathaniel Pinckney
- 分类：cs.AI / cs.MA

## 研究问题

长上下文硬件任务要求 agent 在大型 repo 里定位 RTL、testbench、include path 与 build dependency，再从 hidden verifier 的稀疏失败中恢复。很多任务会同时击穿现有硬件 agent 与 frontier coding agents。

论文问的是：当模型权重不改、稀疏 pass/fail 又不够指导恢复时，能不能让执行轨迹本身推动 skill 变好。

## 方法概览

Trace2Skill 把 natural-language skill 当成可演化 policy artifact，而不是固定提示词：

- 先让固定 agent 多次 rollout；
- 从成功与失败 traces 中提取 diagnostics 与 oracle lessons；
- 用 oracle、mutator、selector 循环演化 task-specific skills；
- 在可选配置下，用 bounded dense verifier feedback 返回经清洗的功能性观察，补足 hidden verifier 过稀的信号。

最终适配对象不是模型权重，而是后续 rollout 会读取的 skill 文档。

## 关键贡献

### 1) Skill 被当成测试时策略，而不是知识附件

这篇论文最有迁移价值的地方是：skill 不只是保存“怎么做”，而是从真实失败里长出来的执行策略。它直接连接 search、editing、validation 与 recovery。

### 2) 失败 trace 需要 verifier 反馈才能变成好教材

单个 pass/fail 标签太粗。论文把 verifier evidence、skill text 与后续行为连成 co-optimization loop，说明“从失败学习”不是把日志喂回模型，而是要设计可用的反馈密度。

### 3) 不更新权重也能做 test-time adaptation

论文聚焦 hard-failure recovery，给出一种很工程的中间路线：先把轨迹、skill 与验证器飞轮做起来，再决定是否值得做昂贵训练。

## 与知识库主题的关系

- 它直接深化 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 与 [[Thin Harness, Fat Skills]]：skill 的维护可以进一步走向 trace-driven evolution。
- 它与 [[ReasoningBank Enabling agents to learn from experience]] 相邻，但更强调 verifier-gated skill artifact，而不是抽象 reasoning memory。
- 它也可补充 coding agent 线：[[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]。

## 可复用观点

- 真正的 skill 维护闭环应读取失败轨迹和验证反馈，而不只靠人工润色 prompt。
- 可验证任务里，verifier 是 skill 演化的放大器。
- Test-time scaling 不一定只等于多采样；也可以演化 agent 下一轮会依赖的策略文档。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- 新角度候选：Skill 不是写出来的，是从失败轨迹里训练出来的。

## 关联笔记

- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[Thin Harness, Fat Skills]]
- [[ReasoningBank Enabling agents to learn from experience]]
- [[Code as Agent Harness]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- 已加工成稿：[[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
