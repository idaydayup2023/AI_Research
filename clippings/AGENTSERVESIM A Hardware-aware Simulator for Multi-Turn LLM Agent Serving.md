---
title: "AGENTSERVESIM: A Hardware-aware Simulator for Multi-Turn LLM Agent Serving"
source: "https://arxiv.org/abs/2606.09613"
arxiv_id: "2606.09613"
authors: "Rakibul Hasan Rajib; Mengxin Zheng; Qian Lou"
submitted: 2026-06-08
created: 2026-06-10
categories:
  - "cs.CL"
  - "cs.AI"
description: "提出面向多轮 Agent serving 的硬件感知模拟器，在 program 粒度建模工具间隙、session affinity、跨轮 KV cache locality 与多层内存驻留。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-serving"
  - "kv-cache"
  - "inference-systems"
  - "simulation"
---

# AGENTSERVESIM: A Hardware-aware Simulator for Multi-Turn LLM Agent Serving

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.09613>
- 提交：2026-06-08（v1）
- 作者：Rakibul Hasan Rajib, Mengxin Zheng, Qian Lou
- 分类：cs.CL / cs.AI

## 研究问题

传统 LLM serving 把请求视为相对独立的推理任务，但 Agent 会在多轮模型调用之间插入工具执行，并依赖跨轮状态和可复用 KV cache。现有模拟器缺少 program identity、工具间隙和缓存驻留等核心动态，难以低成本评估 Agent serving 策略。

## 方法概览

AGENTSERVESIM 在 program 粒度提供四类组合模块：

- Program Orchestrator：保持程序身份和轮次依赖；
- Tool Simulator：模拟工具调用产生的时间间隙；
- Session-Aware Router：维持 program-to-instance affinity；
- KV Residency Model：跟踪 KV 在 HBM、host DRAM/CXL 中的驻留与淘汰。

论文报告模拟结果在关键性能指标上与真实部署的误差控制在 6% 内，同时只需普通 CPU 即可运行。

## 关键贡献

- 把 Agent serving 从 stateless request processing 重新定义为 stateful program execution。
- 将工具间隙和跨轮 KV locality 纳入基础设施评估。
- 允许在昂贵加速器部署前，对调度、路由和缓存策略做可重复实验。
- 为 Agent 成本优化提供 program-level 而非单请求级模拟方法。

## 与知识库主题的关系

这篇补充模型、成本与基础设施主题。它与 [[2026-05-29 Agent 不该拼命干活，要学会花预算]] 的应用层预算纪律不同，关注的是 serving 系统如何识别 Agent 程序身份，并为跨轮缓存和工具间隙做资源调度。

## 可复用观点

- Agent 推理负载不是聊天请求的简单放大，而是一类有程序结构的 workload。
- session affinity 既是上下文问题，也是缓存与路由问题。
- 工具调用等待期间，KV cache 是否驻留会直接影响成本与延迟。
- Agent 基础设施优化需要可回放 workload 和硬件感知模拟，不能只靠线上试错。

## 可加工为公众号角度

- `Agent 上线后，推理平台也要学会读懂程序`。
- 可与 KV-Fold、prompt caching、serving tier 材料合并成基础设施稿；今天暂不成稿，避免与修订协议主线分散。

## 关联笔记

- [[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]
- [[2026-05-29 Agent 不该拼命干活，要学会花预算]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]

