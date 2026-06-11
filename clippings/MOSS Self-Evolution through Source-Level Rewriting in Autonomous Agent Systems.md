---
title: "MOSS: Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems"
source: "https://arxiv.org/abs/2605.22794"
arxiv_id: "2605.22794"
authors:
  - "Qianshu Cai"
  - "Yonggang Zhang"
  - "Xianzhang Jia"
  - "Wei Xue"
  - "Jun Song"
  - "Xinmei Tian"
  - "Yike Guo"
submitted: 2026-05-21
created: 2026-05-25
categories:
  - "cs.AI"
  - "cs.LG"
description: "提出让 agent 系统基于生产失败证据进行 source-level rewriting，而不是只改 skill、prompt、memory schema 或 workflow graph。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "self-evolving-agents"
  - "coding-agents"
  - "runtime"
---

# MOSS: Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.22794>
- 提交时间：2026-05-21
- 作者：Qianshu Cai, Yonggang Zhang, Xianzhang Jia, Wei Xue, Jun Song, Xinmei Tian, Yike Guo
- 代码：论文页面标注有 GitHub 链接

## 研究问题

大多数自进化 agent 只会修改文本层资产：skill 文件、prompt 配置、memory schema、workflow graph。问题是，很多系统性失败并不在文本层，而在代码层：路由、hook 顺序、状态不变量、dispatch、回滚和健康检查都写在 harness 源码里。

这篇论文问的是：如果 recurring failure 的根因在 agent substrate 本身，能不能让系统基于失败证据自动改自己的源代码，并用可回放验证和用户同意机制控制风险？

## 方法概览

MOSS 把一次自进化拆成确定性的多阶段流水线：

- 收集生产失败证据，自动整理成一个 failure batch。
- 由外部 coding-agent CLI 生成候选源码修改。
- 在临时 trial worker 中用失败 batch replay 候选镜像。
- 通过用户同意 gate 后，再执行 in-place container swap。
- 用 health probe 和 rollback gate 控制上线风险。

论文强调，MOSS 并不是让模型自由改生产环境，而是把 coding agent 放进一个受控 release pipeline：模型负责提出代码修改，系统负责证据、顺序、裁决、回放、推广和回滚。

## 关键贡献

- 把 agent 自我改进的作用域从文本资产扩展到 source-level adaptation。
- 指出 text-mutable layer 无法触达 routing、state invariant、dispatch 等结构性失败。
- 用 replay + ephemeral workers + user-consent-gated promotion 降低自改代码风险。
- 在 OpenClaw 上，一轮循环把四任务平均 grader score 从 0.25 提升到 0.61。

## 与知识库主题的关系

这篇论文直接推进 [[Agent Harness 与多 Agent 编排]] 主题簇。它补上了 [[Thin Harness, Fat Skills]] 没有展开的一层：skill 可以学习，但如果失败发生在 harness 代码、状态机和工具边界，学习 skill 仍然不够。

它也延续 [[2026-05-12 Agent 不会靠提示词变可靠]] 的判断：可靠性不是 prompt 问题，而是评估、回放、验证、推广和回滚问题。

## 可复用观点

- Agent 的“经验”不能只写回 prompt 或 skill；有些经验必须写回 runtime。
- 自我改进不是让模型自由进化，而是把 coding agent 放进 release pipeline。
- 生产失败证据必须先变成可回放 batch，否则自动修复只是一次性猜测。
- 源码级自改需要最小发布治理：trial worker、health probe、用户同意、rollback。

## 可加工为公众号角度

- Agent 的自我改进，不应该停在提示词和 skill 文件。
- 真正危险的不是 agent 会改代码，而是它改代码时没有 replay、gate 和 rollback。
- 下一代 agent 平台的核心能力可能不是“更多工具”，而是“把失败变成可验证补丁”。

## 关联笔记

- 历史文摘：[[Thin Harness, Fat Skills]]、[[The Anatomy of an Agent Harness]]、[[Shepherd A Runtime Substrate Empowering Meta-Agents with a Formalized Execution Trace]]
- 相关论文：[[Adapting the Interface Not the Model Runtime Harness Adaptation for Deterministic LLM Agents]]
- 相关旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]、[[2026-05-12 Agent 不会靠提示词变可靠]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- 已加工成稿：[[2026-05-25 Agent 自我改进，不该只改提示词]]
- 已加工成稿：[[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
