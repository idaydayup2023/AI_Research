---
title: "Harness Updating Is Not Harness Benefit: Disentangling Evolution Capabilities in Self-Evolving LLM Agents"
source: "https://arxiv.org/abs/2605.30621"
arxiv_id: "2605.30621"
authors:
  - "Minhua Lin"
  - "Juncheng Wu"
  - "Zijun Wang"
  - "Zhan Shi"
  - "Yisi Sang"
  - "Bing He"
  - "Zewen Liu"
  - "Tianxin Wei"
  - "Zongyu Wu"
  - "Zhiwei Zhang"
  - "Dakuo Wang"
  - "Xiang Zhang"
  - "Benoit Dumoulin"
  - "Cihang Xie"
  - "Yuyin Zhou"
  - "Suhang Wang"
  - "Hanqing Lu"
submitted: 2026-05-28
created: 2026-06-02
categories:
  - "cs.AI"
description: "区分 harness-updating 与 harness-benefit：会写出 harness 更新，不等于任务模型真的会调用并受益；弱模型常不会激活或忠实遵循更新后的 harness。"
tags:
  - "clippings"
  - "arxiv"
  - "agent-harness"
  - "self-evolving-agents"
  - "reharnessing"
  - "agent-evaluation"
---

# Harness Updating Is Not Harness Benefit: Disentangling Evolution Capabilities in Self-Evolving LLM Agents

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30621>
- 提交时间：2026-05-28（v1）
- 作者：Minhua Lin, Juncheng Wu, Zijun Wang, Zhan Shi, Yisi Sang, Bing He, Zewen Liu, Tianxin Wei, Zongyu Wu, Zhiwei Zhang, Dakuo Wang, Xiang Zhang, Benoit Dumoulin, Cihang Xie, Yuyin Zhou, Suhang Wang, Hanqing Lu
- 分类：cs.AI

## 研究问题

Self-evolving agent 常把失败轨迹、执行证据或反馈加工成新的 prompts、skills、memories、tools 等 harness artifacts。但这里有两个不同能力：

- harness-updating：能不能从执行证据中写出有用的持久 harness 更新；
- harness-benefit：任务执行模型能不能在后续任务中激活、理解并从这些更新受益。

论文要回答的是：基础任务能力更强的模型，是否天然更擅长做 harness evolution？以及写得好的 harness 更新，是否一定会被后续 agent 用起来？

## 方法概览

作者把 harness self-evolution 拆成“更新者”和“受益者”两个环节，比较不同 capability tier 的模型在生成 harness 更新和使用更新后 harness 时的收益差异。

摘要报告两个关键发现：

- harness-updating 对基础能力不敏感：不同 tier 模型写出的 harness 更新带来的收益相近，甚至较小模型的更新也能接近 Claude Opus 4.6 的更新收益；
- harness-benefit 与基础能力呈非单调关系：弱模型收益低，中等模型收益最高，强模型收益反而低于中等模型。

对弱模型的低收益，作者归因到两类失败：不会激活相关 harness artifact，或者激活后不能忠实遵循。

## 关键贡献

- 把“会更新 harness”和“会受益于 harness”明确拆开，避免把自进化能力看成单一指标。
- 提示 harness evolution 的预算应该优先投给 task-solving agent，而不是只追求更强的 evolver。
- 给 Reharnessing 提供一个关键质量门：更新候选不只要能写出来，还要验证目标 agent 是否会调用、是否能遵循。
- 把 agent training 的缺口指向 harness invocation 和 long-horizon instruction following。

## 与知识库主题的关系

这篇是 [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]] 的直接补强。旧稿强调 agent 不应直接改生产规则，而应通过 trace、backtest、human gate、versioned rollback 进入受控 harness 修改闭环。

这篇进一步提醒：即便 harness 修改流程受控，也不能默认“写出更新 = 系统变好”。真正需要验证的是后续执行模型是否会在正确时机激活新规则，并在长任务中稳定遵循。

## 可复用观点

- 自进化 agent 的评测要拆成两段：谁写规则，谁用规则。
- Harness 更新不是收益本身，只是一个候选资产；收益需要在目标 agent 上 replay/backtest。
- 弱模型的瓶颈可能不是没有好规则，而是不会在正确时机调用规则。
- Reharnessing 的最小验收口径应包含 activation、adherence、task delta 三项。

## 可加工为公众号角度

- 可补充旧稿：[[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]。
- 新稿候选：`Agent 会改规则，不代表它会用规则`。
- 若成稿，应避免重复“受控改脚手架”，而聚焦“harness 更新的收益验收”。

目前暂不单独成稿：它与昨日 Reharnessing 论点高度相邻，更适合先作为旧稿补充证据和后续“规则收益验收”专题素材。

## 关联笔记

- [[2026-06-01 Reharnessing：让 Agent 学会重搭自己的脚手架]]
- [[MOSS Self-Evolution through Source-Level Rewriting in Autonomous Agent Systems]]
- [[Adapting the Interface Not the Model Runtime Harness Adaptation for Deterministic LLM Agents]]
- [[Scaling Laws for Agent Harnesses via Effective Feedback Compute]]
- [[Trace2Skill Verifier-Guided Skill Evolution for Long-Context EDA Agents]]
