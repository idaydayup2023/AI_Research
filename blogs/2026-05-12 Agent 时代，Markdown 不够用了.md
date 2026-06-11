# Agent 时代，Markdown 不够用了

> AI 不只是替我们写文档，它正在开始替我们生成“临时工作界面”。

过去几年，Markdown 几乎成了 AI 工作流里的默认格式。

让模型写计划，用 Markdown。

让模型写总结，用 Markdown。

让模型输出 PR 说明、研究报告、会议纪要、SOP，也还是 Markdown。

这很合理。

Markdown 简单、轻量、跨平台、好复制，也容易被人类手动修改。对早期 AI 工作流来说，它几乎是完美格式。

但 Claude Code 团队成员 Thariq 最近写了一篇 X Article，标题叫《Using Claude Code: The Unreasonable Effectiveness of HTML》。这篇文章的观点很直接：

**随着 Agent 能做的事情越来越复杂，Markdown 正在变成一种限制。HTML 可能更适合成为人和 Agent 协作的新工作台。**

这个判断很值得放进我们之前讨论的 Agent 脉络里看。

昨天我们说，Agent 产品的护城河正在变成系统工程。

今天这篇文章补上了另一个容易被忽略的问题：

**Agent 不仅需要更好的模型、更好的工具、更好的记忆和评估，也需要更好的输出界面。**

---

## 一、Markdown 的优势，正在变成劣势

Markdown 最大的优势是什么？

简单。

但当 Agent 输出越来越复杂时，简单也会变成边界。

Thariq 提到一个很真实的体验：当 Markdown 文件超过一百行后，他很难认真读完，也更难让组织里的其他人读完。

这其实是很多 AI 工作流的通病。

我们让 Agent 生成了很长的计划、很长的分析、很长的报告，然后心里默认“我已经有文档了”。

但现实是，人并没有真正读进去。

这时问题就不是模型不会写，而是输出格式无法承载复杂信息。

更关键的是，Markdown 原本“方便人类编辑”的优势也在变弱。

很多时候，我们已经不再亲手编辑这些文件了。

Agent 写 spec，Agent 改 spec。

Agent 写初稿，Agent 继续改稿。

Agent 写计划，后续 Agent 根据计划执行。

人类的角色从“手动编辑文档”，变成“审阅、比较、调参、批准、反馈”。

当人类不再主要通过手改文本参与工作，Markdown 的核心优势就没有以前那么强了。

我们需要的不是更容易编辑的纯文本，而是更容易理解、比较、操作和分享的工作界面。

---

## 二、HTML 的价值，不是好看，而是信息密度

很多人听到 HTML，第一反应可能是：

这不就是网页吗？

会不会太重？

会不会不如 Markdown 简洁？

但 Thariq 的重点不是“HTML 更漂亮”，而是 HTML 的信息密度更高。

HTML 可以自然承载：

- 表格
- CSS 设计信息
- SVG 图示
- 代码片段
- 交互组件
- 工作流图
- canvas 空间表达
- 图片和截图
- tabs、links、responsive layout

这些东西在 Markdown 里不是不能做，而是做起来很别扭。

于是模型会开始用低效方式绕路：用 ASCII 画图，用 Unicode 模拟颜色，用一长串列表表达本来应该可视化的关系。

这就像让一个会画图的人只能用打字机工作。

它不是不能表达，但表达成本太高，阅读成本也太高。

对复杂任务来说，格式不是表面问题。

格式决定了信息能不能被看见，关系能不能被理解，方案能不能被比较。

---

## 三、真正重要的是：HTML 可以交互

HTML 最有意思的地方，不是它能展示更多东西，而是它能让人操作。

比如你让 Claude 生成一个设计方案。

Markdown 只能告诉你：

按钮动画时长 200ms，颜色从蓝变紫，缓动曲线是 ease-out。

HTML 可以直接给你几个 slider，让你调动画时长、颜色、曲线，调完以后点一个按钮，把参数复制回 Claude Code。

这就不再是“文档”了。

这是一个临时控制台。

Thariq 给了很多类似例子：

让 Claude 做一个 Linear ticket 优先级看板，把 30 个任务拖到 Now / Next / Later / Cut。

让 Claude 做一个 feature flag 配置编辑器，显示依赖关系，提醒你哪些开关不能单独打开。

让 Claude 做一个 prompt tuning 面板，左边编辑提示词，右边实时渲染样例输入，顺便显示字符数和 token 数。

这些东西都不一定要变成正式产品。

它们的价值恰恰在于“只为这一次任务存在”。

这可能是 Agent 时代非常重要的新范式：

**不要只让 AI 写文档，让 AI 为当前任务生成一次性工具。**

---

## 四、HTML 让人更容易留在 loop 里

很多人担心 Agent 越来越强以后，人会被甩出工作流程。

