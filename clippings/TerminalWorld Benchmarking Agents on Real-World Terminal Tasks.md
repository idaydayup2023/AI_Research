---
title: "TerminalWorld: Benchmarking Agents on Real-World Terminal Tasks"
source: "https://arxiv.org/abs/2605.22535"
arxiv_id: "2605.22535"
authors:
  - "Zhaoyang Chu"
  - "Jiarui Hu"
  - "Xingyu Jiang"
  - "Pengyu Zou"
  - "Han Li"
  - "Chao Peng"
  - "Peter O'Hearn"
  - "Earl T. Barr"
  - "Mark Harman"
  - "Federica Sarro"
  - "He Ye"
submitted: 2026-05-21
created: 2026-05-25
categories:
  - "cs.AI"
description: "从真实 terminal recordings 自动反向生成高保真评测任务，显示当前 agent 在真实终端工作流上仍远未可靠。"
tags:
  - "clippings"
  - "arxiv"
  - "coding-agents"
  - "agent-evaluation"
  - "terminal"
  - "benchmarks"
---

# TerminalWorld: Benchmarking Agents on Real-World Terminal Tasks

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.22535>
- 提交时间：2026-05-21
- 作者：Zhaoyang Chu, Jiarui Hu, Xingyu Jiang, Pengyu Zou, Han Li, Chao Peng, Peter O'Hearn, Earl T. Barr, Mark Harman, Federica Sarro, He Ye
- 数据和代码：<https://github.com/EuniAI/TerminalWorld>

## 研究问题

很多 terminal agent benchmark 是专家手工设计的，任务干净、边界清晰、验证方式明确。但真实终端工作流来自大量临时命令、环境状态、上下文切换和长链操作。论文要回答的是：如果从真实终端使用记录里反向生成任务，当前 agent 到底能做多好？

## 方法概览

TerminalWorld 是一个可扩展的数据引擎：

- 处理 80,870 条真实 terminal recordings。
- 自动反向工程出高保真评测任务。
- 得到 1,530 个 validated tasks，覆盖 18 类真实场景、1,280 个唯一命令。
- 进一步人工审阅出 200 个代表性 Verified tasks。

作者用 8 个 frontier models 和 6 个 agent 在 TerminalWorld-Verified 上评测。

## 关键贡献

- 给 terminal agent 评测引入“来自真实行为记录”的任务构造方式。
- 最高 pass rate 只有 62.5%，说明当前系统离真实终端可靠性仍有明显距离。
- TerminalWorld 与 Terminal-Bench 等专家构造基准只有弱相关，Pearson r=0.20，说明它测到的是不同能力轴。
- 任务可随开发者真实实践演化，避免 benchmark 长期停留在静态题库。

## 与知识库主题的关系

这篇论文补充 [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]] 的证据：coding agent 的可靠性不能只靠看起来合理的 diff 或单一 benchmark。真实终端任务里，环境状态、命令组合和长链操作会暴露完全不同的失败。

它也可作为 [[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]] 的评测侧配套：如果没有真实失败任务和 replay batch，系统就很难知道该进化什么。

## 可复用观点

- Agent 评测应更多来自真实轨迹，而不是只来自专家想象的任务。
- 单一 benchmark 分数不能代表真实 workflow 能力，尤其是终端和开发者工具场景。
- 真实 terminal workflow 的难点不是会不会一个命令，而是命令之间的状态连续性。
- 自动化任务反向工程可以让 benchmark 跟着真实开发实践更新。

## 可加工为公众号角度

- Coding agent 看起来会写代码，不代表它会处理真实终端工作流。
- 真实轨迹比精心设计的题更能暴露 agent 的执行断点。
- 如果要让 agent 自我改进，先要把真实失败变成可复现任务。

## 关联笔记

- 历史文摘：[[A few random notes from Claude coding quite a bit last few weeks]]、[[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]、[[ComplexMCP Evaluation of LLM Agents in Dynamic, Interdependent, and Large-Scale Tool Sandbox]]
- 相关论文：[[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]]
- 相关旧稿：[[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]、[[2026-05-12 Agent 不会靠提示词变可靠]]
- 已加工成稿：[[2026-05-25 Agent 自我改进，不该只改提示词]]
