---
title: "The founder's playbook: Building an AI-native startup"
source: "https://claude.com/blog/the-founders-playbook"
pdf: "https://cdn.prod.website-files.com/6889473510b50328dbb70ae6/69fe2a55b93bb0732b1fe33c_The-Founders-Playbook-05062026_v3%20(1).pdf"
author:
  - "Claude"
published: 2026-05-14
created: 2026-05-19
description: "Claude 官方发布的 AI-native startup founder playbook：把 Idea、MVP、Launch、Scale 四个阶段重新映射到 AI 能力下，强调 founder 从执行者转为 agent/workflow/orchestration 的设计者。"
tags:
  - "clippings"
  - "claude"
  - "startup"
  - "ai-native"
  - "founder"
  - "claude-code"
  - "claude-cowork"
  - "agent-workflow"
---

# The founder's playbook: Building an AI-native startup

## 原文信息

- 博客页：<https://claude.com/blog/the-founders-playbook>
- PDF playbook：<https://cdn.prod.website-files.com/6889473510b50328dbb70ae6/69fe2a55b93bb0732b1fe33c_The-Founders-Playbook-05062026_v3%20(1).pdf>
- 发布时间：2026-05-14
- 发布方：Claude
- PDF 页数：36 页

## 核心提取

这份 playbook 的核心判断是：AI 并没有改变 founder 的最终任务，founder 仍然要找到真实问题、做出解决方案、把它扩展成重要公司；但 AI 改变了到达这个目标的路径。

Anthropic 把 AI-native startup 的生命周期拆成四段：

- **Idea**：不要急着让 Claude Code 写代码，先用 Claude 做问题假设、反证、竞品地图、用户访谈和趋势判断。
- **MVP**：把经过验证的问题转成最小产品，但要先写 architecture、scope、measurement framework 和 `CLAUDE.md`，防止 AI 生成的技术债失控。
- **Launch**：从“产品值得存在”转向“公司值得增长”，用 Claude Code 还技术债，用 Claude Cowork 替代 founder 注意力，建立安全、合规和轻量产品管理系统。
- **Scale**：founder 从 builder 转成 public-facing executive，用 Claude 把机构知识、GTM、企业支持、数据飞轮和 workflow lock-in 系统化。

最值得保留的一句话是：**瓶颈不再是你能不能 build，而是你选择 build 什么。**

## 中文译读

### 一、Founder 从个人贡献者变成编排者

过去 founder 常被能力边界定义：技术 founder 写代码，非技术 founder 做销售、运营和融资。Claude 认为，2026 年的模型、系统和 agent 正在消解这道墙。

非技术 founder 可以用 Claude Code 交付生产软件；技术 founder 也可以用 Claude 生成 go-to-market strategy、财务模型和 pitch deck。

这并不意味着 founder 变得不重要。相反，founder 的工作上移了：从亲自做每一件事，变成设计和指挥 AI agents、工具、工作流和少量团队。

这和 [[2026-05-13 别把AI当工具，要把它当岗位来设计]] 的观点接上了：AI 的下一步价值不是“回答问题”，而是承担经过清晰定义的岗位和 routine。

### 二、Idea 阶段：不要把 build 当 validate

Idea 阶段的退出标准是 problem-solution fit。你要证明一个真实、具体、频繁的问题存在，并且你的解决方案确实指向验证过程揭示出来的问题，而不是你最初幻想的问题。

Claude 给出的三条退出问题是：

- 问题是否真实、具体，谁遇到它、频率多高、影响多严重、现在怎么解决。
- 你的方案是否解决了真实问题，而不是原始假设中的问题。
- 是否有足够 qualitative evidence 支撑进入 MVP，而不是信仰式开工。

这里最重要的失败模式是：AI 让构建变得太容易，导致 founder 在理解还不够时就过早构建。

Claude 建议在此阶段用 Chat 做快速思考，用 Claude Cowork 做研究、竞品、访谈和文档，用 Claude Code 只构建单一核心交互的 lightweight prototype。

这和 [[AgentEscapeBench Evaluating Out-of-Domain Tool-Grounded Reasoning in LLM Agents]]、[[2026-05-12 Agent 不会靠提示词变可靠]] 背后的原则类似：不要把“输出看起来合理”误认为“推理链条可靠”。

### 三、MVP 阶段：AI 技术债会复利

MVP 阶段仍然不是纯 construction phase，而是从问题空间转向解决方案的 evidence-gathering exercise。退出标准是真正的 product-market fit：明确用户群愿意回来、付费或推荐。

AI-native MVP 的关键风险是 agentic technical debt。

传统技术债可以慢慢清理，但 AI 技术债会以另一种方式复利：如果 spec、architecture、scope 和 context 没有写下来，每次 Claude Code session 都会重新推断基础决策，导致代码可以运行，但没有统一 mental model。

Claude 给出的修复方法很直接：

