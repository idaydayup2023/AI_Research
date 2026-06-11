---
title: "MLEvolve: A Self-Evolving Framework for Automated Machine Learning Algorithm Discovery"
source: "https://arxiv.org/abs/2606.06473"
arxiv_id: "2606.06473"
authors:
  - "Shangheng Du"
  - "Xiangchao Yan"
  - "Jinxin Shi"
  - "Zongsheng Cao"
  - "Shiyang Feng"
  - "Zichen Liang"
  - "Boyuan Sun"
  - "Tianshuo Peng"
  - "Yifan Zhou"
  - "Xin Li"
  - "Jie Zhou"
  - "Liang He"
  - "Bo Zhang"
  - "Lei Bai"
submitted: 2026-06-04
created: 2026-06-08
categories:
  - "cs.AI"
  - "cs.CL"
description: "MLEvolve 用 Progressive MCGS、跨分支参考边、Retrospective Memory 和自适应 coding modes 支撑长程 ML 算法发现。"
tags:
  - "clippings"
  - "arxiv"
  - "self-evolving-agents"
  - "algorithm-discovery"
  - "multi-agent"
  - "ai-for-science"
---

# MLEvolve: A Self-Evolving Framework for Automated Machine Learning Algorithm Discovery

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.06473>
- 提交时间：2026-06-04
- 作者：Shangheng Du, Xiangchao Yan, Jinxin Shi, Zongsheng Cao, Shiyang Feng, Zichen Liang, Boyuan Sun, Tianshuo Peng, Yifan Zhou, Xin Li, Jie Zhou, Liang He, Bo Zhang, Lei Bai
- 分类：cs.AI; cs.CL
- 代码：<https://github.com/InternScience/MLEvolve>

## 研究问题

长程机器学习工程和算法发现任务需要 Agent 持续探索、复用经验、在多个候选分支之间迁移信息。但许多 MLE Agent 存在三个问题：分支之间信息隔离、搜索过程没有长期记忆、规划和代码生成控制层混在一起。

MLEvolve 试图回答：一个自我演化的多 Agent 框架如何在 12 小时级预算内持续发现更好的 ML 算法？

## 方法概览

论文提出 MLEvolve，一个用于端到端 ML algorithm discovery 的 self-evolving multi-agent framework。

核心机制包括：

- Progressive MCGS：把树搜索扩展为带参考边的 graph search，让不同分支能共享有用信息；
- entropy-inspired progressive schedule：从广泛探索逐步转向集中 exploitation；
- Retrospective Memory：结合冷启动领域知识库和动态全局记忆，复用任务特定经验；
- adaptive coding modes：拆分战略规划和代码生成，让长程迭代更稳定。

## 关键贡献

- 把 self-evolving agent 的重点从单条轨迹优化，推进到跨分支信息流和全局记忆复用。
- 将 algorithm discovery、MLE-Bench 和 AlphaEvolve 式优化任务放在同一框架里比较。
- 强调长程 agent 需要分层控制：什么时候探索、什么时候收敛、什么时候编码，不能都交给同一个 prompt。
- 摘要报告其在 MLE-Bench 的平均 medal rate 和 valid submission rate 等指标上达到 SOTA，并在数学算法优化任务上超过专门方法。

## 与知识库主题的关系

这篇直接连接 [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]] 与 [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]。

AlphaEvolve 展示了可验证算法空间中的生产影响；MLEvolve 则提供一个更明确的 harness 结构：跨分支图搜索、回溯记忆、控制层拆分和 coding mode 切换。

它也补充 [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]：TraceGraph 偏诊断共享决策地形，MLEvolve 偏在搜索过程中主动使用跨分支参考边。

## 可复用观点

- 长程算法发现不只是多跑几个候选，而是要让分支之间共享经验。
- 自我演化 Agent 的关键不是“自己改自己”，而是把探索、记忆、规划和编码分成可控层。
- 可验证领域最适合率先形成 agentic discovery loop，因为每个候选都能被执行、评分和淘汰。
- 预算受限时，Agent 需要 progressive schedule，而不是一直同等强度探索。

## 可加工为公众号角度

- 可后续成稿方向：`算法发现 Agent 的复利，来自分支之间会交流`。
- 可合并素材：[[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]]、[[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]、[[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]。
- 暂不单独成稿原因：算法发现主题已有 AlphaEvolve 和科学 Agent 旧稿支撑，但还需要更多失败机制或工程复盘材料，避免写成单篇论文摘要。

## 关联笔记

- [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]]
- [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
- [[TraceGraph Shared Decision Landscapes for Diagnosing and Improving Agent Trajectories]]
- [[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]
- [[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]]
