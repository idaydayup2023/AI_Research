---
title: "Selective QA over Conflicting Multi-Source Personal Memory: A Diagnostic Testbed and Method Comparison"
source: "https://arxiv.org/abs/2605.30087"
arxiv_id: "2605.30087"
authors:
  - "Tiancheng Yang"
  - "Matthias Schonlau"
  - "Ilia Sucholutsky"
submitted: 2026-05-28
created: 2026-05-30
categories:
  - "cs.AI"
description: "提出一个针对冲突多源个人记忆的 selective QA 诊断基准，评测系统在证据不完整或相互矛盾时回答或 abstain 的能力。"
tags:
  - "clippings"
  - "arxiv"
  - "memory"
  - "personal-ai"
  - "knowledge-management"
  - "agent-evaluation"
---

# Selective QA over Conflicting Multi-Source Personal Memory: A Diagnostic Testbed and Method Comparison

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30087>
- 提交时间：2026-05-28（v1）
- 作者：Tiancheng Yang, Matthias Schonlau, Ilia Sucholutsky
- 分类：cs.AI

## 研究问题

个人 AI agent 正在走向持久化、多来源记忆：日程、聊天、邮件、设备记录、自我报告、计划和客观日志可能同时存在。现实问题是，这些来源经常冲突或缺失。系统不能只从一个干净历史里检索事实，而要判断哪条证据可信、什么时候应该回答、什么时候应该拒答或暂缓。

论文把这个问题定义为 selective QA over conflicting multi-source personal memory：系统需要基于冲突或不完整来源回答问题，证据不足时选择 abstain。

## 方法概览

作者构建了一个诊断基准，包含 18 个问题模板、8 类推理类型、480 个 personas、4 个随机种子，共 34,560 个实例。数据通过受控的 source distortions 生成，每个来源有不同偏差、缺失和粒度，因此可以区分错误来自“证据本身”还是“冲突解决策略”。

论文比较了无来源、单来源、结构化 fusion、prompt-only frontier LLM 等基线。结果显示，最好的 trained fusion resolver 达到 80.3% accuracy；最强 prompt-only LLM baseline 达到 70.0%。加入 abstention 后，fusion resolver 在 78.3% coverage 下达到 85.3% selective accuracy。

## 关键贡献

- 把个人 AI 记忆从“能否召回”推进到“多源冲突下如何仲裁”。
- 用受控偏差和 deterministic ground truth 区分证据问题与方法问题。
- 引入 selective accuracy / coverage 视角，让系统可以在不确定时 abstain，而不是硬答。
- 证明 prompt-only LLM 在冲突记忆仲裁上仍明显弱于结构化 fusion 方法。

## 与知识库主题的关系

这篇与 [[Agent 的长期记忆不是聊天记录，而是 Runbook]] 和 [[Agent 上线后，也会变老]] 相关，但角度更细：它不讨论 memory 是否会增长或老化，而是讨论多来源记忆在冲突时如何做证据仲裁。

它也补充 [[知识层与个人知识库]]：个人知识层不是把所有材料塞进向量库，而是要区分来源质量、偏差、缺失、更新时间和适用语境。

## 可复用观点

- 长期记忆系统不能只优化 recall，还要优化 conflict resolution 和 abstention。
- 个人 AI 的“懂我”不是记住更多，而是知道哪些自我记录、客观日志和计划之间会冲突。
- 企业知识库也有同类问题：Slack 决策、文档、CRM、财务表和会议纪要未必一致，需要仲裁层。
- 当证据不足时，系统应该有成本可控的“暂不回答/请求更多证据”机制。

## 可加工为公众号角度

- 新角度候选：AI 助手的记忆不是仓库，而是证据仲裁系统。
- 可合并素材：[[How Anthropic's finance team uses Claude to shape the narrative behind the numbers]]、[[Connecting Agents to Decisions]]。
- 可补充旧稿：[[2026-05-12 你的 Obsidian 不该只是信息仓库]]、[[2026-05-28 Agent 上线后，也会变老]]。

## 关联笔记

- [[How Anthropic's finance team uses Claude to shape the narrative behind the numbers]]
- [[Your Obsidian Vault Is Probably Wasting Your Intelligence]]
- [[AI Knowledge Layer (and why your agents are useless without it)]]
- [[PersonalAI 2.0 Enhancing knowledge graph traversal retrieval with planning mechanism for Personalized LLM Agents]]
- [[Is Agent Memory a Database Rethinking Data Foundations for Long-Term AI Agent Memory]]
- 已加工成稿：[[2026-05-30 AI 记忆最危险的不是忘，而是混]]
