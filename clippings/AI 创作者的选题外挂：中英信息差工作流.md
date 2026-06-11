---
title: "AI 创作者的选题外挂：中英信息差工作流"
source: "https://x.com/lawrencew_zen/status/2048672653125509351?s=46&t=ydzhjLSB0w4reaEpbYJKaQ"
author:
  - "[[@lawrencew_zen]]"
published: 2026-04-27
created: 2026-04-28
description: "AI 更新太快。新模型、新工具、新论文、新争议——这边还在消化昨天的，那边明天的又出来了。对做内容的人来说，「追 AI 热点 + 持续更新内容」是日常工作。但中文 AI 圈卷成红海，能写的角度都被写过了；想跳出红海，就得盯英文圈——英文圈先评测、先讨论、先开骂，中文圈追赶有 3-..."
tags:
  - "clippings"
---
![Image](https://pbs.twimg.com/media/HGzSj_YaoAET3qL?format=jpg&name=large)

AI 更新太快。新模型、新工具、新论文、新争议——这边还在消化昨天的，那边明天的又出来了。

**对做内容的人来说，「追 AI 热点 + 持续更新内容」是日常工作**。但中文 AI 圈卷成红海，能写的角度都被写过了；想跳出红海，就得盯英文圈——英文圈先评测、先讨论、先开骂，中文圈追赶有 3-7 天滞后。**这个时间差就是信息差，是内容创作者的天然蓝海**。

X 这种国际平台依然不例外，不信你就开个小号，只关注英推的看看。

作为中推或者中文创作者你需要比中文圈快 3 天看到英文圈的新东西，第一个用中文写出来——就能大概率的获取更多的流量，GEO 全是你的。

不只是写文章，第一时间获取到内容之后，直接更新视频也是一样，国内的平台信息差最大，你直接更新就有先发优势。

问题是怎么找？英文 AI 圈站点几十个，每天产几百篇，手动刷一上午都看不过来。

这篇文章教你一个思路：**让 AI 帮你找 AI 的信息差，专门为追热点 + 持续更新内容服务。**

具体做法是用 Claude Code + XCrawl + n8n 搭一个工作流，每天早上 7:00 自动扫 10 个英文 AI 站，把"中文圈还没人写过的话题"按热度排序，整理成日报落到 Obsidian vault——**打开就是当天的命题作文清单**。本文写完时这台工作流已经在我 VPS 上跑着——你看到的不是构想，是已经在用的工具。

整篇分两段：**先选源**（决定每天扫哪些站），**再搭工作流**（接成 24×7 自动化工作流）。

## 工具准备

XCrawl 是个网页抓取 API，主打三件套——**Search**（多搜索引擎检索）、**Map**（站点 URL 列表发现）、**Scrape**（单页正文抓取 + 内置 LLM 结构化提取）。底层带住宅代理池 + 智能指纹防反爬，按 credits 计费按需付费——**不用自己买代理 IP、不用维护服务器**，注册即送 1000 credits，[从这个入口注册 XCrawl](https://xcrawl.com/?keyword=bqczfsv6)，够你做完一整篇文章的调研 + 跑一周自动化。

更省心的是它给 Claude Code 提供官方 Skills 包，只需要两步：

1. 先从 [这个入口注册 XCrawl](https://xcrawl.com/?keyword=bqczfsv6)，激活免费 1000 credits
2. clone [xcrawl-skills 仓库](https://github.com/xcrawl-api/xcrawl-skills)到 ~/.claude/skills/，把 API key 写进 ~/.xcrawl/config.json

装完，Claude Code 就能用 xcrawl-search、xcrawl-map、xcrawl-scrape 三件套了——**不用写代码、不用配 MCP server，跟 Claude 说话就行**。

如果你自己已经有自己搭建的一套工具，也能套我的流程。文章最重要的就是思路。

接下来三步：让 Claude 帮我找候选站 → Map 验证 → 再多补充点权威站点。

## 第一步：让 Claude 帮我找候选站

第一次 Claude 默认就给我搜了 5 个英文站——[latent.space](https://latent.space/) / [simonwillison.net](https://simonwillison.net/) / [oneusefulthing.org](https://oneusefulthing.org/) / [therundown.ai](https://therundown.ai/) / Medium AI tag。

我自以为对英文 AI 不熟悉，但是，至少 Openai 这些我知道的，都没有。反正我直觉觉得是少了。

换个思路：**让 Claude Code 自己去找哪些站值得爬。**

直接跟 Claude Code 说：

> 帮我想几条搜索 query 找英文 AI 内容站大家都在推哪些，然后用 xcrawl-search 跑一遍。出现两次以上的域名给我列出来就行，Reddit / LinkedIn / YouTube / Medium 这种聚合社区不算。

Claude 给我憋出三条——大致围绕「best AI newsletters / top AI blogs / AI tools daily news」展开，每条烧 4 credits，三条共 12。

返回结果三类混在一起：

- **真正的信号源**——直接命中域名（therundown.ai、superhuman.ai、tldr.tech）
- **列名单的列表文**——标题是 "Top 12 AI Newsletters in 2026" 这种，文章本身没价值，**里面提到的站名是金子**
- **噪音**——LinkedIn 帖、YouTube 视频、Reddit 楼

Claude 把跨多次提到的高频站名汇总给我：

- The Rundown AI（已有）
- Superhuman AI（**新**）
- Import AI（**新**——Anthropic 联创 Jack Clark 的个人 newsletter）
- The Batch（[DeepLearning.AI](https://deeplearning.ai/) / Andrew Ng）
- TLDR AI
- Ben's Bites

**关键发现**：直觉清单漏了 Import AI 和 Superhuman AI——尤其 Import AI 是 Anthropic 联创亲自写的，深度英文 AI 圈第一档。如果不让 Search 兜底，我永远不会知道。

候选池从 5 扩到 9。

## 第二步：Map 验证——名气大不等于能爬

XCrawl 的 Map API 作用是「给一个域名，返回站点结构里的 URL 列表」——比 Crawl 便宜，1 credit 拿 50 个 URL，是验证候选站最快的手段。

Map 一遍立刻看得出三件事：

1. 这站还活不活——能不能拿到最近的文章 URL
2. URL 模式干不干净——能不能按「今日新发」过滤
3. 反爬触不触禁忌——大站会不会直接挡

我跟 Claude Code 说：

> 这些候选站你挨个验证一下，我想看哪些能爬、URL 长啥样。挂掉的告诉我为啥挂。

实测结果：

![Image](https://pbs.twimg.com/media/HG5YueXasAAd8Af?format=jpg&name=large)

最有意思的是 [tldr.tech](https://tldr.tech/) **实测吃瘪**——名气这么大的站，Map 调过去只返回一行：[https://tldr.tech/robots.txt](https://tldr.tech/robots.txt)。这是站点告诉你「拒绝抓取」的标准信号。**XCrawl 在这里没硬上**——能爬就爬，挡了就跳，不触碰禁忌。

XCrawl 的防反爬靠的是底层**住宅代理池 + 智能浏览器指纹**，对正常公开内容站点稳定 90%+ 成功率（[latent.space](https://latent.space/) / Anthropic / OpenAI 全部一次过）；对像 tldr 这种主动声明拒绝抓取的，工具尊重协议直接跳过——这是合规工具该有的体面，也是把这套工作流拿出去给读者复刻不会出事的前提。

收敛到 **6 个能爬的英文站**。

## 第三步：再扩一轮，补一手源

6 个站集中在「评测+新闻+独立写作者」，但缺两类**一手源**：

1. **研究/论文聚合**——英文 AI 圈每天上百篇 arxiv 新论文，得有日更摘要源
2. **官方公司 blog**——Anthropic / OpenAI / DeepMind / Google AI，新模型新 feature 永远它们先发，**公关稿本身就是新闻源**

我跟 Claude Code 说：

> 再帮我搜三轮，专门补一手源——论文聚合、coding agent 类、官方公司 blog 各一条 query，你想内容然后跑。

收获：

- **研究类金矿**：[huggingface.co/papers](https://huggingface.co/papers)——HuggingFace 自己做的每日论文摘要页
- **Agent / Coding 类**：返回的全是 SEO listicle，没有真正的一手源——这一类的真一手源就是 [latent.space](https://latent.space/) 和 [simonwillison.net](https://simonwillison.net/)，已经在列表里了，跳过
- **官方 blog 类**：[anthropic.com](https://anthropic.com/)、[openai.com](https://openai.com/)、[deepmind.google](https://deepmind.google/)、[blog.google](https://blog.google/) 都命中

5 个新候选 Map 一遍，**只有 1 个直接成功**：

- ✅ [openai.com](https://openai.com/)：返回 /index/the-five-ai-value-models... 这种真实 news 页
- ⚠️ [anthropic.com](https://anthropic.com/) **/** [huggingface.co](https://huggingface.co/) **/** [deepmind.google](https://deepmind.google/) **/** [blog.google](https://blog.google/)：全部 Map 落到导航菜单

为什么大站会翻车？

因为 Map 的工作机制是「从入口 URL 出发，按链接图遍历」。你把 [anthropic.com](https://anthropic.com/) 当入口，它就给你整个站的导航骨架——/careers、/about、/claude/haiku 全在里面。**Map 不知道你要的是 /news/\***。

这时候 filter 参数派上用场——传一个正则，只保留匹配该路径的 URL。先肉眼看一眼真实文章 URL 长啥样，然后写 filter。

我跟 Claude Code 说：

> 翻车那几个站再想想办法，我要的不是导航菜单，是真文章。具体我想要的是：anthropic.com 我只要 news 下的新闻稿 [huggingface.co](https://huggingface.co/) 我只要 papers 那块的论文 [deepmind.google](https://deepmind.google/) 它的 blog 实际在哪你帮我查下 [blog.google](https://blog.google/) 我只要 AI 相关的板块

带 filter 重跑后，4 个站救回 3 个：

- ✅ [anthropic.com](https://anthropic.com/) + filter: /news/.\* → 50 篇真实新闻稿
- ✅ [huggingface.co/papers](https://huggingface.co/papers) + filter: /papers/.\* → 50 个论文 ID 页
- ✅ [blog.google](https://blog.google/) + filter: /innovation-and-ai/.\* → **Google AI + DeepMind 一起搞定**（DeepMind 的 blog 文章实际托管在 [blog.google](https://blog.google/) 子路径下，一个 Map 同时覆盖两个一手源）

两条经验：

1. **Map 不是按 URL 给你深度爬，是按链接图返回 URL 列表。** 入口决定从哪开始走，filter 决定筛哪些。
2. **大站必须配 filter。** 直接 Map 顶级域名等于把站点导航拉下来，没用。先看一眼真实文章 URL，再写 filter——3 行正则解决问题。

## 站点终板：10 个英文信号源

![Image](https://pbs.twimg.com/media/HG5YyOUawAAbp5v?format=jpg&name=large)

加 **4 个中文反查站**：量子位、机器之心、36kr、少数派。这 4 个**不做信号源，只用来回答「这个英文话题中文圈写过没」**。

选源这一段总共烧了约 **52 credits**（Search / Map 各阶段加调试余量）。XCrawl 注册送 1000，到这里只烧了 5%，余量还够建工作流 + 跑很久。详细账本见文末。

## 第二段：搭工作流——把 10 站接成一条工作流

信息源是灵魂，n8n 工作流是骨架，Obsidian vault 是落点。

## 现状

- **落点**：日报直接写进 Obsidian vault，打开笔记自然看见。
- **执行器**：n8n（self-host docker 起一个，拿到 API key），Claude Code 通过 REST API 操作，不用点 UI。

## 把要求一次说清楚交给 Claude

> 帮我搭一个 n8n 工作流：每天把这 10 个英文站扫一遍找新文章，每篇让 LLM 抽下标题和摘要，再拿话题去那 4 个中文站搜一下看有没有人写过，0 命中的标 🔥 排前面，最后全写进我 Obsidian vault。记得加状态记忆，别每天重复扫同一批 URL。其他细节你看着办。

剩下的它自己处理。

## 几个关键设计选择

**LLM 谁来负责？** 我以为得自己搞个 Anthropic API key 让 n8n 调 Claude——结果 XCrawl 自己包了。Scrape API 的 json.prompt 字段，传一段 prompt 进去，它内部走自己的 LLM 跑一遍页面，返回结构化 JSON 和摘要。一个 key、一个 vendor、零外挂——XCrawl 自己把「智能结构化提取」这件事干完了。

**状态记忆**：vault 同目录放一份 .seen.json，记录所有已扫过的 URL。每次跑只对未见过的 URL 进 Scrape + 反查，credit 不浪费在重复内容上。

**Cap 限速**：每天最多对 5 条新 URL 跑全套 Scrape + 反查，避免英文圈刚发 30 篇时一口气把 credit 烧光。看不过来 5 条以上的，明天接着扫。

## 工作流结构（10 个节点）

下面是 n8n UI 的流程图。

<video preload="auto" tabindex="-1" playsinline="" aria-label="Embedded video" poster="https://pbs.twimg.com/tweet_video_thumb/HG5XcTNaMAATz-F.jpg" src="https://video.twimg.com/tweet_video/HG5XcTNaMAATz-F.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

![](https://pbs.twimg.com/tweet_video_thumb/HG5XcTNaMAATz-F.jpg?name=large)

GIF

两个触发器（Schedule 每日 7:00 / Webhook 手动）汇入主工作流，数据流向不变：

- **橙色** 触发器
- **蓝色** XCrawl HTTP 调用（Map / Scrape / Search）
- **灰色** Code 节点（n8n 内嵌 JS 处理逻辑 + 状态读写）
- **绿色** 输出 markdown 文件
- **紫色** 落到 Obsidian vault

n8n 的 HTTP 节点接到多个 item 输入时**自动迭代**——Sources 输出 10 个站点配置，Map 自动跑 10 次，下游 Aggregate 用 [$input](https://x.com/search?q=%24input&src=cashtag_click).all() 一次性拿到全部响应。这条性质让循环逻辑省一半。

![Image](https://pbs.twimg.com/media/HG5Xhu3bMAA1WmP?format=jpg&name=large)

## 中间踩的坑

搭的过程不是一次到位。Claude 一边搭一边踩坑，每个一两句概括：

- **n8n 容器打不到外网**——docker iptables 链异常，容器要调 XCrawl 时发现完全出不去。Claude 切到 --network host 模式绕开 docker bridge，10 秒搞定。
- **Code 节点 sandbox 屏蔽 fs 模块**——n8n 默认不让 Code 节点读写文件。加一个环境变量 NODE\_FUNCTION\_ALLOW\_BUILTIN=fs,path 重启容器解决。
- **n8n 容器看不到 vault 路径**——容器只挂载了 /opt/n8n。Claude 在容器内的数据卷里建了个 radar-out 子目录，再在 vault 里做了个符号链接指过去——零容器重建。
- **XCrawl 的 LLM 不严格遵守自定义 schema**——返回它自己的 sections/bullets 模板。Claude 切换成 summary format（每篇返回一段英文摘要 + 完整 metadata），Code 节点自己转。
- **location: "CN" 会让 Search 直接报 fail**——XCrawl 一个反直觉的小 bug，明明搜中文站却必须设 location: "US"。
- **Search 用 "完整标题" 加 site:** 因 query 太具体永远 0 命中——改成不加引号的关键词 + site: 过滤多个中文域名。
- **同时跑 5 个 Scrape 触发 XCrawl 限流**——HTTP 节点加 batching batchSize=1, batchInterval=1500ms，串行跑稳定。
- **偶尔页面 metadata 抓不全**（无 title）——Score 节点直接丢弃残缺条目，不污染日报。

每个坑都不超过两句——细节交给 Claude，我只看跑没跑通。

## 跑通后真实日报长这样

![Image](https://pbs.twimg.com/media/HG5XkCAa8AAE0c5?format=jpg&name=large)

5 篇里 3 篇标 🔥 信息差，DeepSeek V4 和 Shopify 中文圈已经写烂（10 命中），自动从 TOP 名单里剔除——**这就是工作流的价值**。打开 Obsidian 看到 TOP 3 就知道今天写哪条

中文圈反查不够准的话（比如 GPT 5.5 真的 0 命中可能是因为标题太具体而非真信息差），打开原文确认 30 秒搞定。

## 现在每天打开 vault 我做的事

1. 打开 daily-ai-radar/<日期>.md 看 TOP 信息差选题
2. 选定一条想写的，让 Claude Code 调 XCrawl Scrape 把英文原文全文抓下来
3. 让 Claude Code 出中文版大纲——视角、钩子、目标受众
4. 我自己补血肉、加个人观点、改口吻

整个流程从「打开屏幕想找选题」到「定下今天写哪条」，**5 分钟内完成**。换之前是 1 个多小时的手动刷英文圈。

## Credit 账本最终版

整个项目（选源 + 搭工作流 + 多次实测）总消耗：

![Image](https://pbs.twimg.com/media/HG5XmeqakAAzjBQ?format=png&name=large)

XCrawl 注册送 1000，烧了 12%。

**工作流稳定运行后的日烧量**预估：

![Image](https://pbs.twimg.com/media/HG5XoZGagAASYHT?format=jpg&name=large)

剩 880 credits → 撑 **19 天** 自动跑。如果 cap 提到每天 15 篇，撑 7 天左右。免费额度跑完前完全够攒一周料 + 写续篇。

下面是我跑测试，加跑一次 Demo 后的剩余：

![Image](https://pbs.twimg.com/media/HG5XrIlbEAAguxe?format=jpg&name=large)

## 顺手得到的几条经验

写到最后，整个项目（选源 + v1 + v2）攒下来的经验，挑十条值得记的——既适用于这个工作流，也适用于任何"用 AI 工具替你干活"的场景：

**关于选源**

1. **凭直觉列名单一定漏。** 你以为对一个圈子熟，让工具帮你扫一遍才知道漏了多少。Import AI、Superhuman 我之前都不知道。
2. **名气大不等于能爬。** [tldr.tech](https://tldr.tech/) 实测被反爬挡，XCrawl 不硬上——这恰好是合规工具的体面之处，挡了就跳，不触红线。
3. **大站必须配 filter。** Map 顶级域名只拿到导航骨架，3 行正则锁定真实文章路径就解决。

**关于工具流程**

1. **Search → Map → Scrape 这样 credit 烧得最省。** Search 发现候选，Map 验证可爬性，Scrape 抓正文，三步各司其职。
2. **试爬阶段必须真跑别脑补。** 1 credit 的真实调用胜过 10 分钟纸上推演——The Batch、Medium 我以为能爬，实测才发现一个落到导航、一个噪音太大。

**关于 self-host n8n**

1. **self-host 工具有四个标准雷区**：容器网络配置、Code 节点 sandbox、文件挂载、触发器选择。每个都不长，绕过去就好，但纸上推演看不到。
2. **rate limit 用 batching，不要堆并发。** n8n HTTP 节点自带 batchSize: 1, batchInterval: 1500ms 配置，串行调外部 API 比并发稳。

**关于 LLM 集成**

1. **LLM 不严格遵守自定义 schema。** 与其跟它较劲，不如退到工具内置的固定 format + 在 Code 节点里自己转。XCrawl 自己包了 LLM，省了一份 API key 和一份心。
2. **API 的反直觉 bug 要实测发现。** XCrawl location: "CN" 会让 Search 失败这种事文档不会写，跑出来才知道。

**关于持续运行**

1. **状态记忆决定 credit 寿命。** 没 .seen.json 等 = 每天重复消费同一批 URL，烧 free tier 烧得最冤。

## 写在最后

信息差不会消失，只会越拉越大——AI 演化越快，中英之间的时差越值钱。

**做 AI 内容的人，本质上在做时差套利**。手动刷追不上、肉眼挑挑不准，但工作流可以。它每天 7:00 替你刷一轮、抽出来、排好序，你打开 Obsidian 就是当天的最新的素材库，直接选直接发。

这篇文章本身，是这套工作流的副产品——XCrawl 给我搬运话题、Claude Code 帮我蒸馏钩子、n8n 替我每日推送日报，挑出来的一条就是这篇文章。

XCrawl 把"读网页"这件事拆成 Search / Map / Scrape 三个稳定的 API，配上住宅代理池 + LLM 结构化提取，**把一个内容创作者用得起的工具变成现实**——不用自己买代理、不用维护服务器、按 credits 计费。工作流正在跑，文章发完它还在跑。关键是，并不贵，1000 积分几份送的都能用很久，很够用了。

## 复刻清单（给想自己搭的人）

- **XCrawl**：如果你准备自己搭，先从 [这个入口注册 XCrawl](https://xcrawl.com/?keyword=bqczfsv6)。免费 1000 credits 基本够你把本文流程完整跑通；注册完再去看 [Skills 仓库](https://github.com/xcrawl-api/xcrawl-skills) 和 [中文文档](https://docs.xcrawl.com/zh/doc/developer-guides/openclaw/)
- **Claude Code**：装好 xcrawl-skills，跟它说话就能调 Map / Scrape / Search
- **n8n**：self-host docker 一键起，启用 NODE\_FUNCTION\_ALLOW\_BUILTIN=fs,path 让 Code 节点能写文件
- **n8n-cli**（可选）：让 Claude Code 通过命令行直接操作 n8n，不用点 UI
- **Obsidian vault**：vault 里新建 daily-ai-radar/ 目录，把 n8n 输出 symlink 过来，加进 .gitignore

## 关联笔记

- 信息流自动化：[[给AI配一个邮箱，我做了一个AI Agent 的 7×24 小时全域情报中枢]]
- 内容 IP：[[AI时代做个人IP的底层逻辑：不是打造人设，而是构建渠道系统]]
- 个人知识层：[[AI Knowledge Layer (and why your agents are useless without it)]]、[[LLM Knowledge Bases  Post by @karpathy on X]]
- 已关联成稿：[[Some Notes on AI - 博客]]、[[AI Knowledge Layer - 智能体废物版]]
