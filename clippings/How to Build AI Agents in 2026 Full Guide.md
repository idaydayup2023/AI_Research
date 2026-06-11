---
title: "How to Build AI Agents in 2026 (Full Guide)"
source: "https://x.com/Av1dlive/status/2054238056090325492"
author:
  - "Avid"
published: 2026-05-12
created: 2026-05-13
description: "Avid 关于生产级 AI Agent 的长文：生产 agent 不是 demo loop，而是围绕三层架构、session/task、roles/skills、远程 sandbox、schema 输出、MCP、connector 和 compaction 建立可运行的 runtime。"
tags:
  - "clippings"
  - "agent-harness"
  - "agent-runtime"
  - "coding-agents"
  - "production-agents"
  - "context-engineering"
---

# How to Build AI Agents in 2026 (Full Guide)

## 原文信息

- X Article：<https://x.com/Av1dlive/status/2054238056090325492>
- 相关仓库：<https://github.com/codejunkie99/agentic-harness>
- 发布时间：2026-05-12
- 作者：Avid

## 核心提取

这篇文章的核心判断是：多数 AI builder 做出来的是 demo，不是生产级 agent。真正难的地方不在“让模型回复一次”，而在让 agent 在长会话、远程执行、模型切换、上下文溢出、CI 复现和部署目标变化后仍然稳定工作。

作者把生产级 agent runtime 拆成三层：

- 外层是你的业务代码，主要写 handler、调用 session、组织任务。
- 中层是 harness，负责 session 持久化、context compaction、roles/skills、模型选择、provider 抽象、工具和执行协议。
- 内层是 execution target，可以是本地文件系统、CI checkout、E2B/Daytona/Vercel Sandbox，也可以是 Cloudflare Worker 边界。

文章真正有价值的地方不是介绍某个框架，而是列出生产 agent 会踩的运行时坑：session history contamination、role precedence、deny path 漏洞、detached HEAD、远程 sandbox 的网络往返延迟、context budget 低估、模型 auto 更新导致不可复现、运行 artifact 被删除等。

## 中文译读

### 一、生产 Agent 不是学六个框架，而是吃透一个 Runtime

文章开头批评了几种常见路径：看到多 agent demo 就直接上 LangChain，最后被 Python interop 和 async runtime 折磨；自己手搓 orchestration layer，结果 loop、session store、context assembler 吃掉全部时间；复制 webhook hello world，以为拿到 JSON response 就理解了 agent。

作者的判断是：如果要在 2026 年构建真实 agent，不需要学习六个框架，而要理解一个 runtime，直到你能从 handler 到 deployment 端到端拥有它。

这个判断和 [[The Anatomy of an Agent Harness]]、[[Thin Harness, Fat Skills]] 是同一条线：agent 的竞争不在一次回复，而在回复之外的运行系统。

### 二、三层架构：代码、Harness、执行目标

作者使用 agentic-harness 的设计解释三层架构。

第一层是业务代码。你写 handler，handler 拿到 `AgentContext`，再调用 session。你不直接管 HTTP client，也不手动解析模型返回。

第二层是 harness。它负责 agent registry、URL path 到 identity 的路由、session 持久化、context compaction、role 与 skill discovery、模型选择优先级、provider-neutral `ModelClient`。这也是生产问题集中出现的地方：状态、溢出、provider 失败、并发请求顺序。

第三层是 execution target。本地、CI、远程 sandbox、Cloudflare Worker 都只是目标环境。理想状态下，handler 不关心它跑在哪里，只调用 `session.shell()` 和 `session.write()`。

这个分层的价值在于：当 E2B API 变化时，你更新 connector，不更新 agent logic；当模型变化时，你更新 runtime config，不改 handler。

### 三、Session 和 Task 是 Agent 的运行边界

文章把 session 定义为 agent invocation 的完整执行上下文，而不只是聊天记录。它包含模型消息历史、workspace 文件访问、shell 执行、工具注册、role、compaction budget。

关键在于：session 可以跨 HTTP 调用持久化。同一个 agent endpoint、同一个 session ID，多次调用会变成连续工作流。

但这也会带来污染。探索性分析、无关 tool call、半成品推理都会进入历史，长任务跑到一半后，模型会被旧噪声牵引。

作者给出的修复是 task：有明确子交付物、且不需要父会话历史的问题，就应该拆成 one-shot child session。task 有新历史、共享 workspace，只把结果返回给 parent。parent 不需要看到中间探索过程。

这和我们在 [[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]] 里说的 resolver/skill 很接近：不要让所有上下文常驻，应该让上下文按任务边界进入和退出。

### 四、Roles 和 Skills 是不重编译的行为层

