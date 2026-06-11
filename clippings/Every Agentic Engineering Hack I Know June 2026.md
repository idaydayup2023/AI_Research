---
title: "Every Agentic Engineering Hack I Know (June 2026)"
source: "https://x.com/mvanhorn/status/2061877533885473181"
author:
  - "Matt Van Horn"
published: 2026-06-02
created: 2026-06-08
description: "Matt Van Horn 的 agentic engineering 工作流清单，覆盖 plan.md、Compound Engineering、语音输入、并行 session、远程控制、Codex/Claude 分工、个人知识库、skills 和 agent-native CLI。"
tags:
  - "clippings"
  - "x-article"
  - "agentic-engineering"
  - "coding-agents"
  - "claude-code"
  - "codex"
  - "agent-skills"
  - "developer-workflow"
---

# Every Agentic Engineering Hack I Know (June 2026)

## 原文信息

- X Article：<https://x.com/mvanhorn/status/2061877533885473181>
- 发布时间：2026-06-02
- 作者：Matt Van Horn
- 相关工具/项目：Compound Engineering、Claude Code、Codex、cmux、AgentMail、last30days、Granola、Proof、Printing Press、Agent Cookie。

## 核心提取

这篇长文的价值不在某个单独 hack，而在它把“agentic engineering”描述成一套日常操作系统：想法先变成 `plan.md`，多个 agent session 并行推进，语音承担输入层，个人笔记和会议 transcript 成为知识层，skills 和 CLI 把重复动作沉淀成可复用工具。

作者的中心方法可以压缩成一句话：人不再直接写大部分代码，而是提供方向、品味、约束和反应信号；agent 负责研究、规划、执行和反复修改。

但这篇也有明显风险点：作者主动推荐跳过权限确认，并承认高强度 agent building 会形成近似成瘾的循环。入库时不能只提取效率技巧，也要保留“权限边界”和“人类注意力被吞噬”的反面信号。

## 中文译读

### plan.md 是 Agent 的工作契约

作者反复强调：除非是一行改动，否则先让 agent 写 `plan.md`。这个计划文件不是给人逐字阅读，而是让 agent 先研究代码库、历史解决方案、外部文档和最佳实践，再写出方法、待改文件、验收标准和约束。

这和知识库里反复出现的“计划层质量门”一致：计划不是仪式，而是让 agent 承诺范围、证据和完成标准的 checkpoint。上下文爆掉时，新的 session 也能拿着 `plan.md` 续上。

### 先计划“怎么做计划”

最有迁移价值的一点是：作者把 `/ce-plan` 用到非工程工作里，而且要求 agent 先做“plan for the plan”。对战略文档、产品规格、竞争分析、董事会材料等深度知识工作，直接要成品容易让模型偷懒；先让它规划如何阅读材料、挖 transcript、组织论证，再执行，结果更深入。

这可以补充公众号自动化：成稿前不只是“写文章”，而是先写清楚“这篇文章要如何利用新增材料、历史摘录和旧稿差异”。

### 并行 session 改变人的工作

作者的日常不是一个 agent，而是四到六个 cmux tabs：一个写计划，一个按另一个计划执行，一个跑研究，一个修刚测出的 bug。人的角色变成“信号”：看结果、指出哪个方向更接近、给出品味判断、调整下一轮。

这与近期“共享证据地图”“多 Agent 角色审计”主题相邻。并行 agent 真正的问题不是开多少窗口，而是每个窗口是否能复用计划、证据和历史判断，是否避免重复搜索。

### 语音、远程和邮件入口降低启动成本

文中把语音输入、终端默认打开 Claude/Codex、远程控制每个窗口、给 Claude Code 一个邮箱地址等技巧放在一起。它们的共同作用是降低启动一个 agent run 的摩擦。

当启动成本低到一条语音、一个邮件或一个新 tab，用户会更频繁地把想法交给 agent。这既提高产出，也会放大无意义 build 的风险。

### notes、transcript 和 skills 是长期复利

作者把 Bear/Obsidian/Supermemory 等笔记系统、Granola raw transcript、历史 plan 和自定义 skills 都接入 agent。核心不是“资料越多越好”，而是让 agent 能读到过去的决策、会议原话、策略计划和重复动作的封装。

