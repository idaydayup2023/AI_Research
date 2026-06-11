---
title: "VLA-Trace: Diagnosing Vision-Language-Action Models through Representation and Behavior Tracing"
source: "https://arxiv.org/abs/2605.30117"
arxiv_id: "2605.30117"
authors:
  - "Haoyuan Shi"
  - "Xiancong Ren"
  - "Yingji Zhang"
  - "Qinfan Zhang"
  - "Jiayu Hu"
  - "Haozhe Shan"
  - "Han Dong"
  - "Jinpeng Lu"
  - "Yinda Chen"
  - "Yi Zhang"
  - "Yong Dai"
  - "Xiaozhu Ju"
submitted: 2026-05-28
created: 2026-05-31
categories:
  - "cs.AI"
description: "提出 VLA-Trace，用表示动态、attention knockout 和 rollout 行为探针诊断 VLA 模型如何把多模态知识转成具身控制。"
tags:
  - "clippings"
  - "arxiv"
  - "robotics"
  - "vla"
  - "agent-evaluation"
  - "model-diagnostics"
---

# VLA-Trace: Diagnosing Vision-Language-Action Models through Representation and Behavior Tracing

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30117>
- 提交时间：2026-05-28（v1）
- 作者：Haoyuan Shi, Xiancong Ren, Yingji Zhang, Qinfan Zhang, Jiayu Hu, Haozhe Shan, Han Dong, Jinpeng Lu, Yinda Chen, Yi Zhang, Yong Dai, Xiaozhu Ju
- 分类：cs.AI

## 研究问题

VLA 模型正在成为机器人 agent 的核心接口，但一个关键问题还不够清楚：模型如何把视觉、语言和动作空间里的信息转成具身控制？

这篇论文不是再做一个 VLA 性能榜，而是提出诊断框架，追踪表示变化、控制归因和最终行为之间的证据链。

## 方法概览

VLA-Trace 把诊断拆成三层：

- representation dynamics：用 cross-modal 和 checkpoint-drift centered kernel alignment 观察 VLA finetuning 过程中表示如何变化。
- causal control attribution：用 attention knockout 识别动作解码时不同模态和层级的控制路径。
- behavioral manifestation：用 rollout-level 行为探针检查 grounding、shortcut dependence 和 semantic following。

作者在 `π0.5` 和 OpenVLA 上实验，比较两类 VLA 模型在适配动态、路由策略、层级依赖和语义跟随上的差异。

## 关键贡献

- 把 VLA 诊断从“任务是否成功”推进到“表示、路径、行为是否一致”。
- 发现不同 VLA 模型在 finetuning 时有不同的模态适配动态。
- 发现动作解码依赖不同的多模态路由策略和层级路径。
- 指出 VLA 在视觉 grounding 上表现较好，但细粒度语义跟随仍有限。

## 与知识库主题的关系

这篇补充 [[ElegantVLA Learning When to Think for Efficient Vision-Language-Action Models]]：ElegantVLA 讲 embodied agent 什么时候应该分配更多推理计算，VLA-Trace 讲模型内部哪些表示和路径真正支撑动作。

它也和 [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]] 有共性：对 agent 来说，关键不只是能不能完成任务，而是能不能解释不同模态、工具或控制路径在完成任务中的作用。

## 可复用观点

- 具身 agent 的可靠性不能只看成功率，还要看表示链路和行为证据是否对齐。
- 当 agent 接入真实世界，诊断要覆盖“看见了什么、听懂了什么、动作由谁驱动、行为是否真的跟随语义”。
- 对多模态 agent 的评估应该加入 causal probe 和 rollout probe，而不是只做静态问答。
- VLA 方向的工程瓶颈会从“能不能动”转向“为什么这样动、什么时候会走捷径”。

## 可加工为公众号角度

- 角度一：`机器人 Agent 最难的不是会动，而是知道为什么这么动`。聚焦 VLA 可解释诊断。
- 角度二：`具身智能也需要质量门`。把计划层质量门迁移到机器人控制和多模态动作。
- 角度三：`多模态 Agent 的下一步，是把行为路径讲清楚`。可合并 Gemini Robotics、ElegantVLA、VLAConf 等材料。

## 关联笔记

- [[ElegantVLA Learning When to Think for Efficient Vision-Language-Action Models]]
- [[Gemini Robotics 1.5 brings AI agents into the physical world]]
- [[Gemini Robotics-ER 1.6 Powering real-world robotics tasks through enhanced embodied reasoning]]
- [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
