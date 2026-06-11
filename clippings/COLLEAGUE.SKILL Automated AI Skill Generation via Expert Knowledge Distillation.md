---
title: "COLLEAGUE.SKILL: Automated AI Skill Generation via Expert Knowledge Distillation"
source: "https://arxiv.org/abs/2605.31264"
arxiv_id: "2605.31264"
authors:
  - "Tianyi Zhou"
  - "Dongrui Liu"
  - "Leitao Yuan"
  - "Jing Shao"
  - "Xia Hu"
submitted: 2026-05-29
created: 2026-06-02
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.LG"
description: "把个人或角色的异构工作痕迹蒸馏成可检查、可修正、可回滚、可跨 agent host 安装的 person-grounded skill package。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-skills"
  - "knowledge-management"
  - "person-grounded-agents"
  - "workflow"
---

# COLLEAGUE.SKILL: Automated AI Skill Generation via Expert Knowledge Distillation

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.31264>
- 提交时间：2026-05-29（v1）
- 作者：Tianyi Zhou, Dongrui Liu, Leitao Yuan, Jing Shao, Xia Hu
- 分类：cs.AI / cs.CL / cs.LG

## 研究问题

Agent 不只需要完成孤立任务，也越来越需要携带某个专家、岗位或组织角色的判断方式、工作习惯和沟通边界。但真实 expertise 往往散落在文档、对话、修订记录、历史交付物和反馈痕迹里，不是干净的指令。

传统 memory/persona 系统能保存片段，skill framework 能提供可安装格式，但缺少一条端到端流程：如何从异构 traces 中蒸馏出可检查、可修正、可调用、可回滚的技能包。

## 方法概览

COLLEAGUE.SKILL 提出 trace-to-skill distillation，把目标人物或角色的材料转成 versioned skill package。技能包包含两个协调轨道：

- capability track：实践方法、心智模型、决策启发式；
- bounded behavior track：沟通风格、交互规则、修正历史。

技能包可被检查、调用、通过自然语言反馈更新、回滚、跨 agent hosts 安装，并可在受控条件下分发。论文把它描述为 artifact contract、生成流程、修正生命周期、部署 surface 和 domain presets 的组合。

## 关键贡献

- 把“专家经验”从隐藏 memory / persona prompt，转成可版本化 skill package。
- 同时处理能力和行为边界，避免把风格、偏好和专业判断混成一个不可审计提示词。
- 强调 correction lifecycle：技能不是一次性生成，而是可以通过反馈修订和回滚。
- 给个人知识管理与企业岗位 AI 提供一个中间层：知识不只是检索材料，也可以被蒸馏成可执行工作方式。

## 与知识库主题的关系

这篇直接补充 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 与 [[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]。

Perplexity Skills 更偏任务组合模式；COLLEAGUE.SKILL 把技能推进到 person-grounded expertise：不是让 agent 知道“怎么用 SDK”，而是让它继承某个专家的判断习惯和修正历史。

它也连接个人知识库主线：[[Your Obsidian Vault Is Probably Wasting Your Intelligence]] 关注知识层如何为 agent 提供材料；这篇说明材料还可以蒸馏成可安装、可回滚的 skill。

## 可复用观点

- 个人知识库的高级形态不是“被搜索”，而是“被蒸馏成可执行技能”。
- Skill package 应该包含能力轨道和行为边界，不能把专家风格混进不透明 persona。
- 经验写入需要 correction history 和 rollback，否则越用越像无法审计的长期记忆。
- 企业岗位 AI 的关键资产可能不是 prompt，而是可版本化的岗位 skill contract。

## 可加工为公众号角度

- 可成稿方向：`你的知识库最终应该长成 Skill，而不是资料堆`。
- 可合并素材：[[Rethinking Search as Code Generation]]、[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[CODESKILL Learning Self-Evolving Skills for Coding Agents]]。

目前暂不单独成稿：它与既有“厚 Skills”主题相邻，但 person-grounded skill 是新子题。后续可与个人知识层、岗位 AI 和 skill lifecycle 合并成更面向读者实践的文章。

## 关联笔记

- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- [[CODESKILL Learning Self-Evolving Skills for Coding Agents]]
- [[MUSE-Autoskill Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation]]
- [[Your Obsidian Vault Is Probably Wasting Your Intelligence]]
- 已加工成稿：[[2026-06-02 Agent 的接口，不该只有工具调用]]
