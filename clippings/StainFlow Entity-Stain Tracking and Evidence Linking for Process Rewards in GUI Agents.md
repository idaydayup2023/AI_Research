---
title: "StainFlow: Entity-Stain Tracking and Evidence Linking for Process Rewards in GUI Agents"
source: "arXiv"
arxiv_id: "2606.07027"
authors: "Haojie Hao, Longkun Hao, Yihang Lou, Yan Bai, Zhenyang Li, Zhichao Yang, Dongshuo Huang, Hongyu Lin, Lanqing Hong, Jiakai Wang, Xianglong Liu"
published: "2026-06-05"
created: "2026-06-09"
categories: "cs.AI"
description: "StainFlow 用实体状态流和证据链接为 GUI Agent 构造过程奖励，解决长程 GUI 轨迹中全局 milestone 主观、局部窗口证据稀释的问题。"
tags:
  - "GUI agents"
  - "process rewards"
  - "agent evaluation"
  - "credit assignment"
  - "tool use"
---

# StainFlow

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.07027>
- 标题：StainFlow: Entity-Stain Tracking and Evidence Linking for Process Rewards in GUI Agents
- 作者：Haojie Hao 等
- 提交：2026-06-05
- 分类：cs.AI

## 研究问题

GUI Agent 的长程交互轨迹通常只在最终给出成功/失败信号，这对强化学习太稀疏。已有过程奖励模型会做全局 milestone 或局部 step-level 判断，但也有两个问题：全局阶段划分主观且单一路径化，局部窗口可能漏掉长距离关键证据或被无关帧稀释。

## 方法概览

StainFlow 借鉴网络流分析里的 stain tracing，把 GUI 任务中的可视实体视作可跟踪证据对象：

- Global Entity Stain Tracking：抽取任务相关实体，跟踪实体证据浓度和状态变化，用实体流变化客观划分任务阶段。
- Local Stain Evidence Linking：围绕候选关键节点的触发实体，检索相关历史步骤，动态构造高证据密度窗口，判断该节点是否真的是关键步骤。

## 关键贡献

- 把 GUI 轨迹的过程奖励从“固定窗口评审”推进到“实体证据流评审”。
- 在 AndroidWorld 和 OGRBench 上提升在线 RL 成功率和轨迹完成判断准确率。
- 为 GUI / computer-use agent 的训练信号提供一个可迁移思路：不是只看动作序列，而是看实体状态如何被动作改变。

## 与知识库主题的关系

这篇论文和 [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]、[[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]、[[Scaling Laws for Agent Harnesses via Effective Feedback Compute]] 都在回答同一个问题：长程 Agent 的中间过程哪些步骤真正有价值，哪些证据应该保留下来作为训练或诊断信号。

它对 [[2026-05-30 别让 Agent 白白烧掉反馈]] 是补充证据：反馈资产不只是自然语言复盘，也可以是可计算的实体状态流。

## 可复用观点

- GUI Agent 的过程奖励要围绕“任务实体状态变化”组织，而不是围绕固定长度上下文窗口组织。
- 评价长程轨迹时，关键问题不是每一步是否看似合理，而是某个实体状态是否朝交付目标发生了可验证变化。
- 过程奖励也是一种证据压缩：把长轨迹压成高密度、可训练、可回放的关键节点。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-30 别让 Agent 白白烧掉反馈]]。
- 可后续成稿：`Agent 的中间步骤，应该按证据流计价`。但当前只有 GUI 场景单篇材料，先入库观察，不单独成稿。

## 关联笔记

- 已加工成稿：[[2026-06-11 Agent 上岗前，先让它完整值一次班]]
- [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]
- [[Redundant or Necessary A Benchmark for Detecting Redundant Steps in Agent Trajectories]]
- [[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]
- [[2026-05-30 别让 Agent 白白烧掉反馈]]
