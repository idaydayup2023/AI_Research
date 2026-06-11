---
title: "CODESKILL: Learning Self-Evolving Skills for Coding Agents"
source: "https://arxiv.org/abs/2605.25430"
arxiv_id: "2605.25430"
authors:
  - "Yanzhou Li"
  - "Yiran Zhang"
  - "Xiaoyu Zhang"
  - "Xiaoxia Liu"
  - "Yang Liu"
submitted: 2026-05-25
created: 2026-05-27
categories:
  - "cs.AI"
description: "把 coding agent 的轨迹蒸馏成多粒度 procedural skills，并把 skill 提取与 skill bank 维护改造成可学习的管理策略。"
tags:
  - "clippings"
  - "arxiv"
  - "coding-agents"
  - "agent-skills"
  - "self-evolving-agents"
  - "agent-evals"
---

# CODESKILL: Learning Self-Evolving Skills for Coding Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.25430>
- 提交时间：2026-05-25（v1）
- 作者：Yanzhou Li, Yiran Zhang, Xiaoyu Zhang, Xiaoxia Liu, Yang Liu
- 分类：cs.AI

## 研究问题

Coding agent 在解决软件工程任务时会留下大量轨迹：命令、文件修改、错误恢复、测试反馈、最终补丁。这些轨迹里包含可复用经验，但现有 skill 构造常依赖固定 prompt 和启发式更新规则。

论文问的是：能不能把“从轨迹中提取什么经验、如何抽象、如何维护 skill bank”本身变成一个可学习的管理策略，而不是靠人手写 prompt 或简单总结？

## 方法概览

CODESKILL 是一个 LLM-based framework，核心动作包括：

- 从 coding-agent trajectories 中提取多粒度 procedural skills。
- 用新经验持续演化已有 skills。
- 维护一个规模稳定、面向未来任务求解的 compact skill bank。
- 用强化学习训练 skill 管理策略，奖励来自两部分：dense rubric-based skill-quality feedback，以及 frozen downstream agent 的 sparse verifiable execution feedback。

评测覆盖 EnvBench、SWE-Bench Verified、Terminal-Bench 2。论文报告 CODESKILL 相比 no-skill baseline 平均 pass rate 提升 9.69，相比最强 prompt/memory baseline 提升 4.01，同时 skill bank 规模保持稳定。

## 关键贡献

- 把 skill extraction 和 skill-bank maintenance 从固定提示词流程升级成 learnable management policy。
- 强调 coding agent 的轨迹不是“日志”，而是可蒸馏成 procedural skills 的经验矿。
- 引入“rubric 质量反馈 + 可验证执行反馈”的混合奖励，避免只优化文本好看。
- 证明 skill bank 需要维护规模稳定，否则经验会变成不可检索的噪声堆。

## 与知识库主题的关系

这篇论文和 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[Trace2Skill Verifier-Guided Skill Evolution for Long-Context EDA Agents]]、[[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]] 构成一条清晰脉络：agent 的经验不是简单写进 prompt，而是要经过选择、抽象、验证、维护和演化。

它也补充 [[2026-05-25 Agent 自我改进，不该只改提示词]]：如果失败或经验属于可复用流程，就应进入 skill 层；但 skill 层本身也需要评估和管理策略。

## 可复用观点

- Coding agent 的轨迹应被当成训练数据和组织资产，而不只是审计日志。
- Skill bank 的核心不是“越多越好”，而是能否持续压缩、去重、维护和被下游任务验证。
- 好的 skill 不是读起来像 SOP，而是能提升 frozen downstream agent 的可验证执行结果。
- 未来的 coding agent 平台会把“经验提炼器”作为基础设施，而不是让用户手动写 rules。

## 可加工为公众号角度

- Coding agent 真正的复利，不是多跑几次，而是把每次轨迹变成可复用 skill。
- 经验库如果没有压缩和验证，会从资产变成噪声。
- 技术团队应该把 agent 轨迹当作工程学习系统的原料。

## 关联笔记

- 历史文摘：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[Trace2Skill Verifier-Guided Skill Evolution for Long-Context EDA Agents]]、[[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]]
- 相关旧稿：[[别再把 Agent Skill 当提示词了]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]、[[2026-05-25 Agent 自我改进，不该只改提示词]]
- 已加工成稿：[[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
