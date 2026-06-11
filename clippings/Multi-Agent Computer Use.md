---
title: "Multi-Agent Computer Use"
source: "https://arxiv.org/abs/2606.01533"
arxiv_id: "2606.01533"
authors:
  - "Jing Yu Koh"
  - "Ruslan Salakhutdinov"
  - "Daniel Fried"
published: "2026-06-01"
created: "2026-06-04"
categories:
  - "cs.MA"
description: "MACU 把 computer-use 从单 agent 串行执行改成 manager + DAG + 并行子 agent 协作，在 OSWorld、Mind2Web、WebTailBench、Odysseys 上提升 3.4% 到 25.5%，并在长任务上缩短约 1.5 倍用时。"
tags:
  - "clippings"
  - "arxiv"
  - "computer-use"
  - "multi-agent"
  - "planning"
---

# Multi-Agent Computer Use

## 论文信息

- arXiv：https://arxiv.org/abs/2606.01533
- 作者：Jing Yu Koh、Ruslan Salakhutdinov、Daniel Fried
- 提交时间：2026-06-01
- 分类：cs.MA

## 研究问题

现有 computer-use agent 大多采用单 agent 串行执行，但复杂长任务往往同时需要任务分解、并行推进、根据新发现重规划，以及把一部分无法重新观察到的环境信息保留下来。论文的问题意识很明确：单 agent CUA 不只是慢，还容易在长任务里卡住。

## 方法概览

作者提出 MACU（Multi-Agent Computer Use）。核心结构是一个 manager model 先把任务拆成 DAG，节点代表子任务，边表示依赖；随后 manager 把 DAG 当前 ready frontier 上的节点并行派发给多个 CUA subagent 执行，并根据返回的新发现持续重写 DAG，包括新增、取消或改写节点。

这个设计的关键不是“多 agent”三个字，而是把部分可观测环境当成一等问题处理。下游 agent 可能已经看不到上游发现过的状态，因此 manager 和 DAG 需要承担中间知识保留与前传的责任。

## 关键贡献

- 把 computer-use agent 的核心结构从串行 loop 改成 manager + DAG + frontier dispatch。
- 在 OSWorld、Online-Mind2Web、WebTailBench、Odysseys 上，相比强单 agent baseline 提升 3.4% 到 25.5%。
- 在长任务 benchmark Odysseys 上，平均任务完成 wall-clock time 提升约 1.5 倍，说明并行化不只是更准，也更快。
- 论文强调多 agent coordination 是 scaling CUA 的一个独立轴，不只是换更强模型。

## 与知识库主题的关系

这篇论文与最近的 harness、接口层和状态外置主题直接相关。它说明 computer-use 的关键瓶颈不只是工具调用能力，而是任务图、依赖、信息保留和重规划结构。

它也能和 [[TerminalWorld Benchmarking Agents on Real-World Terminal Tasks]]、[[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]] 连起来看：terminal、GUI、web navigation 这些真实执行环境，都在逼 agent 从“会做一步”升级到“会管理长轨迹里的状态和分工”。

## 可复用观点

- 长任务 CUA 的扩展轴之一是 DAG 化任务分解和 frontier 并行执行，而不是只加长上下文。
- manager 的一个核心职责是保留局部不可再观察的信息，这本质上是状态外置和中间证据前传。
- 多 agent 在 computer-use 里最值得关注的不是角色扮演，而是重规划和部分可观测环境下的信息传递。

## 可加工为公众号角度

- 可与 [[Running Guide agent A step towards running unbounded]]、[[VLA-Trace Diagnosing Vision-Language-Action Models through Representation and Behavior Tracing]]、[[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]] 合并，写“长任务 agent 的核心不是更长上下文，而是把任务图和状态账本搬出单线程 loop”。
- 今天暂不成稿：虽然观点足够强，但与 6 月 2 日、6 月 3 日的接口层/状态外置稿件过近，继续写会挤压叙事差异。

## 关联笔记

- [[TerminalWorld Benchmarking Agents on Real-World Terminal Tasks]]
- [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]
- [[Running Guide agent A step towards running unbounded]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
