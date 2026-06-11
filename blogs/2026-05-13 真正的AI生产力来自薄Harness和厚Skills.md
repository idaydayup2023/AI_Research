# 真正的AI生产力来自薄Harness和厚Skills

![封面](../covers/2026-05-13-thin-harness-fat-skills.png)

> 10x 或 100x 的差距，不是模型差距，而是你有没有把重复判断沉淀成系统。

很多人以为 AI coding agent 的生产力差距来自模型。

更聪明的 Claude。

更大的上下文。

更强的推理能力。

更贵的订阅。

但 Garry Tan 最近写了一篇长文《Thin Harness, Fat Skills》，提出了一个更有解释力的判断：

**2x 用户和 100x 用户，可能用的是同一个模型。真正的差距不是模型智能，而是系统架构。**

这个判断和我们最近几篇文章形成了一个完整脉络。

《别再把 Agent Skill 当提示词了》讲的是 Skill 不是 prompt，而是可复用的上下文模块。

《Agent 产品的护城河正在变成系统工程》讲的是 Agent 产品竞争正在从模型转向系统工程。

《你的 Obsidian 不该只是信息仓库》讲的是知识库应该成为个人知识层，而不是存储仓库。

Garry 这篇文章把这些线索压缩成一句话：

**Thin harness, fat skills.**

---

## 一、Harness 是产品，但不能变胖

Harness 是什么？

简单说，就是包在模型外面的程序。

它负责运行 LLM loop，读写文件，管理上下文，调用工具，维护安全边界。

Live repo context、prompt caching、purpose-built tools、context bloat minimization、session memory、parallel sub-agents，这些都属于 harness 的一部分。

所以 Garry 说：the harness is the product。

这句话没错。

但它容易被误解成：那就把所有能力都塞进 harness。

这恰恰是反模式。

很多系统会做成 fat harness with thin skills：

几十个工具定义塞进上下文。

每个 REST endpoint 包一层工具。

MCP 调用一次 2-5 秒。

浏览器操作截图、查找、点击、等待、读取，每一步都绕一圈。

结果是 token 更多，延迟更高，失败点更多。

好的 harness 应该薄。

它只做几件事：

- 运行模型循环
- 读写必要文件
- 管理上下文
- 调用少量窄而快的工具
- 执行安全边界

其余能力，不应该堆进 harness。

应该上移到 skills。

---

## 二、Skill 不是提示词，是 method call

Garry 对 Skill 有一个很好的比喻：

**Skill file works like a method call.**

它不是 saved prompt。

它更像一个可以被不同参数调用的方法。

用户提供 what to do。

Skill 提供 how to do。

比如一个 `/investigate` Skill，可以包含七步：

限定数据集。

建立时间线。

逐份文档 diarize。

综合信息。

正反论证。

引用来源。

输出判断。

同一个 Skill，传入不同 TARGET、QUESTION、DATASET，就能处理完全不同的任务。

它可以调查一个安全科学家的邮件，也可以追踪一个 shell company 的政治捐款。

同样的流程，不同的世界。

这就是 Skill 的真正价值。

它不是告诉模型“请帮我认真分析”。

它是把一种判断流程封装起来，让模型在不同任务中反复调用。

这也是为什么我们一直说：

**Skill 不是 prompt engineering，而是 software design。**

只不过这里的“代码”不是 Python 或 TypeScript，而是 Markdown。

Markdown 写的是过程、判断和上下文。

模型负责在语言空间里执行这段程序。

---

## 三、Resolver 决定什么时候加载什么知识

一个成熟 Agent 系统，不能把所有知识都塞进上下文。

Garry 提到，他自己的 `CLAUDE.md` 曾经有 20,000 行。

所有经验、模式、坑、规则都写进去。

听起来很强，实际上很糟。

因为模型注意力会下降。

最后的修复方式，是把 `CLAUDE.md` 缩到大约 200 行，只保留指向文档的 pointers。真正需要哪个文档，由 resolver 在正确时刻加载。

Resolver 是什么？

就是上下文路由表。

当任务类型 X 出现时，先加载文档 Y。

Skills 告诉模型怎么做。

Resolvers 告诉模型什么时候读什么。

这点非常关键。

Agent 最大的问题往往不是不知道，而是错误时间读了错误上下文，或者把所有上下文一次性读进去。

上下文不是越多越好。

上下文要在正确时间出现。

这和 Claude Code 的 prompt caching、Perplexity 的 Skill description、我们的 Obsidian 关系图谱都是同一个原则：

**知识不应该常驻上下文，知识应该按需被唤醒。**

---

## 四、Latent 和 Deterministic 必须分清

Garry 文章里另一个非常重要的框架，是 latent vs deterministic。

系统里的每一步，要么属于 latent，要么属于 deterministic。

Latent space 是模型擅长的地方：

- 判断
- 综合
- 解释
- 模式识别
- 矛盾处理
- 语义重分类

Deterministic layer 是工具擅长的地方：

- SQL 查询
- 编译代码
- 算术
- 文件操作
- 排序
- 约束求解
- 可重复执行的检查

