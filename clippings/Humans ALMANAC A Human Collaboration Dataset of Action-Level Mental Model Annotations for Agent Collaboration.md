---
title: "Humans' ALMANAC: A Human Collaboration Dataset of Action-Level Mental Model Annotations for Agent Collaboration"
source: "https://arxiv.org/abs/2606.06388"
arxiv_id: "2606.06388"
authors:
  - "Jiaju Chen"
  - "Yuxuan Lu"
  - "Jiayi Su"
  - "Chaoran Chen"
  - "Songlin Xiao"
  - "Zheng Zhang"
  - "Yun Wang"
  - "Yunyao Li"
  - "Jian Zhao"
  - "Tongshuang Wu"
  - "Toby Jia-Jun Li"
  - "Dakuo Wang"
  - "Bingsheng Yao"
submitted: 2026-06-04
created: 2026-06-08
categories:
  - "cs.AI"
  - "cs.CL"
description: "ALMANAC 用 action-level mental model annotations 评估 Agent 是否能理解协作中的自我推理、伙伴意图和共享目标。"
tags:
  - "clippings"
  - "arxiv"
  - "human-agent-collaboration"
  - "multi-agent"
  - "evaluation"
  - "mental-models"
---

# Humans' ALMANAC: A Human Collaboration Dataset of Action-Level Mental Model Annotations for Agent Collaboration

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.06388>
- 提交时间：2026-06-04
- 作者：Jiaju Chen, Yuxuan Lu, Jiayi Su, Chaoran Chen, Songlin Xiao, Zheng Zhang, Yun Wang, Yunyao Li, Jian Zhao, Tongshuang Wu, Toby Jia-Jun Li, Dakuo Wang, Bingsheng Yao
- 分类：cs.AI; cs.CL

## 研究问题

LLM Agent 越来越被设计成协作者，但大多数评测仍偏任务完成率、下一步动作或最终分数。论文提出的问题更细：一个 Agent 要成为协作者，是否能在行动层面维持和对齐三类心智模型：自己的推理、伙伴的意图、团队的共同目标？

这让协作能力从“能不能完成任务”推进到“能不能理解为什么对方这样行动，以及下一步应该如何配合”。

## 方法概览

论文提出 ALMANAC 数据集，来自社会科学中经典的 Map Task 双人路线协作任务。数据包含 2,987 个 collaboration actions，每个动作都配有 theory-informed mental model annotations，记录参与者的 self-reasoning、perceived partner intent 和 perceived team goal。

作者用它 benchmark 六个 LLM，测试模型预测人类下一轮行为和心智模型的能力。

## 关键贡献

- 把协作 Agent 评测从动作正确性推进到 process-level collaborative competence。
- 提供 action-level mental model annotations，使模型不仅要预测“下一步做什么”，还要解释协作心智状态。
- 为 human-agent / multi-agent 协作提供一个更贴近社会科学的评估材料，而不是只用合成工具调用任务。
- 提醒 Agent 协作系统不能只优化任务完成，还要优化意图对齐、误解修正和共享目标维护。

## 与知识库主题的关系

这篇可补充 [[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]] 和 [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]。

前者关注多 Agent 角色贡献，后者关注轨迹中的 productive cores 和 trap regions；ALMANAC 则把问题推进到人类协作心智模型：贡献不只来自动作，也来自对伙伴意图和团队目标的持续估计。

它也和 [[Redesigning Claude Code on desktop for parallel agents]] 相关。并行 Agent 管理不是只看状态列表，还要看每个 Agent 是否理解用户、其他 Agent 和共同目标之间的关系。

## 可复用观点

- 协作能力不能只按任务完成率评估，还要看 Agent 是否维护正确的伙伴意图模型。
- 多 Agent 系统的“共享状态”不只是文件、任务和日志，还包括谁以为谁知道什么。
- 人机协作里的很多失败不是工具失败，而是协作心智模型没有对齐。
- 如果企业要部署 Agent 团队，界面和审计日志应暴露意图、假设和共享目标，而不是只暴露动作。

## 可加工为公众号角度

- 可后续成稿方向：`Agent 团队真正共享的，不该只是任务列表`。
- 可合并素材：[[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]]、[[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]、[[Redesigning Claude Code on desktop for parallel agents]]。
- 暂不单独成稿原因：当前只有一个数据集材料，适合先作为“协作心智模型评测”储备。

## 关联笔记

- [[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]]
- [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]
- [[Redesigning Claude Code on desktop for parallel agents]]
- [[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]
- [[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
