---
title: "SpecBench: Evaluating Specification-Level Reasoning for Software Engineering LLM Agents"
source: "arXiv"
arxiv_id: "2605.30314"
authors: "Grant Hamblin, Kevin Song, Zhanda Zhu, Anand Jayarajan, Sihang Liu, Nandita Vijaykumar, Gennady Pekhimenko"
submitted: "2026-05-28"
created: "2026-06-01"
categories:
  - "cs.MA"
description: "提出 SpecBench，用真实开源项目 RFC 审查历史评估 SWE agents 的规格层推理能力，而不是只看给定需求后的代码实现。"
tags:
  - "arxiv"
  - "coding-agents"
  - "agent-evaluation"
  - "specification"
  - "software-engineering"
---

# SpecBench: Evaluating Specification-Level Reasoning for Software Engineering LLM Agents

## 论文信息

- 原文链接：https://arxiv.org/abs/2605.30314
- 提交日期：2026-05-28
- 作者：Grant Hamblin, Kevin Song, Zhanda Zhu, Anand Jayarajan, Sihang Liu, Nandita Vijaykumar, Gennady Pekhimenko
- 类别：cs.MA

## 研究问题

当前 coding agent 评测大多默认需求已经正确、完整、无歧义，例如给定 issue 或测试后让 agent 去修改代码。但真实软件工程里，最危险的问题往往更早发生：初始方案本身不完整、有歧义、和系统约束冲突，或者隐藏了错误假设。

SpecBench 要评估的是 specification-level reasoning：agent 能不能在写代码前发现规格缺陷。

## 方法概览

论文从成熟开源项目的 RFC 流程构造任务。每个任务给 agent：初始设计提案、项目代码库、历史 RFC 讨论。agent 的任务不是实现功能，而是指出规格层缺陷，包括遗漏、歧义、不一致和错误假设。评测答案来自历史中维护者实际提出的 critique。

数据覆盖 Kubernetes、React、Rust、TVM 和 vLLM 五个仓库。作者用当前 SWE agents 测试，分析它们在没有执行反馈时做系统设计审查的能力。摘要中报告最好模型 GPT-5.4 准确率为 44.4%。

## 关键贡献

- 把 coding agent 评测从“实现给定需求”前移到“审查需求是否可实现、是否正确”。
- 用真实 RFC 讨论作为规格质量门，而不是人工编造 toy specification。
- 明确提出没有 execution feedback 的系统设计推理，是 SWE agents 自动化软件生命周期的短板。
- 给计划层质量门提供了更具体的评测形态：不是让 agent 写更多 plan，而是让它发现 plan 之前的规格缺陷。

## 与知识库主题的关系

这篇直接补充 [[2026-05-28 AI coding 的质量门，要前移到计划层]] 和 [[How CodeRabbit used Claude to build an agent orchestration system]]。

CodeRabbit 案例强调在 coding request 和 coding agent 之间加 structured coding plan；SpecBench 进一步说明，计划层质量门还不够，规格层也需要被审查。否则 agent 可能在错误需求上执行得很勤快，测试也可能只验证了局部实现。

它也和 [[Review Arcade On the Human Alignment and Gameability of LLM Reviews]] 形成互补：一个关注质量门会不会被博弈，一个关注质量门能不能识别上游规格缺陷。

## 可复用观点

- coding agent 的质量门要前移到规格层，而不只是计划层和实现层。
- 真正高价值的 agent 不是更快写代码，而是能在写代码前指出“这个需求本身不成立”。
- 企业内部可以把 RFC、ADR、设计评审记录转成 agent eval 数据集，用历史维护者 critique 评估 agent 的规格审查能力。
- 评测 coding agent 时应区分三类能力：规格审查、计划分解、代码实现。只测最后一层会高估自动化程度。

## 可加工为公众号角度

- `别急着让 Agent 写代码，先让它审需求`。
- `AI coding 的质量门，还要再往前移一格`。
- `最贵的 bug，不在代码里，在规格里`。

目前暂不单独成稿：它与 2026-05-28 的计划层质量门高度相邻，但提供了更上游的“规格层”证据。后续若合并 Review Arcade、Conformal Certification 和 CodeRabbit，可形成一篇“AI 质量门要覆盖规格、计划、轨迹和审稿反博弈”的综合稿。

## 关联笔记

- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
- [[How CodeRabbit used Claude to build an agent orchestration system]]
- [[Review Arcade On the Human Alignment and Gameability of LLM Reviews]]
- [[Conformal Certification of Reasoning Trace Prefixes]]
