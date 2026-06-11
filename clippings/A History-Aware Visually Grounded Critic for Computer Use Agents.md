---
title: "A History-Aware Visually Grounded Critic for Computer Use Agents"
source: "https://arxiv.org/abs/2606.11078"
arxiv_id: "2606.11078"
authors: "Jaewoo Lee, Zaid Khan, Archiki Prasad, Justin Chih-Yao Chen, Supriyo Chakraborty, Kartik Balasubramaniam, Sambit Sahu, Elias Stengel-Eskin, Hyunji Lee, Mohit Bansal"
submitted: 2026-06-09
created: 2026-06-11
categories: "cs.AI, cs.CL, cs.CV"
description: "HiViG 为 computer-use agents 加入历史感知、视觉落地的执行前 critic，用压缩宏动作历史维持长程进度，并在点击前核验当前截图中的执行坐标。"
tags:
  - "clippings"
  - "computer-use-agents"
  - "agent-critic"
  - "visual-grounding"
  - "long-horizon"
---

# A History-Aware Visually Grounded Critic for Computer Use Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.11078>
- 提交：2026-06-09
- 分类：cs.AI、cs.CL、cs.CV

## 研究问题

computer-use agent 的 critic 常只检查眼前动作，容易忘记此前已经完成的步骤；同时缺乏视觉落地能力，无法判断“动作意图正确但点击坐标错误”这类最后一公里问题。

## 方法概览

HiViG 在测试时给策略模型增加两个信号：一是把过去交互压缩成 macro-action history，持续记录已完成成果；二是结合当前截图，对候选动作及其坐标做视觉核验，在真正执行前拦截错误。

## 关键贡献

- 将长程进度记忆与当前界面视觉校验放进同一个执行前批评器。
- 在网页、移动端和桌面 benchmark 上都优于标量或纯文字 critic。
- 对 Qwen3-VL-32B 和 Gemini-3-Flash，相对最强基线的平均成功率分别提升 5.8% 和 9.0%。

## 与知识库主题的关系

它与 [[Conformal Certification of Reasoning Trace Prefixes]] 的“保留有效前缀”相邻，但对象从文本推理转向 GUI 执行；也补充 [[StainFlow Entity-Stain Tracking and Evidence Linking for Process Rewards in GUI Agents]]：StainFlow 用状态证据训练过程奖励，HiViG 则在执行时用历史和截图做前置拦截。

## 可复用观点

- 长程 Agent 的 critic 不能只看当前一步，必须知道此前已经完成了什么。
- “计划合理”与“动作落地正确”是两道不同质量门。
- 把错误拦在执行前，比事后依赖回滚更适合具有外部副作用的 Agent。

## 可加工为公众号角度

- `Agent 的质检员要同时看工作日志和现场画面`。
- 适合作为“完整工作日评测”文章中的运行时质量门证据。

## 关联笔记

- 已加工成稿：[[2026-06-11 Agent 上岗前，先让它完整值一次班]]
- [[Workflow-GYM Towards Long-Horizon Evaluation of Computer-use Agentic Tasks in Real-World Professional Fields]]
- [[StainFlow Entity-Stain Tracking and Evidence Linking for Process Rewards in GUI Agents]]
- [[Conformal Certification of Reasoning Trace Prefixes]]
