---
title: "Where Do Deep-Research Agents Go Wrong? Span-Level Error Localization in Agent Trajectories"
source: "https://arxiv.org/abs/2606.02060"
arxiv_id: "2606.02060"
authors: "Jiaming Wang; Ziteng Feng; Jiangtao Wu; Ruihao Li; Qianqian Xie; Yuxiang Ren; He Zhu; Xueming Han; Fanyu Meng; Junlan Feng; Jiaheng Liu"
submitted: "2026-06-01"
created: "2026-06-03"
categories:
  - "cs.AI"
description: "提出 TELBench 和 DRIFT，用 span-level error localization 找出 deep-research agent 轨迹中影响答案可靠性的错误片段。"
tags:
  - "clippings"
  - "arxiv"
  - "deep-research"
  - "agent-evaluation"
  - "trajectory-analysis"
---

# Where Do Deep-Research Agents Go Wrong? Span-Level Error Localization in Agent Trajectories

## 论文信息

- arXiv：https://arxiv.org/abs/2606.02060
- 提交时间：2026-06-01
- 分类：cs.AI
- 作者：Jiaming Wang 等

## 研究问题

Deep-research agents 通过长轨迹完成搜索、工具使用、证据检查和答案综合。只看最终答案可以判断成功与否，却无法定位哪些轨迹片段让答案变得不可靠。论文研究 span-level error localization：在正常探索、失败搜索、临时假设、无害噪声和真正有害错误之间做过程级区分。

## 方法概览

作者收集 2,790 条真实轨迹，来自两个 Agent 框架、三个 backbone model 和三个 benchmark；将原始日志转成语义 spans，并通过 LLM-assisted expert review 标注有害错误片段。基于这些数据构建 TELBench。论文还提出 DRIFT，一个 claim-centric auditing framework，跟踪 Agent 的 claims，检查它们是否被轨迹证据支持，并标记影响答案路径的 unsupported 或 conflicting claims。

## 关键贡献

- 把 deep-research 评测从 final answer 推向 process-level reliability。
- 构建 TELBench，用于识别轨迹中的错误片段。
- DRIFT 在 span-level error localization 和 first-error accuracy 上显著提升。

## 与知识库主题的关系

这篇与 [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]、[[Conformal Certification of Reasoning Trace Prefixes]] 和 [[Scaling Laws for Agent Harnesses via Effective Feedback Compute]] 紧密相连：高成本 research agent run 的中间过程不能只作为上下文消耗掉，必须变成可定位、可复核、可保留的证据资产。

它也为公众号稿 [[2026-05-30 别让 Agent 白白烧掉反馈]] 提供新的过程级评测证据。

## 可复用观点

- 研究 Agent 的质量门不能只看最终答案，必须定位“哪一段轨迹污染了答案”。
- claim-centric audit 比笼统轨迹评分更接近真实可靠性需求。
- 错误定位是反馈资产化的前置条件：不知道错在哪里，就无法复用或修复。

## 可加工为公众号角度

- 可与 Harness-1 合并成“把状态和错误证据搬出模型上下文”。
- 可补充“反馈资产”稿：反馈资产不仅是经验，还包括 first-error 和 harmful span。

## 关联笔记

- 已加工成稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]
- [[Conformal Certification of Reasoning Trace Prefixes]]
- [[2026-05-30 别让 Agent 白白烧掉反馈]]
