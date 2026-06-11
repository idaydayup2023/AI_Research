---
title: "Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems"
source: "https://arxiv.org/abs/2605.27787"
arxiv_id: "2605.27787"
authors:
  - "Seunghyuk Cho"
  - "Sunghyun Choi"
  - "Jaeseung Heo"
  - "Youngbin Choi"
  - "Saemi Moon"
  - "MoonJeong Park"
  - "Dongwoo Kim"
submitted: 2026-05-27
created: 2026-05-29
categories:
  - "cs.MA"
  - "cs.CL"
description: "提出 persistent search sub-agent Librarian，用共享搜索记忆减少多 Agent 软件工程系统中的重复仓库探索和输出 token 能耗。"
tags:
  - "clippings"
  - "arxiv"
  - "multi-agent"
  - "coding-agents"
  - "cost-optimization"
  - "context-engineering"
  - "agent-harness"
---

# Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.27787>
- 提交时间：2026-05-27（v1）
- 作者：Seunghyuk Cho, Sunghyun Choi, Jaeseung Heo, Youngbin Choi, Saemi Moon, MoonJeong Park, Dongwoo Kim
- 分类：cs.MA, cs.CL

## 研究问题

多 Agent 软件工程系统会让多个代理反复探索同一个代码仓库区域，产生大量重复输出 token。论文把问题落到能耗和成本：输出 token 的能耗远高于输入或缓存 token，多 Agent 重复搜索会显著放大每个 episode 的输出量。

## 方法概览

作者提出 Librarian：一个 persistent search sub-agent。它持续跟踪仓库搜索历史，在多个 agents 之间共享已经探索过的文件区域和检索结果，并抑制重复探索动作。Librarian 返回的是短引用，而不是完整文件片段，从而减少输出 token 体积。

实验在 SWE-Bench Verified 上评估，Librarian 在保持任务表现的同时，最多降低现有多 Agent SWE 系统每个 episode 的 GPU 能耗 25%。

## 关键贡献

- 把多 Agent coding 系统的浪费归因到重复输出 token，而不是泛泛讨论“agent 太贵”。
- 明确指出输出 token 比输入或缓存 token 能耗高 30 到 1,000 倍。
- 用持久化搜索子代理把“谁看过什么代码”变成跨 agent 共享状态。
- 用短引用替代重复文件摘录，减少 token、能耗和上下文噪声。

## 与知识库主题的关系

这篇直接补强 [[Agent Harness 与多 Agent 编排]] 和 [[推理系统、模型服务与成本]] 两个主题簇。它把 [[Lessons from building Claude Code Prompt caching is everything]] 里的缓存经验推进到多 Agent 层：不只缓存 prompt，还要缓存探索轨迹和仓库证据。

它也能和 [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]] 对话：持久化不是为了记住一切，而是为了阻止重复劳动和重复输出。

## 可复用观点

- 多 Agent 系统的第一种成本浪费，往往不是推理太深，而是多个 agent 重复看同一片世界。
- “共享搜索记忆”应该是 coding agent harness 的基础设施，而不是每个 agent 自己总结。
- 降低 agent 成本不只靠换便宜模型，也可以靠减少重复输出、使用短引用和共享 evidence map。
- Repository exploration 应该变成可复用资产：谁看过、为什么看、证据在哪里、是否仍适用。

## 可加工为公众号角度

- 新角度候选：多 Agent 不是多开窗口，而是先让它们别重复看同一个文件。
- 可合并素材：[[Introducing Claude Opus 4.8]]、[[Agents that Matter Optimizing Multi-Agent LLMs via Removal-Based Attribution]]。
- 可补充旧稿：[[2026-05-28 AI coding 的质量门，要前移到计划层]]、[[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]。

## 关联笔记

- [[Lessons from building Claude Code Prompt caching is everything]]
- [[Redesigning Claude Code on desktop for parallel agents]]
- [[From Model Scaling to System Scaling Scaling the Harness in Agentic AI]]
- [[CODESKILL Learning Self-Evolving Skills for Coding Agents]]
- [[2026-05-27 Agent 的复利，不是记住更多，而是少写错经验]]
- 已加工成稿：[[2026-05-29 Agent 不该拼命干活，要学会花预算]]
