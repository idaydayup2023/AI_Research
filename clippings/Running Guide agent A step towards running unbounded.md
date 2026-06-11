---
title: "Running Guide agent: A step towards running unbounded"
source: "https://blog.google/innovation-and-ai/models-and-research/google-deepmind/running-guide-agent/"
author: "Robin Dua; Miguel de Andrés-Clavera"
published: "2026-05-20"
created: "2026-06-03"
description: "Google DeepMind 的 Running Guide agent 用端侧分割、Gemma 4 多模态推理和多 Agent 分工，为低视力跑者提供实时安全引导。"
tags:
  - "clippings"
  - "google-deepmind"
  - "embodied-agent"
  - "multi-agent"
  - "edge-ai"
---

# Running Guide agent: A step towards running unbounded

## 原文信息

- 原文链接：https://blog.google/innovation-and-ai/models-and-research/google-deepmind/running-guide-agent/
- 来源：Google Blog / Google DeepMind
- 作者：Robin Dua；Miguel de Andrés-Clavera
- 发布时间：2026-05-20

## 核心提取

这篇文章介绍了 Google DeepMind 的 Running Guide agent：一个面向盲人和低视力跑者的实时跑步辅助系统。它不是把“Agent”做成聊天助手，而是做成一个具身安全系统：设备挂在胸前或智能眼镜上，实时理解环境，并通过声音反馈帮助用户避障、转向、休息和恢复跑步。

最值得入库的是它的混合架构：一条端侧分割路径负责低延迟安全提示，另一条 Gemma 4 多模态推理路径负责更复杂的场景理解；系统还用 smarter frame selection，只把突发地形变化、新障碍等高信息帧交给模型处理，避免每帧都走高成本推理。

它的多 Agent 分工也很清晰：Planner agent 负责天气、地图、目标和起跑校准；Coach agent 在跑步中发出简短、分级的告警；Break agent 管理暂停和恢复。这里的 Agent 分工不是“多个角色聊天”，而是围绕实时风险、用户动作和反馈通道组织。

## 中文译读

文章里最重要的信号是：真实世界 Agent 的核心不是“会不会推理”，而是“什么必须低延迟、什么可以深推理、什么必须用严格反馈层表达”。跑步场景不允许把所有判断都交给大模型，因为危险提示的延迟和误报成本极高。

因此，Running Guide agent 把高风险安全路径和高层语义理解路径拆开。端侧分割模型承担立即停止、方向声等底层安全能力；Gemma 4 只在需要复杂场景理解时介入。这是典型的 embodied agent 分层：安全反射层、语义理解层、任务规划层、用户反馈层不能混在同一个模型调用里。

## 可复用观点

- 高风险 Agent 应先拆低延迟安全路径和高层推理路径，而不是把所有判断交给一个大模型。
- “少处理帧”也是一种成本和可靠性设计：只让模型看高信息、高不确定性、高风险变化。
- 多 Agent 分工在真实产品里应围绕风险等级、反馈通道和状态生命周期组织，而不是围绕抽象岗位名组织。
- 具身 Agent 的输出不是文本答案，而是用户能立刻执行的反馈：停止、转向、继续、休息。

## 可加工为公众号角度

- 可与 VLA-Trace、ElegantVLA、RoboWits 合并成“具身 Agent 的质量门不在答案，而在实时反馈层”。
- 可补充“Agent 不该拼命干活，要学会花预算”：高信息帧选择是 embodied agent 里的 compute routing。
- 可补充“Agent 的接口，不该只有工具调用”：真实世界接口层还包括声音、动作、传感器、危险等级和暂停恢复状态。

## 关联笔记

- 已加工成稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[ElegantVLA Learning When to Think for Efficient Vision-Language-Action Models]]
- [[VLA-Trace Diagnosing Vision-Language-Action Models through Representation and Behavior Tracing]]
- [[RoboWits Unexpected Challenges for Robotic Creative Problem Solving]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
