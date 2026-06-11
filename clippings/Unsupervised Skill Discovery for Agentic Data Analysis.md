---
title: "Unsupervised Skill Discovery for Agentic Data Analysis"
source: "https://arxiv.org/abs/2606.06416"
arxiv_id: "2606.06416"
authors:
  - "Zhisong Qiu"
  - "Kangqi Song"
  - "Shengwei Tang"
  - "Shuofei Qiao"
  - "Lei Liang"
  - "Huajun Chen"
  - "Shumin Deng"
submitted: 2026-06-04
created: 2026-06-08
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.LG"
  - "cs.MA"
description: "DataCOPE 从无标注探索轨迹中提取验证信号，并蒸馏成数据分析 Agent 可复用的 procedural skills。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-skills"
  - "data-analysis"
  - "verifier"
  - "agent-workflow"
---

# Unsupervised Skill Discovery for Agentic Data Analysis

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.06416>
- 提交时间：2026-06-04
- 作者：Zhisong Qiu, Kangqi Song, Shengwei Tang, Shuofei Qiao, Lei Liang, Huajun Chen, Shumin Deng
- 分类：cs.AI; cs.CL; cs.LG; cs.MA

## 研究问题

数据分析 Agent 可以通过 inference-time skills 获得可复用的程序性知识，但高质量技能通常依赖人工标注、专家反馈或成功样本。论文的问题是：如果没有标注奖励，Agent 能不能从自己的探索轨迹里发现可复用分析技能？

这个问题贴近当前知识库的 skills 主线：skill 不只是人写 prompt，也可能是从轨迹比较、验证信号和失败模式中蒸馏出来的工作资产。

## 方法概览

论文提出 DataCOPE，一个无监督、verifier-guided 的 skill discovery 框架。它迭代协调三类角色：

- Data-Analytic Agent：生成探索轨迹；
- Unsupervised Verifier：从轨迹中提取相对质量、覆盖度或一致性信号；
- Skill Manager：对比高低质量轨迹，蒸馏可复用分析步骤和避错规则。

对报告式分析任务，DataCOPE 使用 Adaptive Checklist Verifier，先生成任务特定检查项，再用覆盖度评价报告。对推理式分析任务，使用 Answer Agreement Verifier，把答案一致性和 self-consistency 当作辅助信号。

## 关键贡献

- 把 skill discovery 从人工示范推进到无标注探索轨迹比较。
- 把 verifier 的角色从最终评分器改成技能蒸馏的中间信号生产者。
- 同时覆盖开放式报告分析和答案型推理分析，说明 skill 的形态会随任务输出形态变化。
- 实验显示在 Deep Data Research 和 DABStep 上，相对基线有稳定提升；论文摘要报告 report-style 与 reasoning-style 平均分分别提升 9.71% 和 32.30%。

## 与知识库主题的关系

这篇可连接 [[COLLEAGUE.SKILL Automated AI Skill Generation via Expert Knowledge Distillation]]、[[CODESKILL Learning Self-Evolving Skills for Coding Agents]] 和 [[MUSE-Autoskill Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation]]。

区别在于：COLLEAGUE.SKILL 更偏专家痕迹蒸馏，CODESKILL 更偏 coding trajectories，DataCOPE 则把“无监督验证信号”放到数据分析场景里，提供一条更低成本的 skill 发现路径。

它也补充 [[How Anthropic enables self-service data analytics with Claude]]：企业自助分析不只需要安全口径和 canonical paths，还需要把反复出现的分析策略沉淀成可复用技能。

## 可复用观点

- 高质量 skills 不一定从专家手册来，也可以从多条探索轨迹的差异中来。
- Verifier 的价值不只是给最终答案打分，还可以帮助提炼“为什么这条路径更好”。
- 数据分析 Agent 的技能应按输出形态分层：报告式任务需要覆盖度清单，推理式任务需要答案一致性和歧义处理。
- 如果企业想规模化 AI 分析，真正要沉淀的是分析过程中的检查项、分歧点和避错策略。

## 可加工为公众号角度

- 可后续成稿方向：`Skill 不是写出来的，也可以从轨迹里长出来`。
- 可合并素材：[[COLLEAGUE.SKILL Automated AI Skill Generation via Expert Knowledge Distillation]]、[[Lessons from building Claude Code How we use skills]]、[[How Anthropic enables self-service data analytics with Claude]]。
- 暂不单独成稿原因：skills 母题近期已多次出现，本篇应作为“无监督轨迹蒸馏”子题储备。

## 关联笔记

- [[COLLEAGUE.SKILL Automated AI Skill Generation via Expert Knowledge Distillation]]
- [[CODESKILL Learning Self-Evolving Skills for Coding Agents]]
- [[MUSE-Autoskill Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation]]
- [[Lessons from building Claude Code How we use skills]]
- [[How Anthropic enables self-service data analytics with Claude]]
