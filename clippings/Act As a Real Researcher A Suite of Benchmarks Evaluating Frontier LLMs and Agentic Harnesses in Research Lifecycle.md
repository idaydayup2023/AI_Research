---
title: "Act As a Real Researcher: A Suite of Benchmarks Evaluating Frontier LLMs and Agentic Harnesses in Research Lifecycle"
source: "arXiv"
arxiv_id: "2606.07462"
authors: "Jiayu Wang, Weijiang Lv, Bowen Fu, Jing Fu, Jiayi Song, Lingyu Zhang, Lanxuan Xue, Luodi Chen, Zepeng Xin, Kaiyu Li, Xiangyong Cao"
published: "2026-06-05"
created: "2026-06-09"
categories: "cs.AI"
description: "AARRI-Bench 评估 frontier LLMs 和 agentic harnesses 在真实研究生命周期细节中的专业判断、伦理敏感性和研究习惯，而不只看宏观执行能力。"
tags:
  - "AI agents"
  - "agent evaluation"
  - "AI for Science"
  - "research agents"
  - "benchmarks"
---

# Act As a Real Researcher

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.07462>
- 标题：Act As a Real Researcher: A Suite of Benchmarks Evaluating Frontier LLMs and Agentic Harnesses in Research Lifecycle
- 作者：Jiayu Wang 等
- 提交：2026-06-05
- 分类：cs.AI

## 研究问题

现有 research agent 评测多关注宏观任务执行：能不能跑实验、写代码、完成长程流程。但真正的研究者能力往往藏在更细的场景里：是否注意字段细节、是否遵守研究伦理、是否对领域语境敏感、是否知道哪些结果不能草率解释。

论文提出 AARR benchmark series，并先发布 AARRI-Bench，试图评估 AI 是否能像真实研究实习生一样处理研究生命周期中的颗粒度任务。

## 方法概览

作者构造一组 granular research scenarios，用 frontier models 和 agentic systems 做实验，比较模型与脚手架组合在专业判断、细节把握和研究行为上的表现。论文特别强调：更复杂的 scaffolding 不等于更像研究者，研究行为本身需要被拆出来评估。

## 关键贡献

- 把 research agent 评测从“能否执行复杂任务”推进到“是否具备研究现场的细节敏感性”。
- 指出即使最佳配置 Mini-SWE-Agent + Claude Opus 4.7 也只有 68.3% 成功率，并会遗漏人类研究者容易注意到的关键细节。
- 对 AI for Science 主题提供一个重要边界：Agent 可以成为研究助理，但距离替代研究者的专业判断仍有明显缺口。

## 与知识库主题的关系

这篇论文补充 [[Making Claude a chemist]] 和 [[Paving the way for agents in biology]]：科学 Agent 的难点不仅是工具和数据层，也包括研究行为的细节标准。它也能补充 [[Agent 的长期记忆不是聊天记录，而是 Runbook]]：很多研究经验不是事实记忆，而是“哪些细节会改变结论”的判断规程。

## 可复用观点

- 研究 Agent 的评测不能只看最终论文式交付物，还要看中间是否遵守研究者的细节纪律。
- “更强 harness”可能提升执行，但未必补上领域敏感性、伦理判断和结果解释边界。
- 研究生命周期评测应拆成粒度任务，暴露人类专家默认会做、模型容易忽略的细节。

## 可加工为公众号角度

- 可与科学工作流材料合并成稿：`科学 Agent 不是少一个博士，而是多一套可检查的研究纪律`。
- 暂不单独成稿原因：单篇 benchmark 适合作为科学 Agent 质量门证据，暂不足以脱离近期科学工作流储备线单独写公众号稿。

## 关联笔记

- [[Paving the way for agents in biology]]
- [[Making Claude a chemist]]
- [[Physics Is All You Need A Case Study in Physicist-Supervised AI Development of Scientific Software]]
- [[RealICU Do LLM Agents Understand Long-Context ICU Data A Benchmark Beyond Behavior Imitation]]

