---
title: "Physics Is All You Need? A Case Study in Physicist-Supervised AI Development of Scientific Software"
source: "https://arxiv.org/abs/2605.30353"
arxiv_id: "2605.30353"
authors:
  - "Nhat-Minh Nguyen"
submitted: 2026-05-28
created: 2026-05-31
categories:
  - "cs.AI"
  - "astro-ph.CO"
  - "cs.HC"
  - "cs.SE"
description: "一个物理学家监督 AI coding agent 构建科学软件的量化个案，重点揭示 oracle tests 通过不等于理论正确，领域监督设计决定输出是否可信。"
tags:
  - "clippings"
  - "arxiv"
  - "coding-agents"
  - "scientific-discovery"
  - "verification"
  - "agent-workflow"
---

# Physics Is All You Need? A Case Study in Physicist-Supervised AI Development of Scientific Software

## 论文信息

- arXiv：<https://arxiv.org/abs/2605.30353>
- 提交时间：2026-05-28（v1）
- 作者：Nhat-Minh Nguyen
- 分类：cs.AI; astro-ph.CO; cs.HC; cs.SE

## 研究问题

这篇论文问的是一个很现实的问题：AI coding agent 在科学软件里到底是工具、共同作者，还是研究者？

作者用一个单个但记录完整的案例回答：一名物理学家在 12 个工作日、57 个会话里监督 Claude Code 构建一个 JAX 微分 one-loop perturbation theory 模块 CLAX-PT，并记录 15 次监督事件。重点不是证明 agent 能不能写代码，而是看哪些错误能被测试抓住，哪些错误只有领域监督能发现。

## 方法概览

论文把开发过程作为 case study 记录下来：agent 负责实现、迭代、跑 oracle tests；物理学家在必要时介入，提供领域概念、检查理论一致性、识别测试覆盖不到的问题。

作者将监督事件按介入层级分类，并分析 agent 自主解决、依赖领域知识解决、以及无法解决的问题之间的差异。最值得注意的是，agent 能反复优化测试指标，却可能把症状缓解当成根因解决；在一个结构本身无法表达目标物理的代码架构里，它会继续调整系数，而不是提出架构替代方案。

## 关键贡献

- 把 AI coding agent 的科学软件可靠性落到开发轨迹，而不是只看最终代码或 benchmark。
- 指出 oracle tests 有盲区：测试通过可能只是校准到某个参数点，不代表理论量有正确含义。
- 提炼出 3 个关键监督做法：在不同参数点测试、维护跨会话 changelog 暴露停滞探索、明确禁止没有物理含义的数值补丁。
- 给出一个重要边界：模型能力扩大不自动补足解释正确性，agent 还需要能提出架构替代、区分预测拟合和理论解释。

## 与知识库主题的关系

这篇可以补充 [[2026-05-20 科学智能体不是博士替身，而是研究流水线]]，但角度更尖锐：流水线不只是生成假设和跑实验，还必须设计能发现“测试全过但理论错了”的监督机制。

它也和 [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]] 相关，但这里的验证对象不只是代码行为，而是科学解释、参数外泛化和领域概念一致性。

## 可复用观点

- 高风险 coding agent 不能只交付测试通过率，还要交付“为什么这些测试足以证明问题被解决”的证据。
- 领域专家的价值不在于逐行写代码，而在于定义哪些补丁没有业务或理论含义。
- 长程 agent run 需要跨会话 changelog，否则系统会在局部修补里持续打转。
- 真实世界的验证闭环要覆盖参数外、场景外和解释层，而不是只覆盖最初的 oracle。

## 可加工为公众号角度

- 角度一：`AI 写科学代码，最危险的不是报错，而是测试全过`。主线聚焦 oracle blind spot 和领域监督。
- 角度二：`不要只让 Agent 修症状，要逼它解释根因`。可迁移到企业工程、数据分析、财务模型和策略实验。
- 角度三：`专家监督不是审批按钮，而是反作弊规则`。把专家从手工执行者重定位为验证协议设计者。

## 关联笔记

- [[2026-05-20 科学智能体不是博士替身，而是研究流水线]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- [[Co-Scientist A multi-agent AI partner to accelerate research]]
- [[Empirical Research Assistance ERA From Nature publication to catalyzing Computational Discovery]]
- [[AlphaEvolve How our Gemini-powered coding agent is scaling impact across fields]]
- [[Using LLMs to secure source code]]
