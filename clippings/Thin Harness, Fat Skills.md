---
title: "Thin Harness, Fat Skills"
source: "https://x.com/garrytan/status/2042925773300908103"
author:
  - "Garry Tan"
published: 2026-04-11
created: 2026-05-13
description: "Garry Tan 关于 AI coding agents 架构的长文：真正的 10x/100x 不来自更聪明模型，而来自 thin harness、fat skills、resolvers、确定性工具层和可学习 skill loop。"
tags:
  - "clippings"
  - "agent-harness"
  - "skills"
  - "coding-agents"
  - "yc"
  - "system-design"
---

# Thin Harness, Fat Skills

## 原文信息

- X Article：<https://x.com/garrytan/status/2042925773300908103>
- 发布时间：2026-04-11
- 作者：Garry Tan

## 核心提取

Garry Tan 的核心观点是：AI coding agents 带来的 10x 到 100x 生产力差异，不主要来自模型本身，而来自模型外部的架构。2x 用户和 100x 用户可能使用同样的 Claude，真正区别在于 harness、skills、resolvers、确定性工具层和学习闭环。

他把这套架构概括为：**thin harness, fat skills**。

Harness 应该薄，只负责运行模型循环、读写文件、管理上下文和执行安全边界；Skills 应该厚，承载流程、判断、领域知识和可复用方法；确定性任务应该下沉到可靠工具层；判断、综合和模式识别应该留在模型的 latent space。

## 中文译读

### 一、Harness 是产品，但 harness 应该薄

文章开头引用 Steve Yegge 的判断：AI coding agents 用户可以比普通 Cursor/chat 用户高 10x 到 100x。Garry 认为，这不是模型差距，而是架构差距。

他把 harness 定义为包裹模型的程序：运行 LLM loop、读写文件、管理上下文、执行安全。Live repo context、prompt caching、purpose-built tools、context bloat minimization、session memory、parallel sub-agents，都是 harness 的一部分。

但好 harness 不是越厚越好。反模式是 fat harness with thin skills：几十个工具定义占满上下文，MCP round-trip 很慢，REST API 每个 endpoint 都变成工具，带来更多 token、延迟和失败率。

### 二、Skill 像 method call

Garry 对 Skill 的定义很有意思：Skill file 是一个可复用的 Markdown 文档，教模型如何做某件事。用户提供 what to do，skill 提供 process。

他强调，Skill 像 method call。它接收参数，不同参数调用同一套流程，能产生完全不同能力。

比如 `/investigate` 可以有七步：限定数据集、建立时间线、diarize 每份文档、综合、正反论证、引用来源。传入不同 TARGET、QUESTION、DATASET，它就能变成医疗调查、政治资金追踪或公司尽调。

这不是 prompt engineering，而是 software design，只是 Markdown 成了编程语言，人类判断成了 runtime。

### 三、Resolver 是上下文路由表

Resolver 负责“任务类型 X 出现时，先加载文档 Y”。Skills 告诉模型 how，resolvers 告诉模型 what to load and when。

Garry 提到自己的 `CLAUDE.md` 曾经有 20,000 行，导致模型注意力下降。最后改成约 200 行，只保留指向文档的 pointers，需要时由 resolver 加载正确上下文。

这个经验和 [[Lessons from building Claude Code Prompt caching is everything]]、[[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 完全一致：上下文不是越多越好，关键是按需加载。

### 四、Latent vs deterministic 是 Agent 设计分水岭

文章里最重要的设计原则之一是：系统中的每一步，要么是 latent，要么是 deterministic。

Latent space 适合判断、综合、解释、模式识别；deterministic layer 适合同输入同输出的可靠任务，比如 SQL、编译代码、算术、优化算法。

最差的系统会把确定性问题塞进 latent space，比如让 LLM 安排 800 人座位；最好的系统会非常明确地划分边界：模型决定策略和判断，确定性工具执行可靠计算。

这正好补强 [[2026-05-11 Agent 产品的护城河正在变成系统工程]] 的主线：Agent 不是模型独角戏，而是 latent 判断和确定性执行的组合系统。

### 五、Diarization 是知识工作的关键步骤

Garry 使用 diarization 指代一种结构化画像能力：模型读完某个主题的所有材料后，写出单页判断，浓缩数十或数百份文档的信息。

这不是 SQL 查询，也不是普通 RAG。它需要模型读完整材料，保留矛盾，注意变化时间点，并综合成 intelligence brief。

这与 [[Your Obsidian Vault Is Probably Wasting Your Intelligence]] 的知识库主线也非常贴近：知识系统的目标不是检索，而是把碎片转化成可行动的判断。

### 六、技能会自我改进

文章最后用 YC Startup School 的系统举例：用 `/enrich-founder` 收集 founder application、questionnaire、advisor chat、public signals、GitHub commits、Claude Code transcripts，然后生成结构化 founder profile。

之后 matching skill 可以用同一套方法在不同场景下做 breakout group、lunch table、live matching。活动后，`/improve` skill 读取 NPS surveys，分析“OK 但不够好”的反馈，抽取模式，再把新规则写回 matching skills。

核心是：skill file 会学习。每次循环都把经验写回 skill，下次自动变好。

作者总结得很锋利：如果我让你做一件可能会重复的事，你不允许只做一次。先在 3-10 个样本上手动跑，给我看输出；我认可后，codify it into a skill file；如果应该自动运行，就放到 cron。测试标准是：如果我必须问第二次，你就失败了。

## 可复用观点

- 生产力差距不在模型，而在模型外部架构。
- Harness 要薄，skills 要厚；不要把上下文、工具和逻辑全塞进 harness。
- Skill 像 method call，Markdown 是可复用判断流程的封装语言。
- Resolver 是上下文路由器，解决“什么时候加载什么知识”。
- Agent 系统必须区分 latent judgment 和 deterministic execution。
- 每个重复任务都应该被 codify，变成系统的永久升级。
- Skill 的最高形态是从反馈里学习，并把新规则写回自己。

## 可加工为公众号角度

- 10x AI 工程师不是提示词写得好，而是系统架构搭得好。
- Thin Harness, Fat Skills：为什么 Agent 产品应该把判断写进 Skills，把执行下沉到工具。
- 如果你要第二次问 AI 同一件事，你的系统就失败了。

## 关联笔记

- 已加工成稿：[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- Skill 工程：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[别再把 Agent Skill 当提示词了]]
- Skill 实操：[[How to Use Claude Skills to Automate Any Workflow Full Course]]
- Harness 底座：[[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]]
- 系统工程：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- 知识层：[[Your Obsidian Vault Is Probably Wasting Your Intelligence]]、[[2026-05-12 你的 Obsidian 不该只是信息仓库]]
