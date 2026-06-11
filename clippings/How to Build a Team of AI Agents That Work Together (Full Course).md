---
title: "How to Build a Team of AI Agents That Work Together (Full Course)"
source: "https://x.com/eng_khairallah1/status/2045430911257432225?s=46&t=ydzhjLSB0w4reaEpbYJKaQ"
author:
  - "[[@eng_khairallah1]]"
published: 2026-04-18
created: 2026-04-28
description: "One agent is useful. A team of agents is a competitive advantage.Save this :)A single AI agent can research, or write, or analyze, or code. ..."
tags:
  - "clippings"
---
![图像](https://pbs.twimg.com/media/HGJQBBVaAAAi5k-?format=jpg&name=large)

One agent is useful. A team of agents is a competitive advantage.

Save this :)

A single AI agent can research, or write, or analyze, or code. But it cannot do all of these things well simultaneously. Just like a single employee who tries to handle research, writing, sales, and customer support will do all of them poorly.

**The solution is the same solution humans figured out centuries ago: specialization.**

Instead of one overloaded agent, you build a team. A research agent that only researches. A writing agent that only writes. An analysis agent that only analyzes. A coordinator agent that manages the team, assigns tasks, and assembles the final output.

Each agent is focused. Each agent is excellent at its specific job. Together they produce work that no single agent could match.

This is called **multi-agent orchestration** and it is the architecture behind the most powerful AI systems being built right now. Customer support platforms, research systems, content engines, and business automation pipelines all use multi-agent teams at their core.

This course teaches you how to design, build, and deploy your own.

# The Architecture: Hub and Spoke

Every effective multi-agent system follows the same fundamental pattern: hub and spoke.

**The hub (coordinator agent)** sits at the center. It receives the overall goal from the user. It decomposes the goal into subtasks. It decides which specialist agent handles each subtask. It passes context between specialists. It assembles the final output from all the pieces.

**The spokes (specialist agents)** are focused experts. Each one has a defined role, a small set of tools optimized for that role, and a system prompt that constrains it to its specialty.

**All communication flows through the coordinator.** Specialists never talk to each other directly. The coordinator is the single point of routing, quality control, and assembly.

This architecture has massive advantages. Each specialist stays focused - reducing errors from context overload. Specialists can be developed and tested independently. You can swap out or upgrade individual specialists without rebuilding the system. The coordinator provides a single point of observability for debugging and monitoring.

# The Critical Rule Everyone Violates

I cannot emphasize this enough because it is the single most common bug in multi-agent systems.

**Specialist agents do NOT automatically inherit the coordinator's conversation history.**

Let me say that more directly. When the coordinator spawns a specialist, the specialist starts with a blank context. It knows nothing. It has not read the conversation history. It has not seen what other specialists produced. It has zero awareness of anything except what you explicitly include in its prompt.

Most people assume that because the coordinator knows everything, the specialist must also know everything. It does not. If the coordinator gathered research data and wants the writing specialist to turn it into a report, the coordinator must include all the research data in the writing specialist's prompt. If it just says "write the report based on our research," the writing specialist has no idea what research was done.

```python
# WRONG — specialist has no context
writer_prompt = "Write a market analysis report based on the research."

# RIGHT — all context passed explicitly
writer_prompt = f"""You are a professional report writer.

Write a market analysis report using the research findings below.

RESEARCH FINDINGS:
{research_data}

KEY STATISTICS:
{statistics}

COMPETITOR ANALYSIS:
{competitor_data}

FORMAT: Executive summary (3 sentences), then 5 sections with headers, 
each 2-3 paragraphs. Professional tone. Cite specific numbers from 
the research.

AUDIENCE: C-level executives who will read this in under 10 minutes.
"""
```

The second version is longer. It is also the only version that works. Every piece of context the specialist needs must be explicitly included. No exceptions.

# Building Your First Multi-Agent Team: The Research and Report System

Let me walk you through building a complete multi-agent team. This system takes a research question and produces a comprehensive, well-written, fact-checked report.

**The team:**

Agent 1: Research Specialist - searches for information, extracts key facts, and compiles raw research data.

Agent 2: Analyst Specialist - takes raw research data, identifies patterns, draws conclusions, and spots contradictions between sources.

Agent 3: Writer Specialist - takes analyzed data and produces a polished, structured report in a defined format and voice.

Agent 4: Reviewer Specialist - reads the finished report, checks for accuracy against the raw research, identifies weak claims, and suggests improvements.

Agent 0: Coordinator - manages the entire workflow.

**The coordinator's workflow:**

```markdown
Step 1: Receive the research question from the user.
Step 2: Decompose the question into 3-5 sub-questions that together 
        fully cover the topic.
Step 3: Send each sub-question to the Research Specialist.
Step 4: Compile all research findings.
Step 5: Send compiled findings to the Analyst Specialist.
Step 6: Send analysis + research to the Writer Specialist.
Step 7: Send the draft report + original research to the 
        Reviewer Specialist.
Step 8: If the Reviewer flags issues: send the flagged sections 
        back to the Writer for revision.
Step 9: Deliver the final report to the user.
```

