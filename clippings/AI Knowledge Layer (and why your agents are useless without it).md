---
title: "AI Knowledge Layer (and why your agents are useless without it)"
source: "https://x.com/shannholmberg/status/2044111115878326444?s=46&t=ydzhjLSB0w4reaEpbYJKaQ"
author:
  - "[[@shannholmberg]]"
published: 2026-04-03
created: 2026-04-28
description: "this article gives you a two-layer system that makes every AI agent you run smarter. 20 minute setup, gets better every day, fully open sour..."
tags:
  - "clippings"
---
![Image](https://pbs.twimg.com/media/HF4hFQiasAIBY8-?format=jpg&name=large)

this article gives you a two-layer system that makes every AI agent you run smarter. 20 minute setup, gets better every day, fully open source.

karpathy recently talked about shifting most of his token spend from code to knowledge management.

the post resonated because it named a problem everyone feels: your agents don't know you. every conversation starts from zero. you re-explain your business, your voice, your goals, your context, and the output is generic because the input has no memory.

I took his pattern, tested multiple approaches over two weeks, simplified it down to the one that works, and loaded it with my own data. notes, ideas, tweets, articles, bookmarks. the agent compiled 230+ structured wiki pages from that, cross-linked with concepts, entities, and sources I can query anytime.

![Image](https://pbs.twimg.com/media/HF4alrCXkAAAEYO?format=png&name=large)

this article covers what the knowledge layer is, how to build one for content creation, for a company, and for your personal life. the framework is open source and the setup takes 20 minutes.

> Apr 3
> 
> LLM Knowledge Bases Something I'm finding very useful recently: using LLMs to build personal knowledge bases for various topics of research interest. In this way, a large fraction of my recent token throughput is going less into manipulating code, and more into manipulating

## what is the AI knowledge layer

the AI knowledge layer is the infrastructure that sits between you and your agents. it's what they read before they do anything. without it, they guess. with it, they know.

it has two parts:

1. **the knowledge base layer (KBL)** is dynamic. you dump raw sources into a folder: tweets, articles, bookmarks, PDFs, notes, voice memos. an AI agent reads all of it, classifies each source by type, builds structured wiki pages with cross-references, and maintains a master index with one-line summaries for fast scanning. every question you ask gets filed back as a new page. the wiki gets richer over time.
2. **the brand foundation (BF)** is static. this is the layer only you edit. your voice rules, your visual style, your positioning, your audience definition, the words you never use. agents read it before producing anything, but they never rewrite it. it's the anchor that keeps everything sounding like you even when agents do the work.

here's how the two layers sit in the system:

```text
+-------------------------------------------------------+
|                    YOUR AGENTS                         |
|  (writer, researcher, strategist, analyst)             |
+---------------------------+---------------------------+
      |  reads from                  |  reads from
      v                              v
+------------------+   +-------------------+
|  KNOWLEDGE BASE  |   | BRAND FOUNDATION  |
|  LAYER (KBL)     |   | (BF)              |
|                  |   |                   |
|  dynamic         |   |  static           |
|  agent-maintained|   |  human-edited     |
|  grows over time |   |  your voice, your |
|  wiki pages,     |   |  rules, your      |
|  sources, index  |   |  positioning      |
+--------+---------+   +-------------------+
      |
compiles from
      |
+--------+---------+
|     raw/ inbox    |
|  tweets, articles |
|  bookmarks, PDFs  |
|  notes, ideas     |
+-------------------+
```

**why not RAG?** RAG re-derives answers at query time by chunking documents and searching. the knowledge layer compiles once, cross-references, and keeps current. at around 100 articles, karpathy found the compiled approach outperforms RAG for Q&A. graphify measured **71.5x fewer tokens per query compared to searching raw files.**

the evolution went in three phases:

1. one-shot RAG (2020-2023)
2. agentic RAG with multi-hop retrieval (2023-2024)
3. and now context engineering where the agent builds its own context from multiple sources (2025+). the knowledge layer is the infrastructure for that third phase.

![Image](https://pbs.twimg.com/media/HF4BhRkWEAArCV1?format=jpg&name=large)

## why most people won't build one

the same reason most people won't meal prep on Sunday. it takes an hour of upfront work to save ten hours over the week. most people would rather complain about bad AI output than spend 20 minutes setting up the system that fixes it.

90% of people using AI are doing the same thing right now: prompting, accepting, shipping. with no judgment and no taste.

the knowledge layer is how you leave that 90%. it encodes your taste, your data, your patterns so agents produce output that sounds like you wrote it instead of something that could be on any AI slop.

![Image](https://pbs.twimg.com/media/HF4heIiWgAA3s4z?format=jpg&name=large)

the friction is real though, you need to curate what goes in. if something doesn't feel 80%+ relevant to what you're working on, skip it.

high-signal inputs make the output better. fill it with noise and you get noise back.

## for content creators and personal brands

this is where I started. I run an AI marketing content account and an agency, and I needed my agents to know what I've written, what performed, and what my voice sounds like.

I built a framework called LLM Wikid and open sourced it (learn how to implement it further down). here's what happened when I loaded my own data:

- I started by sitting down and writing out everything on my mind: notes on projects I'm running, half-formed product ideas, observations about what's working in my niche, thoughts on where AI marketing is headed. raw thinking, no focus on structure.
- then I dumped my X archive (87 tweets from 6 weeks), three published articles, and all my bookmarks. the agent processed everything and turned it into 15 themed source pages, 14 concept pages, 11 entity pages, with 100+ cross-links between them.
- I then pulled 197 bookmarks via the X API, the agent downloaded 81 images and transcribed 49 videos from those bookmarks, analyzed the visual content, and wove it all into the wiki. my notes, my ideas, my tweets, my bookmarks, my articles, all connected and searchable.

![Image](https://pbs.twimg.com/media/HF4CT69XkAAGGNT?format=png&name=large)

image of my Obsidian graph

## the two layers in practice

**the KBL (knowledge base layer) holds everything that grows:** sources classified by type (transcript, article, tweet, paper), cross-referenced with wikilinks, indexed with TLDRs.

when I need to write about a topic, I run /wiki-query and get a cited answer from my own data. that answer gets filed back as a new page, so the next query is richer.

the folder structure looks like this:

```markdown
my-wiki/                                                                                                                              
    raw/                                                                                                                              
      clippings/                 # obsidian web clipper drops here                                                                      
      ideas/                     # notes, brainstorms, half-formed thoughts                                                             
      bookmarks/                 # saved tweets, threads, tools                                                                         
      articles/                  # your own published content                                                                           
      papers/                    # PDFs, research
      x-archive/                 # your X/Twitter export                                                                                
      assets/images/             # downloaded media from sources     
    wiki/
      index.md                   # master index with TLDRs                                                                              
      log.md                     # append-only changelog
      concepts/                  # ideas, frameworks, topics                                                                            
        ai-marketing.md                                              
        distribution-moat.md
      entities/                  # people, companies, tools
        karpathy.md                                                                                                                     
        claude-superpowers.md
      sources/                   # one summary per raw source                                                                           
        graphify-2026.md                                             
      outputs/                   # filed answers to queries
      sops/                      # repeatable processes
      syntheses/                 # cross-cutting analysis
    templates/                   # page type starters                                                                                   
    CLAUDE.md                    # the schema that controls everything
```

notice the clippings/ folder at the top of raw/. that's where Obsidian Web Clipper drops everything.

you install the browser extension, and whenever you're browsing X, reading an article, checking a GitHub repo, or scrolling Reddit, you clip it with one click. it saves to raw/clippings/ with the source URL in the frontmatter.

<video preload="auto" tabindex="-1" playsinline="" aria-label="Embedded video" poster="https://pbs.twimg.com/tweet_video_thumb/HF4LUKKasAUwCeh.jpg" src="https://video.twimg.com/tweet_video/HF4LUKKasAUwCeh.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

![](https://pbs.twimg.com/tweet_video_thumb/HF4LUKKasAUwCeh.jpg?name=large)

GIF

next time you run /wiki-ingest, the agent reads the URL, detects what type of source it is (tweet, article, PDF, video), sorts it to the right subfolder, fetches the full content, downloads any images, and compiles it into the wiki.

you clip during the day, ingest processes it overnight, you wake up to a richer knowledge base.

**the BF (brand foundation) holds what stays constant:** my AI tells document (a list of every banned word, phrase, and structure that flags as AI), my visual content style guide (terminal screenshots over beautiful backgrounds, color-coded flowcharts), and my voice profile. every agent reads these before producing anything.

## how agents plug into this

a writer agent reads the brand foundation for voice, queries the wiki for topic research, and checks content performance data to pick the right format.

![Image](https://pbs.twimg.com/media/HF4L6h9W4AAIeeh?format=jpg&name=large)

a researcher agent monitors X, Reddit, YouTube for signals, feeds new sources into the raw folder, and expands wiki topics. a content strategist cross-references what's performing in the niche against existing coverage and identifies gaps.

![Image](https://pbs.twimg.com/media/HF4MBp6XsAAsF0h?format=jpg&name=large)

**each agent is only as good as the knowledge layer it reads from.**

the same agent with a thin knowledge base produces slop. the same agent reading 200+ structured wiki pages with your voice, your data, and your performance history produces work that sounds like you.

I tested this directly. Helena, an AI marketing tool, can analyze a brand from a URL alone and produces accurate brand voice profiles. but the content it generates from that analysis was, in my experience, "a whole month of marketing slop in a minute." brand analysis alone isn't enough. you need the knowledge layer on top of it.

> Mar 31
> 
> honest first impression of Helena, the "autonomous AI marketer" you start by giving it your website URL and it fetches your brand, analyzes competitors, and generates a full brand knowledge base. the brand read was accurate it generates all of this from your URL alone: > brand

## how this maps to the 5 levels of ai

this connects to the 5 levels of AI marketing I wrote about earlier:

- level 1: custom prompts (no knowledge layer)
- level 2: manual skills (thin knowledge layer)
- level 3: skills + brand foundation (BF layer added)
- level 4: agents with skills reading from compiled knowledge (KBL + BF working together)
- level 5: autonomous agent teams with full compounding knowledge layer

most people sit at level 1 or 2. the knowledge layer is what gets you to 4 and 5.

> Mar 17

## the distribution angle

vibe coding solved building. everyone can ship an app in 48 hours. distribution is still hard.

the knowledge layer is how you compound distribution intelligence. every content insight you capture, every bookmark you analyze, every performance metric you track makes the next piece of content better-targeted.

a scheduled trigger runs ingest every morning on whatever you clipped the day before. your distribution gets smarter while you sleep.

there's also a service angle. setting up someone's knowledge layer is a $1,500-3,000 service with a $300-500 monthly retainer.

ten clients is $56,800 in year one. if you're a content creator or agency owner, this is a productizable skill.

## for companies and projects

the same architecture works at company scale.

the difference is that multiple people's agents read from and write to the same knowledge layer, and the layer holds operational knowledge, not just content knowledge.

![Image](https://pbs.twimg.com/media/HF4OmqrXIAIVjyt?format=jpg&name=large)

we run this at [@EspressioAI](https://x.com/@EspressioAI) and at [@LunarStrategy](https://x.com/@LunarStrategy). at Espressio, the knowledge base holds client delivery patterns, agent architecture templates, and internal SOPs.

at Lunar Strategy, it holds campaign playbooks, client research, and content frameworks. new team members point their agent at the knowledge base and they're productive from day one instead of spending weeks learning the undocumented way things work.

Eric Osiu rolled out something similar across his entire company. every employee has a role-tuned AI agent connected to a shared central brain. his framing:

> "a personal assistant has a ceiling. the unlock is role-tuned agents sharing context through a central brain."

when sales closes a deal, the account manager's agent already has the handoff. when content performs, the sales agent adjusts outreach angles automatically.

![Image](https://pbs.twimg.com/media/HF4P_uCWgAkdAr8?format=png&name=large)

screenshot from Erics article, credits to him.

no information falls through cracks because the knowledge layer catches everything.

> Apr 9

## how it scales

one person (personal wiki) to small team (5-10 people sharing one knowledge base) to organization (50+ people with role-tuned agents reading from compiled intelligence). the pattern is the same at every level:

1. raw sources go in
2. agents compile structured pages
3. cross-references build automatically
4. humans validate through exploration gates (every page starts as unreviewed, only a human marks it as confirmed)
5. git syncs everything so the knowledge is version-controlled and reversible

Cody Schneider built a 10-capability GTM agent swarm for local service businesses.

> Apr 11
> 
> AI agents for marketing are here and it's gonna totally change how you're gonna grow your  business and I'm going to show you how to build your first marketing agent with Hermes in the next 10 minutes These basically fully functioning employees that you can delegate work to

the foundation of his system is a data warehouse holding all business data. his words:

> "without it, agents can't make good decisions."

he calls it a data warehouse.

Eric Osiu calls it a shared brain. karpathy calls it an LLM wiki.

**the name doesn't matter. agents need compiled, structured knowledge to do useful work.**

the extreme version of this is what Greg Isenberg calls "ambient businesses," companies that run primarily on agents where the owner checks in every few days.

![Image](https://pbs.twimg.com/media/HF4UL04asAECU5-?format=jpg&name=large)

Medvi is the proof: $1.8 billion revenue run rate, 2 employees, zero VC. AI handles code, creative, voice, customer service. the knowledge layer is the prerequisite. without it, agents need constant human direction. with it, they operate from compiled organizational intelligence.

> Apr 3
> 
> The NYT just profiled a $1.8B revenue company with 2 employees. Medvi is a telehealth GLP-1 provider built by Matthew Gallagher, 41, from his house in LA. He launched in September 2024 with $20,000. Here are the numbers: Month 1: 300 customers Month 2: 1,300 customers 2025 full

## for your personal life

the most underrated use. the same system that tracks your content performance can track your thinking.

journal entries, book notes, podcast highlights, health metrics, goal reviews, random ideas at 2am.

all of it goes into raw/. the agent compiles it into structured pages.

when you ask "what patterns do I see in my energy levels" or "what did I learn about productivity last quarter," you get a cited answer from your own data. that answer gets filed back, so the next question is smarter.

**the compound loop:** every question you ask makes the system richer. every source you add creates new connections. your curiosity feeds back into the quality of answers you get.

quality controls matter here more than anywhere because this is where blind trust in AI is most dangerous:

bias checks force counter-arguments and data gaps on every page. if you dump in 10 articles that all say the same thing, the wiki will note it but also flag what's missing from the picture.

the validation gate means every AI-generated page starts with explored: false. only you can mark something as reviewed. you always know what's been human-verified and what hasn't.

confidence levels tag every page as high, medium, low, or uncertain. the agent has to be honest about how well-supported its knowledge is.

**the 80/20 rule from my three moats article applies directly here:** let AI do 80% of the organization, compilation, and cross-referencing. apply your taste to the last 20%, the curation, the validation, the connections only you can see. the knowledge layer is how you encode your taste so the 80% gets better over time.

![Image](https://pbs.twimg.com/media/HF4h1RbasAMHta7?format=jpg&name=large)

## the 20-minute setup guide

this is not theoretical. the framework is open source and the setup is fast.

**step 1: clone the repo (2 minutes)**

```markdown
git clone https://github.com/shannhk/llm-wikid.git my-wiki
cd my-wiki
```

open the folder as an Obsidian vault.

**step 2: run your agent (3 minutes)**

open Claude Code (or any agent that reads markdown and runs bash) in the folder. it reads CLAUDE.md, which is the schema that controls everything:

```markdown
# CLAUDE.md (simplified)
## Directory Structure
- raw/    → messy inbox, dump anything here
- wiki/   → compiled pages, flat structure
- wiki/index.md → master index with TLDRs
## Operations
- /wiki-ingest  → process raw/ into wiki pages
- /wiki-query   → ask questions, get cited answers
- /wiki-explore → browse and validate pages
- /wiki-lint    → catch contradictions, stale content
```

the agent reads this file, understands the full schema, and scaffolds the wiki structure automatically.

**step 3: fill it up (10 minutes)**

- request your X archive from settings.
- grab the Obsidian Web Clipper extension and start clipping tweets, articles, threads worth keeping.
- sit down and write out everything on your mind for 10 minutes. dump your bookmarks in. anything that feels 80%+ relevant goes into raw/.

**step 4: run ingest (5 minutes)**

```markdown
> /wiki-ingest
```

the agent sorts your clippings, fetches full content from URLs, downloads and analyzes images, classifies each source by type, builds wiki pages with cross-references, adds counter-arguments and data gaps on every page, and updates the master index.

here's what a /wiki-query looks like in practice:

```markdown
> /wiki-query what content formats get the most bookmarks?

Reading wiki/index.md... scanning 47 TLDRs
Reading wiki/content-performance.md
Reading wiki/bookmark-analysis-march.md
Reading wiki/thread-vs-single-tweet.md

Answer:
Threads with numbered lists get 3.2x more bookmarks than
single tweets in your data. visual breakdowns (terminal
screenshots, flowcharts) averaged 847 bookmarks vs 312 for
text-only. the top 5 bookmarked posts were all either
step-by-step guides or tool comparisons.

Sources: [[content-performance]], [[bookmark-analysis-march]],
[[thread-vs-single-tweet]]

→ Filed as wiki/bookmark-formats-query.md
```

every answer gets filed back. the next query about content performance will also pull from this one.

**step 5: open the graph**

open Obsidian's graph view. your ideas, the people you follow, the tools you use, and the concepts you care about are now linked together in a visual network. start querying with /wiki-query.

![Image](https://pbs.twimg.com/media/HF4VzR_W4AA1jrW?format=png&name=large)

once the initial ingest is done, try these:

> "what content topics have I bookmarked the most in the last month?" shows your signal patterns.

> "what are the counter-arguments to \[my main thesis\]?" forces you to stress-test your thinking against what the wiki has compiled.

> "summarize everything I know about \[competitor/tool/topic\]" pulls from every source that mentions it and synthesizes a briefing.

> "what concepts in my wiki have the fewest sources?" shows where your knowledge is thin and where to research next.

each answer gets filed back. the wiki grows.

## what to do now?

set up a scheduled trigger (Claude Dispatch or cron) that runs /wiki-ingest every morning.

you clip things during the day, they get processed overnight, you wake up to a richer knowledge base.

run /wiki-lint every week or two to catch contradictions between pages, stale content, orphan pages nobody links to, and duplicate concepts under different names.

the agent fixes what it can and flags what needs your judgment.

when you hit 300+ pages, install qmd (by Tobi Lutke) for local hybrid search with BM25 + vector retrieval and LLM re-ranking. it has an MCP server so your agent can search the wiki as a native tool.

start connecting the knowledge layer to other agents. a writer agent that reads from it. a researcher that feeds into it. a content strategist that queries it. the knowledge layer is the shared brain that makes all of them useful.

## the window

karpathy's post hit 99,000+ bookmarks. graphify shipped in 48 hours and got 27,000+ more. multiple implementations went viral the same week. the demand is obvious.

most people will bookmark this, think "that's cool," and never set it up.

the ones who spend 20 minutes today will have a compounding knowledge base by next month that no search engine and no generic AI prompt can replicate. it will know your voice, your data, your patterns, and your taste.

every week you wait is a week of compounding you don't get back.

repo: [github.com/shannhk/llm-wikid](https://github.com/shannhk/llm-wikid)

> Apr 13
> 
> how marketing AI knowledge layer works every marketing team has data scattered across 15-30 tools and none of it talks to each other your CRM doesnt know what your SEO agent found yesterday. your ad platform doesnt know what your sales team heard on calls this week. your

## 关联笔记

- 已加工成稿：[[AI Knowledge Layer - 智能体废物版]]
- 理论根基：[[LLM Knowledge Bases  Post by @karpathy on X]]
- 企业版知识层：[[Connecting Agents to Decisions]]
- 工程实现旁证：[[Building a Virtual Filesystem for Mintlify's AI Assistant]]
- 内容生产工作流：[[AI 创作者的选题外挂：中英信息差工作流]]、[[给AI配一个邮箱，我做了一个AI Agent 的 7×24 小时全域情报中枢]]
