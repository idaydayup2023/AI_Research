---
title: "Workflow-GYM: Towards Long-Horizon Evaluation of Computer-use Agentic Tasks in Real-World Professional Fields"
source: "https://arxiv.org/abs/2606.11042"
arxiv_id: "2606.11042"
authors: "Liya Zhu, Jingzhe Ding, Jian Zhang, Jianbo Xue, Shihao Liang, Ge Zhang, Xiang Gao, Qingshui Gu, Mailun Gao, Huimin Che, Yan Zhao, Peiheng Zhou, Haojun Wang, Chaobo Xian, Lili Le, Chi Wu, Yiwei Liu, Shengda Long, Jiale Yang, Fangzhi Xu, Sijin Wu, Haodong Duan, Yi Zhu, Chao He, Zhaojian Li, Minchao Wang, Huan Zhou, Jiani Hou, Chuqian Yu, Weiran Shi, Hongwan Gao, Jiamin Chen, Guanhong Chen, Tingqin Luo, Kaiyuan Zhang, Zhixin Yao, Qing Hua, Yuhao Jiang, Jin Chen, Pu Chen, Zhenyu Hu, Xingyu Li, Zhengxuan Jiang, Meng Cao, Tianfeng Long, Haozhe Wang, Mingzhang Wang, Yichen Zhang, Yiming Dai, Chenchen Zhang, Jiaying Wang, Zhiyong Wu, Shen Yan, Yujia Qin, Wenhao Huang, Zaiyuan Wang, Xiaolong Chang"
submitted: 2026-06-09
created: 2026-06-11
categories: "cs.AI"
description: "Workflow-GYM 用专业软件中的长流程、高价值 GUI 任务评估 computer-use agents，最强模型成功率仅略高于 30%，主要失败在阶段遗漏、错误传播、目标漂移和专业软件理解不足。"
tags:
  - "clippings"
  - "computer-use-agents"
  - "agent-evaluation"
  - "long-horizon"
  - "professional-workflows"
---

# Workflow-GYM: Towards Long-Horizon Evaluation of Computer-use Agentic Tasks in Real-World Professional Fields

## 论文信息

- arXiv：<https://arxiv.org/abs/2606.11042>
- 提交：2026-06-09
- 分类：cs.AI

## 研究问题

现有 GUI Agent benchmark 多集中在通用软件、短流程和单个操作，难以回答 Agent 能否在专业软件里完成具有经济价值的端到端工作。论文把评测对象推进到专业领域中的长程工作流。

## 方法概览

Workflow-GYM 构造跨专业领域、专用软件环境的长流程 GUI 任务，要求 Agent 持续理解用户目标、维持阶段状态、执行多个相互依赖的操作，并以最终业务交付而非局部点击作为成功标准。

## 关键贡献

- 即使最强模型，端到端成功率也仅略高于 30%。
- 失败并不只来自视觉定位，还包括工作流阶段遗漏、早期错误向后传播、长程目标漂移和对专业软件语义理解不足。
- 把 GUI Agent 的能力边界从“会操作界面”推进到“能否完成一整段专业工作”。

## 与知识库主题的关系

它补充了 [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]] 的路径选择问题，也和 [[LongDS-Bench On the Failure of Long-Horizon Agentic Data Analysis]] 的 evolving state 维护形成呼应。相对近期“运行账本”主题，它提供了一个更面向验收的对象：完整工作流是否闭环。

## 可复用观点

- 单步正确率不能代表生产能力；真实工作价值来自跨阶段一致性。
- 专业 Agent 的 benchmark 应以业务交付为单位，而不是以点击、调用或局部子任务为单位。
- 阶段遗漏和目标漂移需要显式的工作流状态、阶段门和过程证据，而不只是更强视觉模型。

## 可加工为公众号角度

- `Agent 上岗前，先让它完整值一次班`：把静态考题升级为完整工作日评测。
- 可与 [[VISTA A Versatile Interactive User Simulation Toolkit for Agent Evaluation]]、[[A History-Aware Visually Grounded Critic for Computer Use Agents]]、[[StainFlow Entity-Stain Tracking and Evidence Linking for Process Rewards in GUI Agents]] 合并成稿。

## 关联笔记

- 已加工成稿：[[2026-06-11 Agent 上岗前，先让它完整值一次班]]
- [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]
- [[LongDS-Bench On the Failure of Long-Horizon Agentic Data Analysis]]
- [[StainFlow Entity-Stain Tracking and Evidence Linking for Process Rewards in GUI Agents]]