**Each specialist has a focused system prompt:**

Research Specialist:

```markdown
You are a research specialist. Your only job is to find accurate, 
current information on the topic you are given.

For each piece of information:
- Note the source
- Rate your confidence (high/medium/low)
- Flag if the information might be outdated

Return your findings as a structured list of facts with sources 
and confidence ratings. Do not analyze. Do not write prose. 
Just find and organize facts.
```

Analyst Specialist:

```markdown
You are a data analyst. Your only job is to analyze research 
findings and extract insights.

Given raw research data:
- Identify the 3-5 most important patterns
- Note contradictions between sources
- Flag claims that lack sufficient evidence
- Draw conclusions supported by the data

Do not write a final report. Return structured analysis that a 
writer can turn into polished prose.
```

Writer Specialist:

```markdown
You are a professional report writer. Your only job is to turn 
analyzed data into a polished, readable report.

Given analysis and supporting data:
- Write in clear, professional prose
- Structure with an executive summary followed by detailed sections
- Cite specific numbers and sources throughout
- Make the report scannable — a reader should grasp key points 
  in under 3 minutes

Do not perform new research. Do not change the conclusions from 
the analysis. Only write.
```

Reviewer Specialist:

```markdown
You are a quality reviewer. Your only job is to check the 
finished report against the original research.

Check for:
- Claims in the report not supported by the research data
- Important findings from the research that the report omits
- Logical inconsistencies or weak reasoning
- Accuracy of all numbers and statistics
- Clarity and readability issues

For each issue found: quote the problem, explain what is wrong, 
and suggest a specific fix. If the report is solid, say so.
```

**Why this team produces better output than a single agent:**

The research agent goes deep on finding information - it is not distracted by having to write a report at the same time. The analyst focuses purely on patterns - not on finding information or writing prose. The writer focuses purely on quality prose - not on doing research or analysis. The reviewer catches mistakes that the writer missed because reviewing is its entire job.

Each agent does one thing well. The coordinator ensures the pieces fit together. The result is consistently higher quality than asking one agent to do everything.

# Designing Your Own Multi-Agent Teams

The research and report team is just one configuration. You can build multi-agent teams for any complex workflow.

**The Content Team:**

Researcher → Outline Architect → Draft Writer → Editor → Formatter

Takes a topic and produces polished, multi-format content.

**The Customer Support Team:**

Classifier → Knowledge Base Searcher → Response Drafter → Quality Checker

Handles support tickets with multiple verification layers.

**The Business Analysis Team:**

Data Collector → Trend Analyzer → Risk Assessor → Recommendation Writer

Takes raw business data and produces actionable strategic recommendations.

**The design principles are always the same:**

Each agent has ONE clear responsibility. Each agent has a focused set of tools (3 to 5 maximum). All communication flows through the coordinator. Context is passed explicitly between agents - never assumed. The coordinator validates output at each stage before passing to the next agent.

# The Three Failure Modes (And How to Prevent Them)

**Failure 1: Narrow decomposition.**

The coordinator decomposes "impact of AI on industries" into only software and healthcare subtopics, missing finance, education, manufacturing, media, and legal entirely.

**Prevention:** Instruct the coordinator to enumerate the full scope before decomposing. Add a self-check step: "Review your decomposition. Have you covered all major aspects of this topic? If any significant area is missing, add it."

**Failure 2: Lost context.**

Information discovered by the research agent never reaches the writing agent because the coordinator did not pass it along.

**Prevention:** The coordinator must include all prior agent outputs in each subsequent agent's prompt. Build explicit context-passing into the coordinator's workflow.

**Failure 3: Quality degradation through telephone effect.**

Each agent subtly changes or loses nuance from the previous agent's output. By the time information passes through four agents, important details have been diluted.

**Prevention:** Include the original source data at every stage - not just the previous agent's output. The writer should receive the raw research AND the analysis, not just the analysis alone.

# The Bottom Line

Single agents are useful. Multi-agent teams are powerful.

The architecture is straightforward: a coordinator manages specialists, each specialist does one thing well, all context is passed explicitly, and the coordinator assembles the final output.

Build your first team this week. Start with the research and report configuration. Test it with a real research question. Observe how the quality compares to asking a single agent to do everything.

**Once you experience the quality difference, you will never go back to single-agent workflows for complex tasks.**

**The future of AI is not one agent doing everything. It is teams of agents doing everything well.**

**Follow me** [@eng\_khairallah1](https://x.com/@eng_khairallah1) **for more agent architecture guides, orchestration patterns, and building systems.**

**hope this was useful for you, Khairallah** **❤️**

## 关联笔记

- 架构选择：[[Sub-Agents vs Agent Teams The Architecture Decision That Changes Everything]]、[[同步阻塞 vs 异步编排：Hermes  Delegate 与 OpenClaw 多 Agent 机制深度实战对比]]
- Harness 底座：[[The Anatomy of an Agent Harness]]
- 业务自动化延伸：[[How to Build AI Workflows That Run Your Entire Business on Autopilot (Full Course)]]
