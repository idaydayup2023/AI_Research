---
title: "NanoResearch: Co-Evolving Skills, Memory, and Policy for Personalized Research Automation"
source: "https://arxiv.org/abs/2605.10813"
arxiv_id: "2605.10813"
authors:
  - "Jinhang Xu"
  - "Qiyuan Zhu"
  - "Yujun Wu"
  - "Zirui Wang"
  - "Dongxu Zhang"
  - "Jianxin Tang"
  - "Marcia Tian"
  - "Yiling Duan"
  - "Siyuan Li"
  - "Jingxuan Wei"
  - "Sirui Han"
  - "Yike Guo"
  - "Odin Zhang"
  - "Conghui He"
  - "Cheng Tan"
submitted: 2026-05-11
published: 2026-05-11
created: 2026-05-13
categories:
  - "cs.AI"
description: "提出 NanoResearch：面向个性化研究自动化的多 agent 框架，用 skill bank（可复用程序性知识）、跨会话 memory（用户/项目经验）、以及 label-free policy learning（把自由反馈转成规划器的持久更新）三层协同进化，强调“为谁自动化”与成本随循环下降。"
tags:
  - "clippings"
  - "arxiv"
  - "multiagent"
  - "agent-memory"
  - "agent-skills"
  - "research-workflow"
---

# NanoResearch: Co-Evolving Skills, Memory, and Policy for Personalized Research Automation

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.10813>
- 提交时间：2026-05-11（v1）
- 作者：Jinhang Xu 等
- 分类：cs.AI

## 研究问题

很多“AI research agent”系统假设所有用户都要同一种输出：同样的资料、同样的写法、同样的 pipeline。NanoResearch 的核心追问是：**研究自动化到底是在为谁自动化？** 不同研究者资源不同、偏好不同、输出格式不同；如果系统不个性化，就会“平均化地服务不好每个人”。

作者认为要做个性化研究自动化，需要三种当前系统普遍缺失的能力：

- 跨项目累积可复用的程序性知识（skills）
- 跨会话保留用户/项目经验（memory）
- 把难以显式表达的偏好内化成可持续更新的策略（policy）

## 方法概览

NanoResearch 提出“tri-level co-evolution”：

1) **Skill bank**：把经常重复的研究操作蒸馏成紧凑的程序规则，跨项目复用。
2) **Memory module**：维护用户与项目的经验，用于 grounding planning 决策。
3) **Label-free policy learning**：把自由文本反馈转成对 planner 的持久参数更新，让偏好“写进系统”而不是每次重讲。

三层互相促进：skills 让执行更稳定 → 产生更丰富可用的 memory → memory 反哺更好的规划 → policy 学习把偏好固化成长期策略。

## 关键贡献（偏工程视角）

- 把个性化拆成“可复用流程（skills）/可记住经历（memory）/可内化偏好（policy）”三件事，给了一个可实现的模块化路线图。
- 强调系统应随循环迭代“越跑越便宜、越跑越懂你”（成本与质量都应随周期改善），而不是每次从零开始。

## 与知识库主题的关系

它和本库的 “thin harness / fat skills” 与 “knowledge layer” 两条主线高度一致：研究自动化不是一段 prompt，而是一套会进化的工作流系统；Skill 与 Memory 不是配件，而是长期杠杆。

## 可复用观点

- 个性化不是 UI 选项，而是研究自动化是否可用的前提条件。
- 能长期迭代的系统必须把“经验”与“偏好”变成可写入、可更新、可回放的对象。
- skill/memory/policy 的边界要清晰：能脚本化的进 skill，能回忆的进 memory，难显式但稳定的进 policy。

## 可加工为公众号角度

- 研究自动化的下一阶段：从“帮我搜资料”到“理解我的方法论与偏好”。
- 可与个人知识库/Obsidian 主题合写：为什么知识层要同时存“资料”和“决策/偏好”。

## 关联笔记

- 可补充旧稿：[[2026-05-12 你的 Obsidian 不该只是信息仓库]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- Skills 与记忆：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[Built-in memory for Claude Managed Agents]]、[[ReasoningBank Enabling agents to learn from experience]]

