---
title: "Multi-Turn Evaluation of Deep Research Agents Under Process-Level Feedback"
source: "https://arxiv.org/abs/2606.09748"
arxiv_id: "2606.09748"
authors: "Rishabh Sabharwal; Hongru Wang; Amos Storkey; Jeff Z. Pan"
submitted: 2026-06-08
created: 2026-06-10
categories:
  - "cs.AI"
  - "cs.CL"
  - "cs.LG"
description: "评估 deep-research agent 在自我反思和过程级反馈下的多轮修订：定向反馈首轮有效，但整篇重写会让已满足标准明显回退。"
tags:
  - "clippings"
  - "arxiv"
  - "deep-research"
  - "process-feedback"
  - "revision"
  - "agent-evaluation"
---

# Multi-Turn Evaluation of Deep Research Agents Under Process-Level Feedback

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.09748>
- 提交：2026-06-08（v1）
- 作者：Rishabh Sabharwal, Hongru Wang, Amos Storkey, Jeff Z. Pan
- 分类：cs.AI / cs.CL / cs.LG

## 研究问题

现有 deep-research benchmark 多评估一次性报告，但真实工作流会经历审稿、反馈和返工。论文追问：研究 Agent 收到反馈后，是否能持续改进，而不是只在第一轮看起来更好？

## 方法概览

作者比较两种修订方式：

- self-reflection：Agent 不接收外部诊断，自行反思并重写；
- process-level feedback：系统根据 rubric 的满足和未满足模式推断研究过程缺口，再给出定向指导。

论文提出 Research Gap Inference（RGI），把缺失标准映射为检索、证据覆盖或研究策略问题。

## 关键贡献

- 自我反思中，新标准的补入和旧标准的回退比例接近，净改善很小。
- 一轮过程级反馈可把 normalized score 提高约 8-15 分，反馈采纳率约 35%-40%。
- 后续整篇重写没有形成复利，反而会让最多 24% 的既有满足项回退。
- 证明“给出更好反馈”仍不等于“拥有可靠修订协议”。

## 与知识库主题的关系

这篇把 [[Conformal Certification of Reasoning Trace Prefixes]] 的“保留有效前缀”推进到内容修订场景，也补充 [[2026-05-30 别让 Agent 白白烧掉反馈]]：反馈被看见不够，还要避免修订时破坏已经验证过的部分。

## 可复用观点

- Agent 返工的核心指标应是净改善，而不是新增满足项数量。
- 修订评测必须同时记录 incorporation 和 regression。
- 对长报告、代码或方案，默认全量重写会扩大回归面。
- 更稳的流程是锁定已通过项，对未通过项做局部补丁，再运行回归检查。

## 可加工为公众号角度

- `Agent 返工，为什么越改越容易丢分？`
- `让 Agent 返工像打补丁，而不是重新生成。`
- 已与 Evaluation Cards、CHAP 和历史修订材料合并成稿：[[2026-06-10 让 Agent 返工像打补丁]]。

## 关联笔记

- [[Conformal Certification of Reasoning Trace Prefixes]]
- [[Review Arcade On the Human Alignment and Gameability of LLM Reviews]]
- [[Where Do Deep-Research Agents Go Wrong Span-Level Error Localization in Agent Trajectories]]
- 已加工成稿：[[2026-06-10 让 Agent 返工像打补丁]]

