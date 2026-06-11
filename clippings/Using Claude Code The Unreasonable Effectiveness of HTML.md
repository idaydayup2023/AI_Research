---
title: "Using Claude Code: The Unreasonable Effectiveness of HTML"
source: "https://x.com/trq212/status/2052809885763747935"
examples: "https://thariqs.github.io/html-effectiveness/"
author:
  - "Thariq"
published: 2026-05-08
created: 2026-05-12
description: "Claude Code 团队成员 Thariq 讨论为什么在 agent 工作流中，HTML 正在成为比 Markdown 更适合承载规格、报告、代码解释、原型和交互式编辑的输出格式。"
tags:
  - "clippings"
  - "claude-code"
  - "html"
  - "agent-output"
  - "artifact"
  - "workflow"
---

# Using Claude Code: The Unreasonable Effectiveness of HTML

## 原文信息

- X Article：<https://x.com/trq212/status/2052809885763747935>
- 示例集：<https://thariqs.github.io/html-effectiveness/>
- 发布时间：2026-05-08
- 作者：Thariq（Claude Code / Anthropic）

## 核心提取

这篇文章的核心观点是：Markdown 曾经是 agent 与人沟通的默认格式，但随着 agent 能完成更复杂的工作，Markdown 的信息密度、视觉表达、可分享性和交互性开始不够用。HTML 更适合作为 Claude Code 的输出载体，因为它可以承载表格、CSS、SVG、交互、脚本、canvas、图片、工作流图和自定义编辑界面。

作者的关键判断不是“HTML 比 Markdown 高级”，而是：当人类不再亲手编辑 agent 输出，而是把输出作为规格文档、研究报告、PR 解释、设计探索和临时工具使用时，Markdown 的最大优势正在变弱，HTML 的表达力开始变得更重要。

## 中文译读

### 一、Markdown 的问题不是简单，而是不够表达复杂工作

Markdown 简单、可移植、易编辑，因此成为 agent 输出的默认格式。Claude 甚至能用 ASCII 在 Markdown 里画图。

但作者认为，随着 agent 输出的规格、计划和报告越来越长，Markdown 文件超过一百行后很难认真阅读，也很难让团队其他人读完。

更重要的是，他越来越少直接编辑这些文件，而是把它们当成 spec、reference、brainstorming output。真正要改时，也通常是让 Claude 修改。这样一来，Markdown “方便人类手改” 的优势就下降了。

### 二、HTML 的优势是信息密度

HTML 可以表达更丰富的信息：

- 表格和结构化数据
- CSS 设计数据
- SVG 图示和流程图
- script tags 中的代码片段
- JavaScript + CSS 交互
- HTML/SVG 工作流图
- canvas 和绝对定位表达空间关系
- 图片与视觉素材

作者认为，几乎任何 Claude 能读取的信息，都可以被相对高效地表达成 HTML。HTML 因此成为一种高密度的人机沟通格式。

### 三、HTML 让复杂输出更容易被阅读和分享

Claude Code 能写越来越复杂的计划和说明。HTML 可以用 tabs、图示、链接、响应式布局等方式组织内容，让人更容易导航和阅读。

Markdown 文件在分享时往往需要作为附件发送，而 HTML 上传后可以直接给链接。作者认为，spec、report 或 PR writeup 如果是 HTML，被同事真正打开阅读的概率会更高。

### 四、HTML 支持双向交互

HTML 不只是展示格式，还可以成为临时交互界面。

你可以让 Claude 创建 sliders、knobs、draggable cards、表单编辑器、prompt tuning 面板、copy as JSON/copy as prompt 按钮。这样人类可以用界面调整参数，再把结果复制回 Claude Code。

这点特别重要：HTML artifact 不只是输出结果，而是一个“人类调参 + Agent 继续执行”的中间界面。

### 五、Claude Code 的优势是上下文摄取

作者解释为什么用 Claude Code 做 HTML，而不是只用 Claude.ai 或设计工具：Claude Code 可以读取代码库、文件系统、MCP、Slack、Linear、浏览器、git history 等大量上下文。

比如写这篇文章时，他让 Claude Code 遍历代码文件夹，找出过去生成的 HTML 文件，分类整理，再生成一个包含所有示例图的 HTML 文件。

这和 [[2026-05-11 Agent 产品的护城河正在变成系统工程]] 的观点一致：Agent 产品的价值不只在模型，而在它能摄取多少真实上下文，并把这些上下文转化成可读、可操作的产物。

## 使用场景

### Specs、Planning 与 Exploration

HTML 适合做复杂方案探索。比如让 Claude 生成多个 onboarding screen 方向，把布局、语气和信息密度差异放在同一个 HTML grid 中比较。

也可以让 Claude 生成实施计划，包含 mockups、data flow、关键代码片段和交互说明。确认后再开新 session，把这些 HTML 文件交给后续 agent 实现或验证。

### Code Review 与代码理解

HTML 可以渲染 diff、注释、流程图和模块图，比 Markdown 或 GitHub 默认 diff 更适合解释复杂 PR。

作者提到，他现在会给每个 PR 附一个 HTML code explainer，用于帮助 reviewer 理解变更。

### Design 与 Prototypes

HTML 对设计表达非常自然。Claude 可以用 HTML 快速画出交互原型、动画选项、设计系统 artifact，并提供 sliders 或 knobs 让人调参。

### Reports、Research 与 Learning

Claude Code 可以跨 Slack、代码库、git history、互联网等来源整理报告。HTML 适合做可读性更强的长报告、交互式 explainer，甚至 slideshow/deck。

### Custom Editing Interfaces

当需求很难用纯文本表达时，可以让 Claude 生成一次性编辑器：比如 Linear ticket 优先级看板、feature flag 表单、prompt tuning 面板、配置编辑器、标注界面等。

这些编辑器不一定要成为正式产品，但可以在一次任务中极大提高人机协作效率。

## 可复用观点

- Agent 输出格式正在从“方便编辑”转向“方便理解、分享和交互”。
- Markdown 适合线性文本，HTML 适合复杂规格、可视化、交互式编辑和上下文密集型报告。
- HTML artifact 是一种中间工作界面，不只是最终交付物。
- Agent 的下一类高价值产物，可能不是文档，而是一次性工具和一次性界面。
- 对复杂任务来说，人类保持 in the loop 的方式，不一定是改文字，而是操作一个由 agent 生成的界面。

## 可加工为公众号角度

- Agent 时代，Markdown 不够用了：为什么 HTML 会成为人机协作的新工作台。
- 不要只让 AI 写文档，让它生成一次性工具。
- Claude Code 的真实价值不是写代码，而是把代码库上下文变成可读、可交互的 artifact。

## 关联笔记

- 可加工成稿：[[2026-05-12 Agent 时代，Markdown 不够用了]]
- Agent 系统：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- Skill 与上下文：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[别再把 Agent Skill 当提示词了]]
- 设计与代码：[[Some Notes on AI]]、[[Some Notes on AI - 博客]]
- Claude Code 工程：[[Lessons from building Claude Code Prompt caching is everything]]、[[Redesigning Claude Code on desktop for parallel agents]]
