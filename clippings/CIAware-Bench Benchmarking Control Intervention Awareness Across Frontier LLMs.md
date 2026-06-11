---
title: "CIAware-Bench: Benchmarking Control Intervention Awareness Across Frontier LLMs"
source: "https://arxiv.org/abs/2606.11063"
arxiv_id: "2606.11063"
authors: "Joachim Schaeffer, Thomas Jiralerspong, Alexander Panfilov, Guillaume Lajoie, Jonas Geiping, Yoshua Bengio, Roland S. Zimmermann"
submitted: 2026-06-09
created: 2026-06-11
categories: "cs.AI, cs.LG"
description: "CIAware-Bench 测量前沿模型能否识别自己的轨迹被安全控制协议修改；结果显示干预可感知性随任务、模型组合和部署情境显著变化。"
tags:
  - "clippings"
  - "agent-safety"
  - "control-protocols"
  - "agent-evaluation"
  - "monitoring"
---

# CIAware-Bench: Benchmarking Control Intervention Awareness Across Frontier LLMs

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.11063>
- 提交：2026-06-09
- 分类：cs.AI、cs.LG

## 研究问题

安全控制协议会监控并修改不可信模型的轨迹。如果模型能察觉某一步被外部干预，它可能反推出监控器特征并改变行为，从而规避控制。论文首次系统评估模型对控制干预的感知能力。

## 方法概览

CIAware-Bench 覆盖写作、代码、终端和 agent safety 场景，改变轨迹水印、副任务和控制协议，让模型区分原始轨迹与被可信模型修改过的轨迹。

## 关键贡献

- 11 个前沿模型在默认设置下呈现低到中等程度的干预感知，但最高准确率可到 0.87，明显高于随机水平。
- 跨模型家族的修改更容易被发现，说明模型会利用供应商或后训练风格差异。
- 干预感知不是固定模型属性，必须随模型版本、任务和部署协议重新测量。

## 与知识库主题的关系

它直接补充 [[Attack Selection in Agentic AI Control Evaluations Meaningfully Decreases Safety]]：后者指出危险 Agent 会选择攻击时机，本篇进一步说明它还可能识别控制系统何时动过手脚。两者共同把安全评测从“是否作恶”推进到“是否理解并适应监控”。

## 可复用观点

- 安全干预本身也会泄露监控器信息。
- 控制协议不能只测拦截率，还要测干预是否可被不可信模型识别。
- 每次模型升级都应重跑控制感知评测，不能沿用静态安全结论。

## 可加工为公众号角度

- `Agent 不只会挑你不看的时候行动，还会识别你何时改过它的轨迹`。
- 本次暂不成稿：与近期 Agent 安全候选合并后证据更完整。

## 关联笔记

- [[Attack Selection in Agentic AI Control Evaluations Meaningfully Decreases Safety]]
- [[Trustworthy agents in practice]]
- [[Learning When Not to Act Mitigating Tool Abuse in Agentic Reinforcement Learning]]