这里和 [[COLLEAGUE.SKILL Automated AI Skill Generation via Expert Knowledge Distillation]]、[[How to Build Claude Workflows That Run Without You]] 很接近：个人知识库最终要变成 agent 可调用的工作方式，而不是静态资料堆。

### 权限和心理风险不能被效率叙事盖住

作者把 “Dangerously Skip Permissions” 作为高效率技巧，但这在企业和高风险项目里不能直接照搬。跳过确认会减少摩擦，也会移除关键控制点。

更重要的是，作者最后专门写到 agent building 的沉迷循环：能快速构建任何东西，会让人持续工作、持续启动项目，却不一定验证是否有人需要。这个反面观察比很多效率建议更值得保留。

## 22 个 hack 的结构化摘录

- `plan.md` 先行：想法、bug、截图、错误日志都先变成计划。
- 不逐字读计划：让计划成为 agent 的 homework，人只追问 TLDR、原因和风险。
- 非工程工作也先做 plan for the plan。
- 用语音输入降低表达成本。
- 用多个 cmux tabs 并行推进不同 agent session。
- 新终端默认进入 Claude/Codex，而不是 shell。
- 远程控制每个窗口，并给 Claude Code/Codex 一个邮件入口。
- 跳过权限确认提升速度，但这是高风险技巧。
- Claude 计划、Codex 执行，形成跨 agent 分工。
- 在计划前先用 `last30days` 做外部信号研究。
- 把 Granola 原始 transcript 直接交给 LLM，而不是先人工总结。
- 人类提供 taste、direction 和 react-and-redirect signal。
- 用 HyperFrames 把视频也变成 agent 可写的 HTML/MP4 workflow。
- 把笔记系统作为 agent knowledge base。
- 用 Mac mini、Mosh、tmux、Hermes/OpenClaw 支撑远程工作。
- 用 Proof 把 `plan.md` 变成可给同事阅读和评论的文档。
- 把重复动作写成自己的 skills。
- 用同一套 agent loop 参与开源项目。
- 硬件和电源也成为 agentic workflow 的瓶颈。
- 用 Printing Press / Agent Cookie 生成能操作现实服务的 agent-native CLI。
- 警惕 agent building 成瘾和无用户产品。
- 文章本身也是用这套 talk-plan-build-repeat workflow 写成的。

## 可复用观点

- `plan.md` 是 agentic engineering 的最小可复用状态，不只是开发文档。
- 真正的并行 agent 工作流需要共享计划、历史、证据和验收标准，否则只是多开窗口。
- 人类在高吞吐 agent 系统里的职责会转向 taste、risk、priority 和 correction signal。
- 个人知识库、会议 transcript、历史计划和自定义 skills 共同构成 agent 的长期执行层。
- 降低启动成本会提升产出，也会放大权限风险、注意力消耗和“为 build 而 build”的心理风险。

## 可加工为公众号角度

- 可后续成稿方向：`Agentic Engineering 的核心不是多开几个 Agent，而是让计划成为状态`。
- 可后续成稿方向：`人类在 Agent 团队里不该做手，而该做信号`。
- 可补充旧稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]。这篇给出 plan.md、transcript、notes、skills 作为外置状态的工程实例。
- 可补充旧稿：[[2026-05-30 别让 Agent 白白烧掉反馈]]。这篇的 plan / Proof / review loop 可作为反馈资产案例。
- 暂不单独成稿原因：素材很强，但与近期 harness、状态外置、反馈资产主题高度相邻；更适合等待一两个同类实践或反例后合并成“计划作为共享状态”的文章。

## 关联笔记

- 已加工成稿：[[2026-06-08 把计划变成 Agent 团队的工作台]]
- [[How to Build Claude Workflows That Run Without You]]
- [[Lessons from building Claude Code How we use skills]]
- [[Redesigning Claude Code on desktop for parallel agents]]
- [[Agent view in Claude Code]]
- [[Long Live the Librarian! A Persistent Search Sub-Agent for Energy-Efficient Multi-Agent Software Engineering Systems]]
- [[COLLEAGUE.SKILL Automated AI Skill Generation via Expert Knowledge Distillation]]
- [[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[2026-05-30 别让 Agent 白白烧掉反馈]]
- [[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
