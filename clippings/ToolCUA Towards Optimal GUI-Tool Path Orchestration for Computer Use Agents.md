---
title: "ToolCUA: Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents"
source: "https://arxiv.org/abs/2605.12481"
arxiv_id: "2605.12481"
authors:
  - "Xuhao Hu"
  - "Xi Zhang"
  - "Haiyang Xu"
  - "Kyle Qiao"
  - "Jingyi Yang"
  - "Xuanjing Huang"
  - "Jing Shao"
  - "Ming Yan"
  - "Jieping Ye"
submitted: 2026-05-12
published: 2026-05-12
created: 2026-05-14
categories:
  - "cs.AI"
description: "提出 ToolCUA：面向 computer-use agents 的“GUI 原子操作 vs 高层工具调用”的路径编排问题，试图让 agent 学会何时切 GUI、何时用工具、如何在两者间最优切换以减少无谓步骤与失败。"
tags:
  - "clippings"
  - "arxiv"
  - "computer-use"
  - "tool-use"
  - "agent-planning"
  - "orchestration"
---

# ToolCUA: Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.12481>
- 提交时间：2026-05-12（v1）
- 作者：Xuhao Hu, Xi Zhang, Haiyang Xu, Kyle Qiao, Jingyi Yang, Xuanjing Huang, Jing Shao, Ming Yan, Jieping Ye
- 分类：cs.AI

## 研究问题

Computer Use Agents（CUA）往往同时拥有两种动作空间：

- GUI 原子动作：click / type / drag / scroll…
- 高层工具调用：API / 文件操作 / structured tool…

混合动作空间带来的“真实工程痛点”是：**agent 不知道什么时候该继续 GUI，什么时候应该切到工具**。结果通常是：

- GUI 里走很多冗余步骤（慢、易错、不可复现）
- 工具切换过早（缺少上下文或前置状态，导致失败）
- 在两者之间来回跳（策略退化）

## 方法概览（摘录级）

论文把问题抽象为“GUI-tool path orchestration”，目标是让 agent 在执行过程中能选择更优路径（更少步骤、更低失败率、更稳定）。

（本次只读 metadata + abstract；若后续用于成稿，需要再打开 PDF/项目页确认其具体方法：是数据集、训练框架、规划器、还是离线最短路径监督等。）

## 关键贡献（从摘要推断的工程意义）

- 把“该用哪个 action space”明确成一个可优化目标，而不是靠 prompt 祈祷。
- 把 GUI 与工具的混合执行看成一种 runtime 编排问题，和“薄 harness + 厚 skills”的工程拆分高度一致：
  - GUI 更像 fallback / last-mile actuator
  - 工具更像高确定性 skill
  - 编排器则是 harness 层的策略与约束

## 与知识库主题的关系

- 与 computer-use 交互入口相关：[[Reimagining the mouse pointer for the AI era]]
- 与 tool-use 的最后一公里评测相关：[[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- 与“不要把可靠性寄托在提示词”相关：[[2026-05-12 Agent 不会靠提示词变可靠]]

## 可复用观点

- GUI agent 的瓶颈往往不是“看不懂屏幕”，而是“路径选择”：什么时候 GUI、什么时候 tool、什么时候验证状态。
- “多工具 + 多动作空间”会自然引入编排层；编排层的策略（成本/可靠性/可审计性）会变成产品护城河。

## 可加工为公众号角度

- Computer-use agent 的拐点不是视觉更强，而是会“少走弯路”：把 GUI 当 fallback，把工具当主路。
- 把 GUI/tool 切换变成工程目标：成本、可靠性、审计三者如何权衡？

## 关联笔记

- 已加工成稿：[[2026-05-14 Agent 的长期记忆不是聊天记录，而是 Runbook]]
- 交互与上下文捕获：[[Reimagining the mouse pointer for the AI era]]
- 工具现实复杂度：[[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
