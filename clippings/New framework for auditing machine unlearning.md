---
title: "New framework for auditing machine unlearning"
source: "https://research.google/blog/new-framework-for-auditing-machine-unlearning/"
author: "Monica Ribero"
published: 2026-06-10
created: 2026-06-11
description: "Google Research 提出基于正则化 f-divergence 的相对三样本审计框架，用更少样本区分近似遗忘模型更接近安全重训模型还是原始受污染模型。"
tags:
  - "clippings"
  - "google-research"
  - "machine-unlearning"
  - "ai-audit"
  - "privacy"
---

# New framework for auditing machine unlearning

## 原文信息

- 原文：<https://research.google/blog/new-framework-for-auditing-machine-unlearning/>
- 论文：<https://arxiv.org/abs/2501.13074>
- 发布：2026-06-10
- 作者：Monica Ribero

## 核心提取

机器遗忘不能只靠开发者声明“已经删除”，而要由外部审计验证模型输出是否仍残留目标数据的影响。传统两样本测试直接比较近似遗忘模型与安全重训模型，但即使两个安全重训模型只因随机种子或训练批次不同，也可能产生分布差异，造成误报。

Google Research 提出的框架改用相对三样本测试：同时参考原始受污染模型、安全重训模型和待审计模型，判断待审计模型在分布上更接近哪一侧。框架聚合多种 f-divergence，并自动选择更适合局部异常、隐私预算或平滑分布差异的统计量与超参数。

## 中文译读

这项工作的迁移价值不只在机器遗忘。它说明安全审计不能把“与黄金样本不完全相同”直接判成失败，而应先定义风险方向和可接受距离。

对于复杂 AI 系统，绝对等价往往不可实现，简单差异测试又容易误报。更实用的评估问题是：新系统究竟更接近安全基线，还是更接近已知风险状态；它在哪一种差异上暴露问题；检测结果对样本量和阈值是否稳健。

## 可复用观点

- “已删除”“已对齐”“已修复”都不是可接受的自证结论，需要外部可查询的差异审计。
- 评测基线不应只有单一黄金样本；相对风险方向有时比绝对一致更可操作。
- 聚合多种统计传感器，可以减少单一指标只擅长发现某类异常的盲区。
- 审计要同时控制误报和漏报，否则严格阈值可能把正常变化误判成风险。

## 可加工为公众号角度

- `AI 说自己忘了，不算证据`：从机器遗忘扩展到 Agent memory 删除、权限回收和规则修订后的可验证性。
- 本次暂不单独成稿：方法偏统计审计，需补 Agent memory 或企业数据治理案例后再转译。

## 关联笔记

- [[AI 记忆最危险的不是忘，而是混]]
- [[Evaluation Cards An Interpretive Layer for AI Evaluation Reporting]]
- [[2026-06-10 让 Agent 返工像打补丁]]

