---
title: "MemFail: Stress-Testing Failure Modes of LLM Memory Systems"
source: "https://arxiv.org/abs/2605.26667"
arxiv_id: "2605.26667"
authors:
  - "Ishir Garg"
  - "Neel Kolhe"
  - "Dawn Song"
  - "Xuandong Zhao"
published: 2026-05-27
submitted: 2026-05-27
created: 2026-05-28
categories:
  - "cs.AI"
  - "cs.LG"
description: "提出 MemFail，诊断 LLM memory systems 在 summarization、storage、retrieval 三个操作上的具体失败模式。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "agent-evals"
  - "memory-systems"
---

# MemFail: Stress-Testing Failure Modes of LLM Memory Systems

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.26667>
- 提交时间：2026-05-27（v1）
- 作者：Ishir Garg, Neel Kolhe, Dawn Song, Xuandong Zhao
- 分类：cs.AI / cs.LG

## 研究问题

越来越多 LLM agent 依赖外部 memory systems 来保持长程互动一致性，但很多评测只报告聚合问答准确率，把 memory 当黑箱。这样很难判断错误来自 summarization、storage 还是 retrieval。

MemFail 的问题意识是：如果 memory 是生产级 agent 的关键底座，就不能只问“答对没有”，还要诊断是哪一个 memory operation 失败。

## 方法概览

论文将 memory system 形式化为 summarization、storage、retrieval 三类 canonical operations，并围绕这些操作提出潜在失败模式。

基于这些假设，MemFail 构造了 5 个数据集、4 类任务，每类任务针对特定 memory operation 做 adversarial stress test。论文用该框架评估 4 个现代 memory systems，用于比较不同架构带来的 tradeoff。

## 关键贡献

- 把 memory failure 从黑箱准确率拆成可归因的操作失败。
- 将 stress test 对准 summarization、storage、retrieval，而不是只看最终回答。
- 给 memory 架构比较提供诊断框架，有助于定位修复点。

## 与知识库主题的关系

这篇论文与 [[Your Agents Are Aging Too Agent Lifespan Engineering for Deployed Systems]] 相邻：AgingBench 看长期运行退化，MemFail 看 memory pipeline 的局部失败模式。两者共同指向一个结论：agent memory 需要体检系统，而不是只需要更大容量。

它也补充 [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]：写入门禁之后，还要知道总结、存储、检索每一步如何失败。

## 可复用观点

- Memory 不是一个功能，而是一条会在多个操作点失败的 pipeline。
- “答错了”不是诊断；要知道是总结丢信息、存储污染，还是检索没召回。
- 对 memory system 的评测应该 adversarial、分操作、可归因。

## 可加工为公众号角度

- 可补充旧稿：[[2026-05-28 Agent 上线后，也会变老]]
- 可后续成稿：Agent memory 的第一性问题不是容量，而是故障可归因。

## 关联笔记

- [[Your Agents Are Aging Too Agent Lifespan Engineering for Deployed Systems]]
- [[Is Agent Memory a Database Rethinking Data Foundations for Long-Term AI Agent Memory]]
- [[Memory-R2 Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents]]
- [[2026-05-28 Agent 上线后，也会变老]]

