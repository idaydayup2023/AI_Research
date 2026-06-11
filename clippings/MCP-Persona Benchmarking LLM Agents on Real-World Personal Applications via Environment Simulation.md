---
title: "MCP-Persona: Benchmarking LLM Agents on Real-World Personal Applications via Environment Simulation"
source: "https://arxiv.org/abs/2606.02470"
arxiv_id: "2606.02470"
authors: "Wenhao Wang; Peizhi Niu; Gongyi Zou; Xiyuan Yang; Jingxing Wang; Haoting Shi; Yaxin Du; Jingyi Chai; Xianghe Pang; Shuo Tang; Yanfeng Wang; Siheng Chen"
submitted: "2026-06-01"
created: "2026-06-03"
categories:
  - "cs.AI"
description: "面向真实个人应用的 MCP agent benchmark，覆盖社交与企业协作工具，强调个性化账户和本地数据库带来的工具使用难题。"
tags:
  - "clippings"
  - "arxiv"
  - "mcp"
  - "agent-evaluation"
  - "personal-ai"
---

# MCP-Persona: Benchmarking LLM Agents on Real-World Personal Applications via Environment Simulation

## 论文信息

- arXiv：https://arxiv.org/abs/2606.02470
- 提交时间：2026-06-01
- 分类：cs.AI
- 作者：Wenhao Wang 等

## 研究问题

MCP 已经成为连接 LLM、外部数据源和工具的标准接口，但现有 benchmark 多集中在通用信息查询工具，难以评估 Agent 在个人应用中的真实困难：账户数据、社交上下文、本地数据库、企业协作工具和个性化隐私边界。

## 方法概览

论文提出 MCP-Persona，用环境模拟方式评估 Agent 在真实个人应用 MCP 工具上的表现。覆盖 Reddit、小红书、飞书、Slack 等应用场景，重点不是让 Agent 调一个通用 API，而是让它在具有个人上下文和工具约束的环境里完成任务。

## 关键贡献

- 将 MCP benchmark 从 generic information-seeking 推向 personalized tool use。
- 把个人账户、社交平台、企业协作套件纳入可模拟环境。
- 实验显示当前 SOTA agents 在个性化 MCP 工具使用上仍有明显困难。

## 与知识库主题的关系

这篇补强 [[工具与接口层（SDK / MCP / Spec）]] 和 [[知识层与个人知识库]]：MCP 不是“接上工具就好了”，真正难点在个体状态、权限、历史上下文和工具行为的组合。

它也与 [[2026-05-30 AI 记忆最危险的不是忘，而是混]] 相邻：个人应用 Agent 的风险不是缺少数据，而是不同账号、受众、历史和工具语义混用。

## 可复用观点

- MCP 的评测对象应从“工具是否可调用”升级为“个性化环境里是否能正确使用工具”。
- 个人应用 Agent 的难点不是 API 覆盖率，而是身份、上下文、权限和历史状态。
- Environment simulation 是评估个人 Agent 的必要前置，因为真实账户不能随便用作 benchmark。

## 可加工为公众号角度

- 可与 Harness-1 合并成“Agent 的状态不能都放在模型上下文里”。
- 可与 Zero Trust、个人知识库稿件合并成“个人 Agent 的第一道质量门是身份和场景隔离”。

## 关联笔记

- 已加工成稿：[[2026-06-03 把 Agent 的运行账本搬出上下文]]
- [[mcp-proto-okn Natural-language access to open scientific knowledge graphs through the Model Context Protocol]]
- [[2026-05-30 AI 记忆最危险的不是忘，而是混]]
- [[2026-06-02 Agent 的接口，不该只有工具调用]]