- 先定义架构原则、依赖取舍和 tradeoff。
- 把输出保存成 `CLAUDE.md`，作为项目级长期上下文。
- 每次 Claude Code session 开始时重读 scope 和 architecture context。
- 每次 session 结束时补一条日志：做了什么、产生了什么决策、引入了什么假设。

这和 [[2026-05-13 Agent 上生产前，先管住它的会话]] 的主线完全一致：生产级 Agent 不是跑通一次，而是让运行过程可解释、可复现、可维护。

### 四、Launch 阶段：替代 founder 注意力

Launch 阶段的问题从“产品是否值得存在”变成“业务是否值得增长”。此时 founder 继续把所有 thread 抓在手里，就会从资产变成瓶颈。

Claude 把 Launch 的退出标准拆成三点：

- 增长可重复、渠道明确，CAC、LTV、payback period 能说清。
- 产品能承受生产负载，安全、合规、可靠性经得住真实条件。
- 运营不再依赖 founder 本人记得去做，支持、triage、sprint planning、reporting 都有流程和自动化。

这里最有价值的表述是：**Claude Code builds the product, Claude Cowork builds the company around it。**

这意味着 founder 不只是用 AI 写产品代码，也要用 AI 建公司运行层：bug triage、周报、指标简报、sprint cadence、合规文档、企业买家需要的控制项。

这可以和 [[2026-05-18 从流水线到持续计算系统]] 连接：AI-native 公司不是把旧流程自动化，而是把持续运行的计算系统放进组织基础设施。

### 五、Scale 阶段：护城河来自累积深度

Scale 阶段 founder 从 builder 转成 public-facing executive。产品仍然重要，但 founder 的日常工作越来越围绕公司本身：分析师沟通、董事会、企业合同、IPO 准备、组织治理、财务控制和战略叙事。

Claude 对 Scale 阶段的护城河判断值得单独摘出：

- 领域知识被持续编码进产品。
- 用户行为数据形成难以复制的 feedback loop。
- 产品与客户工作流和其他系统深度集成。
- API、webhook、SDK 和原生集成让客户在你的产品上构建自己的流程。

这和 [[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]] 很接近：SDK、MCP、API、webhook 不只是开发者体验，而是产品进入客户工作流的控制面。

### 六、Claude 三种表面的分工

Playbook 对 Chat、Claude Cowork、Claude Code 的分工非常清楚：

- Chat：快速问答、改写、brainstorm、临时 sanity check。
- Claude Cowork：长时间知识工作，连接文件和系统，产出文档、deck、表格、定时任务和跨工具 workflow。
- Claude Code：写代码、测试、debug、重构、迁移 legacy code、在本地/IDE/cloud sandbox 中推进工程。

三者背后是同一个 Claude，差异在于 workspace。这个判断可以作为后续评估 Claude 产品线的结构框架：不是哪个模型更聪明，而是哪种工作面更适合当前任务。

## 可复用观点

- AI-native startup 的核心不是“更少人做更多事”，而是 founder 的注意力从执行迁移到编排。
- Idea 阶段的纪律是先验证再构建；AI 把构建成本降得越低，验证纪律越重要。
- MVP 阶段要警惕 agentic technical debt：没有 spec、scope、architecture 和 context 的 AI 代码会快速失去统一 mental model。
- Launch 阶段的关键不是继续 founder heroics，而是用 workflow/system 替代 founder 注意力。
- Scale 阶段的护城河来自累积深度：领域知识、用户数据、工作流集成、API/SDK/webhook 控制面。
- Chat、Cowork、Code 的差异不是模型差异，而是 workspace 差异。
- 创业瓶颈从“能不能 build”转向“选择 build 什么”。

## 可加工为公众号角度

- AI-native 创业的真正变化：Founder 从 Builder 变成 Orchestrator。
- 别急着 Vibe Code：AI 让 build 太容易，反而更需要验证纪律。
- Claude 官方创业手册背后的信号：未来公司是由 agent、workflow、runbook 和控制面组成的。

## 关联笔记

- 已加工成稿：[[2026-05-19 AI-native 创业的瓶颈，不是能不能做，而是该不该做]]、[[2026-06-08 公司正在变小，也正在变大]]
- 角色与岗位设计：[[How to Turn Claude Into a Full-Time AI Employee in 7 Days Full Course]]、[[2026-05-13 别把AI当工具，要把它当岗位来设计]]
- 生产级 Agent：[[How to Build AI Agents in 2026 Full Guide]]、[[2026-05-13 Agent 上生产前，先管住它的会话]]
- Claude Code 工程：[[A few random notes from Claude coding quite a bit last few weeks]]、[[2026-05-18 别在 AI coding 里梦游：把验证闭环写进工作流]]
- 组织运行层：[[CI_CD 又被杀死了？]]、[[2026-05-18 从流水线到持续计算系统]]
- 接口控制面：[[Anthropic acquires Stainless]]、[[2026-05-19 Agent 时代，SDK 不是 DevRel，是控制面]]
