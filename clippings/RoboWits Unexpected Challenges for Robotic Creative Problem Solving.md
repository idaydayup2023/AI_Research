---
title: "RoboWits: Unexpected Challenges for Robotic Creative Problem Solving"
source: "arXiv"
arxiv_id: "2605.30326"
authors: "Chunru Lin, Hongxin Zhang, Fenghao Yu, Zhehuan Chen, Thomas L. Griffiths, Yejin Choi, David Held, Chuang Gan"
submitted: "2026-05-28"
created: "2026-06-01"
categories:
  - "cs.RO"
  - "cs.AI"
description: "提出 RoboWits，用多 Agent 自动生成突发约束和任务变体，评估机器人在创造性工具使用、策略适应和鲁棒推理上的短板。"
tags:
  - "arxiv"
  - "robotics"
  - "vla"
  - "agent-evaluation"
  - "tool-use"
  - "robustness"
---

# RoboWits: Unexpected Challenges for Robotic Creative Problem Solving

## 论文信息

- 原文链接：https://arxiv.org/abs/2605.30326
- 项目页：https://umass-embodied-agi.github.io/RoboWits
- 提交日期：2026-05-28
- 作者：Chunru Lin, Hongxin Zhang, Fenghao Yu, Zhehuan Chen, Thomas L. Griffiths, Yejin Choi, David Held, Chuang Gan
- 类别：cs.RO, cs.AI

## 研究问题

很多机器人基准强调技能执行：能不能抓取、移动、装配。但真实世界的问题经常不是“技能不会”，而是环境给了意外约束：工具不顺手、材料属性变了、几何关系卡住了、任务需要临场改策略。

RoboWits 评估的是 robotic creative problem solving：机器人能不能在突发条件下推理、适应，并创造性使用工具。

## 方法概览

论文构建了一个双臂机器人基准，覆盖认知推理、创造性工具使用和对 unexpected conditions 的鲁棒性。

为规模化生成高质量任务，作者提出多 Agent 协作式任务生成流程，包括 seed task generation and verification、metric generation、scene generation 和 task mutation。

最终数据包含 30 个 seed tasks 和 208 个带变体与难度等级的任务，覆盖几何、材料和装配推理。作者评测了常见 robot policies、预训练 VLA 和 oracle-state planners。

## 关键贡献

- 把机器人评测从技能执行推进到突发约束下的策略适应。
- 用多 Agent pipeline 生成任务变体，使“意外场景”可规模化构造。
- 发现预训练 VLA 在 seed tasks 上经过单任务微调有初步成功，但在 mutated tasks 上明显脆弱。
- 把 deceptive or constrained environments 引入机器人 agent 评测，暴露单纯模仿或局部技能学习的不足。

## 与知识库主题的关系

这篇补充 [[VLA-Trace Diagnosing Vision-Language-Action Models through Representation and Behavior Tracing]] 和 [[ElegantVLA Learning When to Think for Efficient Vision-Language-Action Models]]。

ElegantVLA 关注 embodied agent 什么时候该分配更多推理计算；VLA-Trace 关注表示、注意力路径和行为之间的诊断；RoboWits 则把评测压力放到真实环境里的突发约束和策略重组。

它也能迁移到通用 agent：很多 workflow agent 并不是缺工具，而是在工具不可用、条件改变、输入不完整时缺少重新制定策略的能力。

## 可复用观点

- 评测 agent 不能只看标准路径成功率，还要看条件突变后的策略重组能力。
- “会用工具”不等于“会创造性使用工具”；后者需要发现环境 affordance，并在约束下改写计划。
- 多 Agent 任务生成可以用于构造更有压力的 eval：先生成 seed，再生成变体、指标和验证场景。
- 机器人 agent 的失败机制能反哺软件 agent：环境突变、约束欺骗、工具替代和计划修订都应进入评测集。

## 可加工为公众号角度

- `真正的 Agent，要在条件变了以后还会做事`。
- `机器人 Agent 最怕的不是不会动，而是不会改策略`。
- `别只测标准任务成功率，要测突发约束下的重规划`。

目前暂不单独成稿：它可以开启 embodied agent 的“突发约束评测”子题，但和近期 VLA-Trace、ElegantVLA 仍需再合并一到两篇材料，才能形成区别于“具身智能也需要质量门”的新主论点。

## 关联笔记

- [[VLA-Trace Diagnosing Vision-Language-Action Models through Representation and Behavior Tracing]]
- [[ElegantVLA Learning When to Think for Efficient Vision-Language-Action Models]]
- [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
