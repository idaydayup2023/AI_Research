---
title: "Designing, Refining, and Maintaining Agent Skills at Perplexity"
source: "https://research.perplexity.ai/articles/designing-refining-and-maintaining-agent-skills-at-perplexity"
x_source: "https://x.com/perplexity_ai/status/2052786858774630665"
author:
  - "[[@perplexity_ai]]"
published: 2026-05-01
created: 2026-05-11
description: "Perplexity 公开的内部 Agent Skills 编写、评审和维护手册，讨论 Skill 的结构、触发、渐进加载、评估与维护方法。"
tags:
  - "clippings"
  - "agent-skills"
  - "agent-harness"
  - "perplexity"
---

# Designing, Refining, and Maintaining Agent Skills at Perplexity

## 原文信息

- 原文：<https://research.perplexity.ai/articles/designing-refining-and-maintaining-agent-skills-at-perplexity>
- X 来源：<https://x.com/perplexity_ai/status/2052786858774630665>
- 发布时间：2026-05-01
- 发布方：Perplexity Research

Perplexity 在 X 上说，他们公开了内部用于构建 Agent Skills 的手册，并强调 Skills 需要开发者采用一种不同于传统软件开发的新思维方式。

## 核心提取

这篇文章不是普通的产品介绍，而是一份关于如何设计、迭代、维护 Agent Skill 的内部工程指南。它的基本判断是：Skill 已经成为 agent 系统的重要逻辑引擎，但写 Skill 和写传统软件完全不同。传统代码追求清晰、显式、可解释，而 Skill 的目标是给模型提供高信号、低噪声、按需加载的上下文。

Perplexity 的核心观点可以概括为一句话：**Skill 不是一段说明文档，而是一个可被 agent 精准触发、渐进展开、持续评估的上下文模块。**

## 中文译读

### 一、什么是 Skill

Perplexity 认为，Skill 至少有四层含义。

第一，Skill 是一个目录，而不是单个 `SKILL.md` 文件。一个成熟的 Skill 可能包含 `scripts/`、`references/`、`assets/`、`config.json` 等辅助文件。根文件负责告诉模型何时加载、如何行动，重资料和条件分支则放在外部文件里，让模型需要时再读取。

第二，Skill 是一种格式。根目录名、`name`、`description` 必须严格匹配。尤其是 `description`，它不是写给人看的功能说明，而是写给模型看的路由触发器。好的描述通常应该表达“什么时候加载这个 Skill”，而不是解释“这个 Skill 能做什么”。

第三，Skill 是可调用的。agent 不会把所有 Skill 一次性塞进上下文，而是在运行时根据用户意图调用 `load_skill`。调用后，系统会把 Skill 目录复制到隔离沙箱，并按依赖关系加载相关内容。

第四，Skill 是渐进式的。Perplexity 把 Skill 的上下文成本分成三层：索引层、加载层、运行时层。索引层只包含名称和描述，但每个会话都会付费，所以必须极短、极准；加载层是 `SKILL.md` 主体，最好控制在约 5000 token 内；运行时层是脚本、参考资料、模板、特殊案例等，只在需要时读取。

### 二、什么时候需要 Skill

不是所有知识都应该写成 Skill。文章给出的判断标准很实用：如果模型没有额外上下文也能做对，就不要写 Skill；如果一句 prompt 能解决，也不要写 Skill。

你需要 Skill 的场景通常有三类：

- 模型在没有特殊上下文时会稳定犯错。
- 业务需要跨运行保持一致的判断和风格。
- 某些知识是持久的，但不在模型训练数据中，比如企业内部流程、团队审美、领域规则、特定工具链。

相反，如果内容变化太快、只是重复系统提示、或者只是把一串命令写成操作手册，那就不适合做成 Skill。Perplexity 把每个 Skill 都视为一种“税”：它会占用上下文、影响路由，并可能让其他 Skill 变差。

### 三、怎么构建 Skill

文章给出了六步法。

