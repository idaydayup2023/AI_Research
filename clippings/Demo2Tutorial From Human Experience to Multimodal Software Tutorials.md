---
title: "Demo2Tutorial: From Human Experience to Multimodal Software Tutorials"
source: "https://arxiv.org/abs/2606.03951"
arxiv_id: "2606.03951"
authors:
  - "Zechen Bai"
  - "Zhiheng Chen"
  - "Yiqi Lin"
  - "Kevin Qinghong Lin"
  - "Difei Gao"
  - "Xiangwu Guo"
  - "Xin Wang"
  - "Mike Zheng Shou"
published: "2026-06-02"
created: "2026-06-05"
categories:
  - "cs.CV"
description: "Demo2Tutorial 把屏幕录像和交互日志蒸馏成分层任务图与图文教程，既能帮助人类学习，也能提升 GUI agent 的规划与泛化。"
tags:
  - "clippings"
  - "arxiv"
  - "skills"
  - "gui-agents"
  - "tutorials"
---

# Demo2Tutorial: From Human Experience to Multimodal Software Tutorials

## 论文信息

- arXiv：https://arxiv.org/abs/2606.03951
- 作者：Zechen Bai、Zhiheng Chen、Yiqi Lin、Kevin Qinghong Lin、Difei Gao、Xiangwu Guo、Xin Wang、Mike Zheng Shou
- 提交时间：2026-06-02
- 分类：未在当前摘要中显式列出，以 arXiv abs 页面为准

## 研究问题

大量软件操作经验以屏幕录像和交互日志形式存在，但这些原始轨迹对人类和 agent 都太粗糙，难以直接复用。论文关注的问题是：能不能把真实人类操作过程自动提炼成结构化、多模态、可教学也可执行迁移的教程资产。

## 方法概览

作者提出 Demo2Tutorial。流程分四层：先通过 recorder 采集人类真实操作，再用 multimodal action parser 重建感知、动作与意图；随后用 step planner 抽象出分层 task graph；最后由 tutorial composer 生成结构化图文教程。

这套表示不是单纯为了“更好看地生成教程”，而是把人类经验转成一种可供人和 agent 共用的程序性知识载体。

## 关键贡献

- 把原始 screen recording 和 interaction logs 变成可复用的分层任务图与教程。
- 在新 benchmark 上证明自动生成教程质量可超过人工教程和基线方法。
- 说明这种 distilled tutorial representation 不只帮助人类学习，也能改善 GUI agent 的规划与泛化。
- 把“教程”从内容产物推进成 agent capability representation。

## 与知识库主题的关系

这篇论文和 skills、artifact-first workflow、GUI agent、知识层高度相关。过去我们更多把 skill 看成 prompt、规则、脚本和 gotchas 的组合；这篇论文补了另一种资产形态：来自真实人类操作轨迹的图文教程和层级任务图。

它对现有脉络最有价值的地方在于说明：skill 的来源不一定是专家写 `SKILL.md`，也可以是从真实演示中蒸馏出来的可操作知识表示。

## 可复用观点

- 教程不只是帮助新手上手，也可以是 agent 的知识表示与规划辅助层。
- 真实人类演示比抽象规则更容易保留目标、步骤、界面状态和隐性操作顺序。
- skill 资产未来可以有两种来源：专家显式编写，以及从高质量人类操作中反向蒸馏。

## 可加工为公众号角度

- 可与 [[Lessons from building Claude Code How we use skills]]、[[Designing, Refining, and Maintaining Agent Skills at Perplexity]]、[[Introducing Gemma 4 12B a unified, encoder-free multimodal model]] 合并，写“Skill 正在从规则文档变成教程资产和安装资产”。
- 也可补强 GUI agent 方向：教程不是帮助人看懂界面，而是给 agent 提供任务图和意图压缩。
- 今天暂不成稿：角度新，但需要更多“由轨迹蒸馏 skill / tutorial / artifact”的案例来避免只写成单篇论文解读。

## 关联笔记

- [[Lessons from building Claude Code How we use skills]]
- [[Designing, Refining, and Maintaining Agent Skills at Perplexity]]
- [[Using Claude Code The Unreasonable Effectiveness of HTML]]
- [[Multi-Agent Computer Use]]

