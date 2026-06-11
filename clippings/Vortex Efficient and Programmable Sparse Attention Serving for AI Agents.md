---
title: "Vortex: Efficient and Programmable Sparse Attention Serving for AI Agents"
source: "https://arxiv.org/abs/2606.06453"
arxiv_id: "2606.06453"
authors:
  - "Zhuoming Chen"
  - "Xinrui Zhong"
  - "Qilong Feng"
  - "Ranajoy Sadhukhan"
  - "Yang Zhou"
  - "Michael Qizhe Shieh"
  - "Zhihao Jia"
  - "Beidi Chen"
submitted: "2026-06-04"
created: "2026-06-06"
categories:
  - "cs.AI"
description: "Vortex 把 sparse attention 算法表达、原型验证和 serving backend 连接起来，让 AI agents 也能快速生成、测试和部署长上下文注意力算法，最高取得 3.46x 到 4.7x 吞吐提升。"
tags:
  - "clippings"
  - "arxiv"
  - "inference"
  - "serving"
  - "sparse-attention"
  - "ai-agents"
---

# Vortex: Efficient and Programmable Sparse Attention Serving for AI Agents

## 论文信息

- arXiv：https://arxiv.org/abs/2606.06453
- 作者：Zhuoming Chen、Xinrui Zhong、Qilong Feng、Ranajoy Sadhukhan、Yang Zhou、Michael Qizhe Shieh、Zhihao Jia、Beidi Chen
- 提交时间：2026-06-04
- 分类：cs.AI

## 研究问题

随着 generation length 增长，sparse attention 对 LLM serving 越来越重要。但新 sparse attention 算法从论文想法到真实 serving 系统验证，中间工程成本很高：算法表达、张量抽象、kernel/backend、现代 serving stack 集成都可能拖慢迭代。

论文的问题是：能否把 sparse attention 的设计空间做成可编程、可快速部署、能被 AI agent 自动探索的系统。

## 方法概览

Vortex 提供一个 Python-embedded frontend language，建立在 page-centric tensor abstraction 上，用来表达多种 sparse attention 算法；后端则和现代 LLM serving stack 紧密集成。

这让研究者或 AI agent 可以快速原型化、部署和评估 sparse attention 算法，而不是每次都从工程集成做起。

## 关键贡献

- 把 sparse attention 算法的表达和 serving backend 打通，降低从理论算法到真实吞吐收益的工程摩擦。
- 让 AI agents 可以自动生成和 refine 多种 sparse attention 算法。
- 最优算法在保持准确率的情况下，相比 full attention 最高取得 3.46x throughput。
- 在更难实验的新架构和大模型上也能扩展：论文报告在 MLA-based GLM-4.7-Flash 上最高 4.7x，在 229B MiniMax-M2.7 上 1.37x，硬件为 NVIDIA B200 GPUs。

## 与知识库主题的关系

这篇补强 [[模型、成本与基础设施]] 主题。它不是单纯的推理优化论文，而是把 AI agent 放进基础设施算法搜索和系统验证循环：agent 不只是应用层调用工具，也可以在 serving 系统的算法空间里自动试错。

它和 [[CuTeDSL at Perplexity]]、[[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]、[[Thinking as Compression Your Reasoning Model is Secretly a Context Compressor]] 形成一条线：agent 成本优化会越来越多地发生在上下文长度、attention、cache 和 serving backend 上，而不是只靠提示词压缩。

## 可复用观点

- 长上下文 agent 的成本问题最终会落到 serving primitive，而不只是 token 预算。
- 真正有价值的 AI-for-systems，不是让模型写一段 kernel，而是让它在可部署抽象里快速探索、评估和回滚。
- Agent 基础设施会从“给 agent 提供工具”扩展到“让 agent 改进底层推理系统”。

## 可加工为公众号角度

- 可与 [[Improving Unigram Tokenizer CPU Performance]]、[[CuTeDSL at Perplexity]]、[[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]] 合并，写“Agent 成本不是一个 GPU 问题，而是整条 serving path 的问题”。
- 今天暂不成稿：基础设施材料价值高，但还缺同批更强的工程案例，暂作为推理系统主题储备。

## 关联笔记

- [[Improving Unigram Tokenizer CPU Performance]]
- [[CuTeDSL at Perplexity]]
- [[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]
- [[Thinking as Compression Your Reasoning Model is Secretly a Context Compressor]]