不是因为 Agent 不听话，而是因为它写的东西太长、太复杂、太快，人跟不上。

最后就变成：

Agent 生成计划。

人类扫一眼。

Agent 开始执行。

出了问题再回来补救。

这不是理想的人机协作，而是人类在假装审核。

HTML artifact 提供了另一种可能。

人不一定要逐行改文字，但可以通过界面参与判断：

- 用图表看清数据关系
- 用 tabs 比较多个方案
- 用 slider 调整参数
- 用 draggable cards 排优先级
- 用 annotated diff 审查代码
- 用 copy as JSON / copy as prompt 把操作结果交还给 Agent

这让人类重新进入 loop。

不是以“文档编辑者”的身份，而是以“判断者、调参者、审阅者、决策者”的身份。

这也呼应了我们之前写过的观点：Agent 的价值不只是自动执行，而是构建一个可评估、可追踪、可协作的工作系统。

如果输出格式只是长文本，很多系统能力都很难被人类感知和控制。

如果输出格式变成可视化、可交互的 artifact，人类就更容易介入关键判断。

---

## 五、这不是替代 Markdown，而是分层使用

当然，这不意味着 Markdown 该被扔掉。

Markdown 仍然适合很多场景：

- 简短记录
- 结构化笔记
- Git 友好的文档
- Obsidian 知识库
- 轻量草稿
- 需要长期维护的文本

HTML 也有明显缺点：

- 生成更慢
- token 更重
- diff 更难看
- 版本控制不如 Markdown 清爽
- 容易因为样式复杂而变得难维护

所以更合理的判断不是“HTML 取代 Markdown”，而是：

**Markdown 适合知识沉淀，HTML 适合复杂任务中的临时认知界面。**

比如在这个 Obsidian 知识库里，摘录、翻译、公众号草稿继续用 Markdown 很合理。

但如果要比较多个选题方向、分析十篇文章之间的关系、做公众号排期、审查一篇长稿结构，HTML artifact 可能会更适合。

它可以是一次性的。

生成出来，帮助你做判断。

判断完成，把结果导出成 Markdown、JSON 或 prompt，再回到知识库。

这就是一个很好的闭环：

Markdown 负责沉淀。

HTML 负责探索。

Agent 负责转换。

人负责判断。

---

## 六、Agent 输出格式会成为新战场

过去我们讨论 Agent，经常关注：

- 模型能力
- 工具调用
- 记忆
- 多 Agent 编排
- prompt caching
- evaluation
- skills

但输出格式其实同样重要。

因为 Agent 的能力再强，最终也要以某种形式交给人。

如果输出让人读不进去，等于没有被理解。

如果输出不能被分享，等于没有进入组织。

如果输出不能被操作，等于人只能被动接受。

这也是为什么 Claude Design、HTML artifacts、interactive reports、custom editors 这些东西会越来越重要。

Agent 不是只生成答案。

Agent 会生成界面。

而界面会改变协作方式。

这可能是很多人低估的一点：未来 AI 产品的竞争，不只在谁的模型更强，也在谁能把模型输出组织成更适合人类判断的界面。

---

## 结语：下一代文档，可能是一次性软件

Markdown 适合记录思想。

HTML 适合承载复杂工作。

当 Agent 只能写短答案时，Markdown 足够了。

当 Agent 开始写计划、做研究、解释代码、生成设计、处理工单、调参数、整理数据时，纯文本就开始吃力。

这时最好的输出不一定是一篇更长的文档。

它可能是一个只用一次的小网页。

一个看板。

一个调参面板。

一个 PR explainer。

一个研究报告。

一个交互式 spec。

一个能把你的操作重新导出成 prompt 的临时编辑器。

这听起来不像文档。

更像软件。

但这可能正是 Agent 时代的新文档形态：

**文档不再只是被阅读，文档开始被操作。**

## 参考链接

- Thariq: [Using Claude Code: The Unreasonable Effectiveness of HTML](https://x.com/trq212/status/2052809885763747935)
- Thariq: [HTML effectiveness examples](https://thariqs.github.io/html-effectiveness/)
- Claude Blog: [Lessons from building Claude Code: Prompt caching is everything](https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything)
- Perplexity Research: [Designing, Refining, and Maintaining Agent Skills at Perplexity](https://research.perplexity.ai/articles/designing-refining-and-maintaining-agent-skills-at-perplexity)

## 关联笔记

- 来源摘录：[[Using Claude Code The Unreasonable Effectiveness of HTML]]
- 相关旧稿：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]、[[别再把 Agent Skill 当提示词了]]
- Claude Code 工程：[[Lessons from building Claude Code Prompt caching is everything]]、[[Redesigning Claude Code on desktop for parallel agents]]
- 设计与代码：[[Some Notes on AI]]、[[Some Notes on AI - 博客]]
