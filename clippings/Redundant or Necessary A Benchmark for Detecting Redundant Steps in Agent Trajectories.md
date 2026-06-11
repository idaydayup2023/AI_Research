---
title: "Redundant or Necessary? A Benchmark for Detecting Redundant Steps in Agent Trajectories"
source: "https://arxiv.org/abs/2605.29893"
arxiv_id: "2605.29893"
authors:
  - "Minyang Hu"
  - "Bo Yang"
  - "Zhinuo Zhou"
  - "Jiachen Liang"
  - "Guo Jiahao"
  - "Yiyang Yin"
  - "Xiongwei Han"
submitted: 2026-05-28
created: 2026-05-30
categories:
  - "cs.AI"
description: "提出 RedundancyBench，用人工标注的 agent trajectories 判断每一步是必要还是冗余，指出现有方法检测冗余步骤仍很弱。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-evals"
  - "agent-trajectory"
  - "cost-optimization"
  - "tool-use"
---

# Redundant or Necessary? A Benchmark for Detecting Redundant Steps in Agent Trajectories

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.29893>
- 提交时间：2026-05-28（v1）
- 作者：Minyang Hu, Bo Yang, Zhinuo Zhou, Jiachen Liang, Guo Jiahao, Yiyang Yin, Xiongwei Han
- 分类：cs.AI

## 研究问题

LLM agents 常通过多步推理和工具调用完成复杂任务，但现有评测主要看最终任务是否成功，很少检查执行轨迹是否高效。现实中，agent trajectory 可能包含大量冗余步骤：消耗 token、工具调用、时间和人审注意力，却没有推动任务完成。

## 方法概览

论文提出 redundant step detection 这一研究方向，并构建 RedundancyBench。数据集中包含多样任务和人工标注轨迹，每一步都按其对任务完成的贡献标注为冗余或必要。作者评估了 3 类代表方法，判断轨迹中的具体步骤是否冗余。

## 关键贡献

- 把 agent evaluation 从最终成功推进到 trajectory efficiency。
- 给每一步引入贡献标注，帮助定位“看起来在忙但没有推进任务”的行为。
- 结果显示，即使表现最好的方法也只有 24.88% score，部分方法还低于随机猜测。
- 说明冗余步骤不是简单靠启发式就能稳定识别，agent trajectory 审计仍是难题。

## 与知识库主题的关系

这篇补强“预算纪律”和“角色审计”两条主线。昨天的 [[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]] 关注多 Agent 重复搜索；这篇把问题进一步细化到单条 trajectory 的每一步：哪些动作必要，哪些只是噪声。

它也能支撑 [[2026-05-28 AI coding 的质量门，要前移到计划层]]：计划层质量门之后，还需要执行轨迹质量门。

## 可复用观点

- Agent 评测不能只问“做成了吗”，还要问“哪些步骤其实没必要”。
- 冗余不是小问题，它会消耗成本、增加延迟、污染上下文，并让人类审查更难。
- 轨迹审计应成为长程 agent 的常规日志分析任务。
- 高价值 feedback 与冗余 step 是同一枚硬币的两面：要提高有效反馈密度，就必须识别低贡献步骤。

## 可加工为公众号角度

- 新角度候选：Agent 不该只留下结果，还要留下可审计路径。
- 可合并素材：[[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]、[[Introducing dynamic workflows in Claude Code]]。
- 可补充旧稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]。

## 关联笔记

- [[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]
- [[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]]
- [[Agentic CLEAR Automating Multi-Level Evaluation of LLM Agents]]
- [[2026-05-28 AI coding 的质量门，要前移到计划层]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- 已加工成稿：[[2026-05-30 别让 Agent 白白烧掉反馈]]