第一步先写 eval，而不是先写 Skill。评估用例可以来自真实用户查询、已知失败案例、相邻领域的误触发案例。负例非常重要，因为 Skill 最大的问题往往不是“不加载”，而是“在不该加载时加载”。

第二步写 description。它是整个 Skill 最难的一行，因为它决定路由。好的 description 应该以用户真实意图为中心，尽量短，最好能覆盖用户会怎么表达需求，而不是总结内部工作流。

第三步写主体。主体不是人类 README，不应该列一串具体命令。文章举了一个典型差异：不要告诉模型逐条执行 git 命令，而应该告诉它“把这个 commit cherry-pick 到干净分支，保留意图解决冲突，如果不能干净落地就说明原因”。模型通常知道工具怎么用，真正需要的是目标、约束、边界和失败处理方式。

第四步使用层级。确定性逻辑放进 `scripts/`，重型文档放进 `references/`，输出模板放进 `assets/`，首次设置放进 `config.json`。主文件应该轻，复杂内容应该可按需展开。

第五步迭代。不要一次生成后直接提交。应先在没有 Skill 的情况下跑一组代表性任务，再逐步调整 description 和主体。description 的微小措辞变化可能显著影响路由，也可能连带影响其他 Skill。

第六步发布。发布前最好把 Skill 与评估集放在同一个变更里，这样评审者能看到设计意图和行为证据。

### 四、怎么维护 Skill

维护 Skill 的重点不是不断扩写说明，而是形成“gotchas 飞轮”。当 agent 在某类场景失败，就把这个失败作为特殊案例补进去；当 Skill 被误加载，就收紧 description 并补负例；当 Skill 没被加载，就增加正例和关键词；当系统提示变化，就检查重复和冲突。

Perplexity 的经验是，gotchas 是最高价值内容。越接近 99.9% 的成功率，越需要靠负例、边界和特殊情况来改善行为，而不是靠更长的通用说明。

他们还会跑多类 eval：Skill 是否该加载、是否读取了正确的附属文件、端到端任务是否完成，以及在不同 orchestration 模型家族上的表现是否一致。文章特别提到，不同模型在 Skill 行为上可能差异很大，所以不能只在一个模型上验证。

## 可复用观点

- Skill 的本质是“模型上下文产品”，不是传统文档，也不是普通代码。
- `description` 是路由器，不是说明书；它应该写用户意图，而不是写功能清单。
- 每个 Skill 都有上下文税，能不写就不写，能短就短。
- 好 Skill 的价值来自人的判断、审美、领域经验和失败案例，而不是模型已知的通用步骤。
- Gotchas 比正向教程更值钱，因为它们告诉模型不要掉进哪些坑。
- Skill 工程的关键不是一次性生成，而是 eval 驱动的持续维护。

## 可加工为公众号角度

### 角度 1：别再把 Skill 当提示词了

可以写成一篇面向 agent 开发者的文章：为什么 Skill 不是 prompt，而是带目录、路由、依赖、评估和维护机制的上下文模块。

### 角度 2：Perplexity 内部手册透露的 Agent 工程新范式

可以和 [[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]] 结合，讨论 agent 产品的竞争力为什么越来越来自 harness、skill、eval、context engineering。

### 角度 3：为什么“让 AI 自己写 Skill”通常不靠谱

可以展开文章中的判断：模型能消费程序性知识，但不一定能可靠生产它真正需要的程序性知识。真正有价值的是人类的 taste、边界感和失败经验。

## 关联笔记

- 已加工成稿：[[别再把 Agent Skill 当提示词了]]
- 实操教程补充：[[How to Use Claude Skills to Automate Any Workflow Full Course]]
- Harness 底座：[[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]]
- 多 Agent 与工具编排：[[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]]、[[How to Build a Team of AI Agents That Work Together (Full Course)]]
- 知识层与上下文工程：[[AI Knowledge Layer (and why your agents are useless without it)]]、[[LLM Knowledge Bases  Post by @karpathy on X]]
- 可扩写成稿：[[Some Notes on AI - 博客]]
