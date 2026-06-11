---
title: "VitaBench 2.0: Evaluating Personalized and Proactive Agents in Long-Term User Interactions"
source: "https://arxiv.org/abs/2605.27141"
arxiv_id: "2605.27141"
authors:
  - "Yuxin Chen"
  - "Yi Zhang"
  - "Zhengzhou Cai"
  - "Yaorui Shi"
  - "Zhiyuan Yao"
  - "Chenhang Cui"
  - "Jingnan Zheng"
  - "Yaqi Huo"
  - "Xi Su"
  - "Qi Gu"
  - "Xunliang Cai"
  - "Xiang Wang"
  - "An Zhang"
  - "Tat-Seng Chua"
published: 2026-05-27
submitted: 2026-05-27
created: 2026-05-28
categories:
  - "cs.AI"
description: "提出 VitaBench 2.0，评估长期用户互动中的个性化建模与主动交互能力，并提供可扩展 memory interface。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evals"
  - "agent-memory"
  - "personalized-agents"
---

# VitaBench 2.0: Evaluating Personalized and Proactive Agents in Long-Term User Interactions

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.27141>
- 提交时间：2026-05-27（v1）
- 作者：Yuxin Chen 等
- 分类：cs.AI

## 研究问题

现实里的 agent 协作越来越依赖“读懂用户没有明说的意图”：偏好分散在多次互动里，信息不完整，需求会变化，agent 有时还要主动补问或从环境里补齐缺失信息。

现有评测更常看 reasoning 和 tool use，却弱化了长期个性化与主动交互。VitaBench 2.0 试图评估 agent 是否能在长程用户互动中持续提取、使用和更新用户偏好。

## 方法概览

VitaBench 2.0 将任务组织成针对单个用户的时间序列，偏好嵌入在碎片化、异质的日常互动中。完成任务需要 agent 持续抽取、利用和更新偏好。

论文还加入 proactiveness 评估：当信息不足时，agent 需要识别缺口，并主动从用户或环境获取信息后再决策。为支持比较不同 memory architecture，论文提供了可扩展 memory interface。

## 关键贡献

- 把个性化评测从单次 profile matching 推向长期互动序列。
- 把“主动性”纳入评估：agent 不只是回答，还要知道什么时候该补问。
- 提供 memory interface，让不同记忆架构可以在同一框架下比较。
- 结果显示，前沿模型在真实个性化决策上仍有显著缺口。

## 与知识库主题的关系

这篇论文补充了 [[Personalize-then-Store Benchmarking and Learning Personalized Memory for Long-horizon Agents]]：后者强调是否写入长期记忆的门禁，VitaBench 2.0 更强调长期互动后如何使用、更新偏好，以及何时主动补齐信息。

也可与 [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]] 对照：LongMemEval-V2 更偏 evidence gathering，VitaBench 2.0 更偏 personalized decision-making。

## 可复用观点

- 真正的个性化 agent 不只是“记住用户说过什么”，而是能从碎片互动中更新偏好。
- 主动性不是多问问题，而是在信息缺口会影响决策时才补问。
- 评估 memory architecture 时，不能只看最终问答准确率，还要看偏好抽取、更新和使用链路。

## 可加工为公众号角度

- 可后续成稿：好的私人 agent 不是更殷勤，而是知道什么时候不该自作主张。
- 可补充 [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]。

## 关联笔记

- [[Personalize-then-Store Benchmarking and Learning Personalized Memory for Long-horizon Agents]]
- [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]
- [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
- [[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]