作者把 roles 和 skills 放在 `.agentic-harness/roles/` 与 `.agents/skills/` 里自动发现。

Role 是 call-level 或 session-level 的系统提示覆盖层，用来决定模型身份、默认模型和单次调用焦点。

Skill 是模型在 session 开始时读取的行为描述文件，承载团队工作方式：commit message、首选库、migration 命名、API 设计模式、测试要求。

这个判断与 [[Designing, Refining, and Maintaining Agent Skills at Perplexity]] 完全一致：Skill 不是临时提示词，而是让模型稳定复用组织知识和流程的工程接口。

### 五、Compaction 不是总结，而是状态保真问题

长 session 必然会超过上下文窗口。harness 可以自动 compaction，但如果设置不对，就会在最糟糕的时刻丢失关键信息。

作者强调了三个参数：`context_window_tokens`、`reserve_tokens`、`keep_recent_messages`。当历史超过预算，harness 会总结 system prompt 与保留尾部之间的内容，用 summary 替代中间段。

真正的风险在于 summary 会损失精度。五十条消息前一个关键选择，可能从“我们选 authlib，因为只有它的 PKCE 支持和 axum middleware 兼容”被压成“我们选择 authlib 做 auth”。

修复方式很重要：把关键决策写入文件。文件能跨 compaction 存活，模型需要时再读回来。也就是说，workspace 应该承担长期记忆，session history 只承担近期工作面。

这和 [[Lessons from building Claude Code Prompt caching is everything]]、[[Your Obsidian Vault Is Probably Wasting Your Intelligence]] 可以连接起来：长程 agent 的核心，不是拥有无限上下文，而是把可复用状态落在稳定载体上。

### 六、远程 Sandbox 的成本不是算力，而是往返延迟

文章对 `HttpSessionEnv` 的解释非常实用：agent binary 可以在本机或 CI 运行，但文件系统和 shell 操作在远程 sandbox 执行。agent 通过 JSON over HTTP 调用 `exec`、`read`、`write`、`edit`、`grep`、`glob` 等操作。

这解决了环境隔离和 CI 复现问题，但引入了新的性能陷阱：每一次 shell call 都是网络往返。一个本地 5 秒的 40 轮 edit-test-loop，如果每轮三次远程调用，会变成好几分钟。

修复方式不是更聪明的模型，而是把 shell work 批量封装成脚本：每轮一次调用，而不是三次调用。

这说明生产 agent 工程里很多问题并不神秘，本质仍然是系统工程：减少往返、稳定接口、明确边界、保留 artifact。

### 七、真正的 Checklist：防止不可复现

文章最后列出的坑很适合做生产 checklist：

- 探索过程污染 session history，用 task 隔离。
- call-level role 覆盖 session role，导致行为变化。
- 只 deny `.env`，但密钥还在 `.env.local` 或 `config/staging.yaml`。
- CI 里 detached HEAD，测试通过但无法 commit。
- 远程 sandbox 紧密循环导致网络延迟堆积。
- context budget 估算过高，compaction 在 mid-task 触发。
- runtime config 加载太晚，handler 注册时没有模型。
- `--llm auto` 半年后默认模型变化，结果不可复现。
- 清理 run artifact，三周后无法复盘一次坏回归。

最值得记住的是：生产级 agent 不是“跑通一次”，而是“六个月后还能解释为什么当时那次运行是那个结果”。

## 可复用观点

- 生产 agent 的核心不是 demo loop，而是 runtime discipline。
- Session 不是聊天记录，而是执行上下文；task 是防止上下文污染的隔离层。
- Compaction 会损失精度，关键决策必须写入 workspace，而不是只放在历史消息里。
- 远程 sandbox 解决环境隔离，也带来网络往返成本，必须批处理工具调用。
- Role、skill、runtime config、connector 应该吸收变化，handler logic 应该保持稳定。
- 运行 artifact 不是垃圾文件，而是 agent 可复现性的审计记录。

## 可加工为公众号角度

- Agent 上生产前，先管住它的会话。
- 生产级 Agent 的第一条纪律：不要让上下文成为垃圾场。
- 真正的 AI Agent 不是会调用工具，而是能被复现、被审计、被长期维护。

## 关联笔记

- 已加工成稿：[[2026-05-13 Agent 上生产前，先管住它的会话]]
- Harness 总论：[[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]]
- 架构延伸：[[Thin Harness, Fat Skills]]、[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]
- Skill 工程：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[别再把 Agent Skill 当提示词了]]
- 长程上下文：[[Lessons from building Claude Code Prompt caching is everything]]
- 知识层：[[Your Obsidian Vault Is Probably Wasting Your Intelligence]]、[[2026-05-12 你的 Obsidian 不该只是信息仓库]]
