---
title: "Gemini API File Search is now multimodal: build efficient, verifiable RAG"
source: "https://blog.google/innovation-and-ai/technology/developers-tools/expanded-gemini-api-file-search-multimodal-rag/"
author:
  - "Google"
published: 2026-05-05
created: 2026-05-12
description: "Google 扩展 Gemini API File Search，加入多模态检索、custom metadata 和 page-level citations，强化可验证 RAG。"
tags:
  - "clippings"
  - "google"
  - "rag"
  - "multimodal-retrieval"
  - "knowledge-layer"
---

# Gemini API File Search is now multimodal: build efficient, verifiable RAG

## 原文信息

- 原文：<https://blog.google/innovation-and-ai/technology/developers-tools/expanded-gemini-api-file-search-multimodal-rag/>
- 发布时间：2026-05-05
- 发布方：Google Blog

## 核心提取

Gemini API File Search 新增三类能力：多模态支持、custom metadata 和 page-level citations。它的价值不只是产品更新，而是说明主流 AI 平台正在把 RAG 从“文本向量检索”推进到“多模态、结构化、可验证的上下文层”。

这与本知识库里的知识层主题高度相关：Agent 需要的不只是更多文件，而是能在复杂资料中检索到正确片段、过滤噪音，并给出可追溯引用。

## 中文译读

### 一、RAG 正在变成多模态 memory

File Search 现在可以同时处理图片和文本。Google 用“photographic memory”来描述这一能力：应用可以用自然语言找图像资产、科学图像、工程图、架构图等，而不只依赖文件名和关键词。

这对 Agent 很关键，因为现实知识库往往不是纯文本：PDF、图表、截图、架构图、扫描件、实验图像都包含重要上下文。

### 二、Metadata 是降噪工具

文章强调 custom metadata 可以给非结构化数据打标签，比如部门、状态、版本、权限等。检索时用 metadata filter 限定范围，可以提升速度和准确率。

这与 [[AI Knowledge Layer (and why your agents are useless without it)]] 的观点一致：上下文不是越多越好，关键是把关系、范围和约束显式化。

### 三、Page-level citations 让答案可验证

Page-level citations 可以把模型答案直接连回源文件页码。这对企业 RAG、研究助手和内容生产都重要，因为用户不只要答案，还要知道答案来自哪里。

这也正好对应你的 Obsidian 工作流：自动摘录和公众号二次加工必须保留来源链接，避免版权和事实风险。

## 可复用观点

- RAG 的下一步不是塞更多文本，而是多模态、可过滤、可引用。
- Metadata 是知识库里的“控制面”，决定 Agent 能不能从正确范围取上下文。
- Citations 是让 AI 输出进入生产场景的信任基础。
- 内容生产系统也需要 page/source-level attribution，而不是只保存大段摘要。

## 可加工为公众号角度

- RAG 正在从“检索文本”升级成“可验证知识层”。
- 为什么 Agent 需要 photographic memory，但更需要 metadata 和 citations。
- 可与 [[Building a Virtual Filesystem for Mintlify's AI Assistant]]、[[AI Knowledge Layer (and why your agents are useless without it)]] 合并。

## 关联笔记

- 知识层：[[AI Knowledge Layer (and why your agents are useless without it)]]、[[LLM Knowledge Bases  Post by @karpathy on X]]
- 工程实现：[[Building a Virtual Filesystem for Mintlify's AI Assistant]]
- 检索模型：[[pplx-embed State-of-the-Art Embedding Models for Web-Scale Retrieval]]
- 内容生产工作流：[[AI 创作者的选题外挂：中英信息差工作流]]
