---
title: "When Should Memory Stay Silent: Measuring Memory-Use Boundaries in Memory-Augmented Conversational Agents"
source: "https://arxiv.org/abs/2606.06055"
arxiv_id: "2606.06055"
authors:
  - "Lingxiang Xu"
  - "Jiaoyun Yang"
  - "Min Hu"
  - "Hongtu Chen"
  - "Ning An"
submitted: "2026-06-04"
created: "2026-06-07"
categories:
  - "cs.AI"
description: "论文提出 RBI-Eval，评估 memory-augmented conversational agents 在 benign prompt 下是否会不当地整合敏感记忆，强调安全个性化需要检索端和生成端双重边界。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-memory"
  - "privacy"
  - "evaluation"
---

# When Should Memory Stay Silent: Measuring Memory-Use Boundaries in Memory-Augmented Conversational Agents

## 论文信息

- arXiv：https://arxiv.org/abs/2606.06055
- 作者：Lingxiang Xu、Jiaoyun Yang、Min Hu、Hongtu Chen、Ning An
- 提交时间：2026-06-04
- 分类：cs.AI

## 研究问题

长期记忆让对话 Agent 能跨会话个性化，但现有评测多看 retrieval accuracy 和 downstream utility，较少问一个更危险的问题：即使记忆被取回来了，它在当前轮次是否应该被使用？

这篇论文关注 memory-use boundary。它不是评“记没记住”，而是评“该不该沉默”。

## 方法概览

作者提出 RBI-Eval，用受控 probe set 比较同一 benign prompt 在有敏感记忆和无敏感记忆条件下的行为差异。实验覆盖 full-context exposure 和三类 retrieval settings，并在多个模型上比较敏感记忆进入生成器之后的整合倾向。

核心测量对象不是检索是否命中，而是敏感内容是否在不充分授权或不必要的当前轮次里改变回答。

## 关键贡献

- 把长期记忆评测从“取回得准不准”推进到“当前轮次该不该用”。
- 证明检索系统可以降低暴露概率，但一旦敏感记忆进入生成器，仍可能被不当整合。
- 区分一般个性化与敏感内容整合，避免把所有 memory use 都当成有益个性化。
- 提出安全个性化需要 retrieval-time 和 generation-time 两道 memory-aware 决策。

## 与知识库主题的关系

这篇与 [[2026-05-30 AI 记忆最危险的不是忘，而是混]] 很近，但问题对象不同。旧稿重点是多源记忆冲突和证据仲裁；这篇重点是敏感记忆在当前轮次是否应该保持沉默。

它也补充 [[Selective QA over Conflicting Multi-Source Personal Memory A Diagnostic Testbed and Method Comparison]]：Selective QA 看冲突场景下答不答，这篇看敏感记忆在看似 benign 的普通请求中是否越界进入答案。

## 可复用观点

- 记忆系统不能只优化召回，还要优化“沉默边界”。
- 安全个性化不是把更多用户历史塞进上下文，而是判断当前任务是否有资格使用这段历史。
- 检索层过滤不够，生成层也要知道哪些记忆虽然可见但不该被整合。

## 可加工为公众号角度

- 可与 [[Beyond Semantic Organization Memory as Execution State Management for Long-Horizon Agents]] 合并，写“AI 记忆该先学会不说话”。
- 可与 [[Beyond Similarity Trustworthy Memory Search for Personal AI Agents]] 后续合并，写“个人 Agent 的记忆搜索其实是权限边界”。
- 今天暂不成稿：它补充了记忆治理的新边界，但单篇直接成稿会和近期 memory / state 治理稿过近。

## 关联笔记

- [[2026-05-30 AI 记忆最危险的不是忘，而是混]]
- [[Selective QA over Conflicting Multi-Source Personal Memory A Diagnostic Testbed and Method Comparison]]
- [[MCP-Persona Benchmarking LLM Agents on Real-World Personal Applications via Environment Simulation]]
- [[Agent Memory Characterization and System Implications of Stateful Long-Horizon Workloads]]