最糟糕的 Agent 系统，会把确定性问题硬塞给模型。

比如让 LLM 安排 800 人座位。

它会生成一张看起来很合理、实际上错误百出的 seating chart。

这不是模型不聪明。

是系统把错误类型的工作放错了地方。

好的架构应该非常清楚：

模型负责判断。

工具负责可靠执行。

Skill 负责封装过程。

Resolver 负责加载上下文。

Harness 负责运行和约束。

这才是 Agent 系统工程的核心。

---

## 五、Diarization：从资料堆里生成判断

Garry 使用了一个词：diarization。

在他这里，它不是音频说话人分离，而是知识工作的关键步骤：

模型读完一个主题的所有资料，写出一个结构化 profile。

不是摘要。

不是检索结果。

而是一页浓缩判断。

它要读几十份甚至上百份文档，保留矛盾，注意变化时间，发现“说的”和“实际做的”之间的差距。

比如一个 founder 说自己在做 AI agent observability，但 GitHub commit 里 80% 都是 billing module。

这时候模型可以判断：

他可能不是在做 observability，而是在做 AI agent FinOps。

这个判断不是 SQL 能查出来的。

不是 keyword search 能搜出来的。

也不是普通 embedding similarity 能直接给你的。

它需要真正读完整个 profile，然后做语义判断。

这也是个人知识库真正应该追求的东西。

不是存了多少文章。

不是能搜到多少关键词。

而是能不能从碎片中生成新的判断。

---

## 六、如果你问第二次，系统就失败了

Garry 文中最有行动力的一句话是：

如果我让你做一件可能会重复的事，你不允许只做一次。

先在 3 到 10 个样本上手动做。

给我看输出。

我认可后，把它 codify into a skill file。

如果它应该自动运行，就放到 cron。

测试标准是：

**如果我必须问你第二次，你就失败了。**

这句话适用于几乎所有知识工作。

你第二次让 AI 帮你整理链接，它应该变成采集流程。

你第二次让 AI 翻译文章，它应该变成摘录模板。

你第二次让 AI 判断能不能成稿，它应该变成成稿判断规则。

你第二次让 AI 生成封面，它应该变成封面生成流程。

你第二次让 AI 检查引用，它应该变成发布前检查。

这就是我们现在这个 Obsidian 项目正在逐步变成的东西。

不是一次次让 AI 帮忙。

而是每次帮忙之后，把有效过程写回系统。

系统因此复利。

---

## 七、真正的 100x 来自可复利流程

很多人期待下一个更强模型带来生产力飞跃。

当然会有。

但如果你的工作方式还是一次性 prompt，下一个模型只会让一次性 prompt 更强一点。

真正的复利来自：

- 把重复任务写成 Skill
- 把上下文变成 resolver 可加载的文档
- 把确定性操作下沉到工具
- 把判断流程保留在模型可执行的 Markdown 中
- 把反馈写回 Skill
- 把定期任务放到 cron

这样，每次模型升级，整个系统都会变强。

因为 skill 里的 latent steps 会变好，而 deterministic layer 仍然可靠。

这就是 fat skills 的价值。

它们不是一次性的输出。

它们是系统的永久升级。

---

## 结语：不要把 AI 当聪明外包，要把它变成系统

AI 生产力的分水岭，不是会不会写提示词。

也不是用不用最新模型。

而是你有没有意识到：

每一次重复请求，都是一个系统设计机会。

每一次高质量输出，都应该被反向提炼成流程。

每一次失败，都应该变成 gotcha、eval 或 resolver。

每一次判断，都应该想清楚它属于 latent 还是 deterministic。

薄 harness 负责跑。

厚 skills 负责沉淀判断。

确定性工具负责可靠执行。

知识层负责按需唤醒上下文。

这才是 AI 时代真正的生产力系统。

不是更聪明地问一次。

而是让系统下一次自动更聪明。

## 参考链接

- Garry Tan: [Thin Harness, Fat Skills](https://x.com/garrytan/status/2042925773300908103)
- Perplexity Research: [Designing, Refining, and Maintaining Agent Skills at Perplexity](https://research.perplexity.ai/articles/designing-refining-and-maintaining-agent-skills-at-perplexity)
- Claude Blog: [Lessons from building Claude Code: Prompt caching is everything](https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything)
- Thariq: [Using Claude Code: The Unreasonable Effectiveness of HTML](https://x.com/trq212/status/2052809885763747935)

## 关联笔记

- 来源摘录：[[Thin Harness, Fat Skills]]
- Skill 工程：[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[别再把 Agent Skill 当提示词了]]
- Skill 实操：[[How to Use Claude Skills to Automate Any Workflow Full Course]]
- Harness 底座：[[The Anatomy of an Agent Harness]]、[[什么才是真正的 Harness Engineering？]]
- 系统工程：[[2026-05-11 Agent 产品的护城河正在变成系统工程]]
- 知识层：[[Your Obsidian Vault Is Probably Wasting Your Intelligence]]、[[2026-05-12 你的 Obsidian 不该只是信息仓库]]
