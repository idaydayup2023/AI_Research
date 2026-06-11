---
title: "How we used Gemini to build Google I/O 2026"
source: "Google Blog"
author: "Marvin Chow"
published: 2026-06-01
created: 2026-06-02
description: "Google I/O 2026 制作复盘：Google 团队如何把 Gemini、Nano Banana、Gemini Omni、Lyria、Antigravity、Flutter/Firebase 等工具用于短片、视觉系统、互动体验、生成式 UI 和现场个性化物料。"
tags:
  - "clippings"
  - "google"
  - "gemini"
  - "ai-workflow"
  - "content-production"
  - "creative-ops"
---

# How we used Gemini to build Google I/O 2026

## 原文信息

- 原文：<https://blog.google/innovation-and-ai/technology/ai/io-2026-google-ai/>
- 来源：Google Blog / Innovation & AI
- 作者：Marvin Chow, VP, Marketing
- 发布时间：2026-06-01
- 入库时间：2026-06-02

## 核心提取

这篇文章不是研究论文，也不是模型能力发布，而是 Google 对 I/O 2026 现场内容与体验制作的官方复盘。它的价值不在“用了哪些 Google 产品”，而在几个可复用的生成式内容生产模式：

- 先保留人工可控的原始表演、构图和参考资产，再让生成模型做风格化、扩展和合成。
- 为了稳定输出，不只写 prompt，而是建立批量测试和一致性校验工具。
- 视觉系统不是一次生成定稿，而是把历史品牌指南、历年活动复盘、微实验、反馈回灌和参考表组合成迭代流程。
- 互动体验把生成式模型放进确定性前后端框架里，由 WebGL、Flutter、Firebase、Cloud Functions、Firestore 和监控链路承接实时体验。
- 现场个性化物料采用“用户选择 prompt 组合 + 后端融合 + 固定几何/版式约束 + 即时打印”的产品化流程。

## 中文译读

文章的表层叙事是“Google 用自己的 AI 工具制作 I/O”。更值得拆的是它没有把 AI 当成一键生成器，而是把 AI 放进 production pipeline。

短片制作里，团队先用木偶表演和简单 3D 动画锁定角色表演、镜头和节奏，再用 Nano Banana 生成风格化首帧；为了保持帧间一致，团队在 Google AI Studio 内搭建自定义测试工具，用于批量检查首帧匹配，最后再用 Gemini Omni 和实验模型合成序列。这里的关键不是模型名字，而是“人工控制底稿 + 生成式风格化 + 批量一致性门”的组合。

品牌视觉系统里，团队把过去的品牌指南和五年 I/O 复盘喂给 Gemini，早期结果不理想后改成微实验：生成候选、反馈回灌、探索图标样式，最终沉淀成能跨 keynote、现场标识和数字产品复用的视觉表达。这说明品牌类 AI workflow 的核心不是 prompt，而是 reference corpus、反馈循环和跨载体一致性。

互动体验里，Jellectronica 用 YOLO8 追踪水母运动，再用 Lyria 3 Pro 把运动信号映射成音乐参数；Infinite Scaler 用 Nano Banana 生成 sprite sheet，再从前景元素生成 normal、roughness、emission maps，把 2D 生成图映射到 WebGL 3D 场景；咖啡弹窗体验用 Flutter、生成式 UI、A2UI、Firebase 和模型后端构建实时自适应界面。

这些案例共同说明：当 AI 进入内容生产和活动体验，它需要被包在一套稳定工程流程里。创意来自模型和人共同探索，但交付依赖参考资产、模板约束、批量测试、前后端框架和现场运维。

## 可复用观点

- 生成式内容生产的第一道质量门是 reference control：先固定意图、构图、几何、品牌边界或交互约束，再让模型生成。
- 一致性不是靠一句“保持一致”解决的，而要靠 reference sheet、批量样张、像素/风格对照、固定模板和自动校验。
- 现场体验类 AI 产品不能只看生成质量，还要看延迟、失败兜底、监控、打印/展示/交互硬件和前端状态管理。
- “AI 帮内容团队提效”的成熟形态不是替代创意，而是把低层变体生产、素材融合、风格探索和重复执行交给 pipeline。
- 对公众号自动化也有迁移价值：封面、配图、标题实验和内容选题不应只靠单次 prompt，而应拆成 reference brief、候选生成、约束校验和人工/规则门。

## 可加工为公众号角度

- 暂不成稿：这篇材料营销属性明显，且公众号近期主线集中在 Agent Harness、接口层、记忆和质量门。如果单独成稿，容易变成“Google 如何用 AI 做 I/O”的案例摘要。
- 可后续合并方向：当知识库里积累更多“AI 内容生产 pipeline / 创意工作流 / 生成式 UI 交付”案例后，可写成“AI 创意生产不是一键生成，而是参考资产和一致性质量门”的观点稿。
- 可补充旧稿：可补充 [[2026-05-12 AI不是效率工具，是心力分配工具]] 和 [[AI 创作者的选题外挂：中英信息差工作流]]，强调内容生产的 AI 化不是省掉人，而是把人从重复变体和一致性检查里释放出来。

## 关联笔记

- [[AI 创作者的选题外挂：中英信息差工作流]]
- [[AI时代做个人IP的底层逻辑：不是打造人设，而是构建渠道系统]]
- [[Some Notes on AI]]
- [[Gemini 3.5 frontier intelligence with action]]
- [[Reimagining the mouse pointer for the AI era]]
- [[2026-05-12 AI不是效率工具，是心力分配工具]]
