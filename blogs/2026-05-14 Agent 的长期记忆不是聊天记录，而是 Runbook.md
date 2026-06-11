# Agent 的长期记忆不是聊天记录，而是 Runbook

![封面](../covers/2026-05-14-agent-runbook-memory.png)

> 你想让 Agent 变成“越来越像老同事”，就别再把 memory 当 chat history。真正可复用的记忆，是带证据链的 runbook。

很多团队做 agent 的“记忆”，第一反应是：

- 把对话摘要写回系统提示
- 把用户偏好塞进 profile
- 把历史消息尽量塞进上下文（能塞多少塞多少）

这在 demo 阶段还行，上线后就会出两个问题：

1) **不可核验**：你不知道它“记住了什么”，更不知道它为什么这么做。  
2) **不可复用**：记忆越像聊天记录，越难在别的任务、别的同事、别的环境里复用。

而且，长上下文越来越贵，系统会逼你回到一个现实：**你负担不起把一切都塞进 prompt。**

今天这组新材料（一个 arXiv benchmark + 一个 computer-use 编排方向 + 推理分层/长上下文推理协议）给了一个更清晰的答案：

**Agent 的长期记忆应该长在“环境经验的 runbook”里，形式上是可调用、可审计的证据，而不是更长的聊天。**

---

## 先把 Agent 当新同事

新同事融入团队，靠的不是“记住每一次聊天”，而是：

- 这个系统有哪些坑（gotchas）
- 这个流程怎么走（workflow）
- 出错时怎么排查（playbook）
- 哪些前提不能忘（premise / constraints）

这些知识的共同点是：**能被引用，能被检查，能被更新。**

当你把 memory 做成 chat history 摘要，它几乎不具备以上属性。它像“回忆”，不太像“经验库”。

---

## 记忆怎么评？先学会“取证”

arXiv 新出的 [[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]（LME‑V2）很值得做成团队内部的讨论材料。

它把“长期记忆”定义为：在一个具体 web 环境里，面对大量历史轨迹，系统能不能抽取出**紧凑证据**去回答问题。

这相当于把记忆问题从“存什么”改成了“怎么取证”：

- 不是把历史压缩成一句话
- 而是把历史组织成可检索的 runbook/证据库
- 需要时只取回和当前问题有关的片段（evidence）

论文里一个很工程化的对照很有启发：它对比了 RAG 式 memory（AgentRunbook‑R）和“把轨迹存成文件，再让 coding agent 去找证据”（AgentRunbook‑C）。后者准确率更高，但延迟也更贵。

如果你把它映射到产品/系统设计上，会得到一个很实用的结论：

**长期记忆不应该是“更长上下文”，而应该是“更强的 evidence skill”。**

---

## GUI 还是工具？别让它走弯路

另一个新论文 [[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]] 讨论的是 computer-use agent 的一个现实尴尬：

- GUI 原子动作（点、输、拖、滚）能做任何事，但慢、易错、不可复现
- 高层工具调用（API/文件/结构化工具）更稳，但需要前提状态正确

于是 agent 的很多失败，不是“不会点按钮”，而是“**走错路**”：什么时候继续 GUI，什么时候切到 tool，什么时候必须先验证状态。

这类经验，本质上也是 runbook：不是一句“更小心一点”，而是可执行的策略：

- 先用 tool 把状态拉齐
- GUI 只做最后一公里
- 每个关键步骤必须留证据（截图/日志/校验结果）

---

## 成本在逼你换方案

当平台把推理系统做成“分层产品”，你会更明显地感受到：**成本约束会决定你的记忆形态**。

Google 的 [[New ways to balance cost and reliability in the Gemini API]] 把 Flex/Priority 这类 tier 明确给到开发者：同一个能力目标，可以在不同的价格、延迟、可靠性曲线下运行。

与此同时，新论文 [[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]] 这种方向也在提醒我们：长上下文优化越来越像“推理协议/缓存组织”的系统工程，而不是“把窗口开到更大”。

两件事合在一起，结论很直接：

- 你不可能长期依赖“把历史全塞进上下文”的记忆方案  
- 你必须学会把记忆做成可调用、可核验、可迭代的证据层（runbook + retrieval + verification）

---

## 怎么落地：三层记忆就够了

如果把目标定成“让 agent 像老同事一样靠谱”，一个更稳的分层是：

1) **Logs（事实层）**：完整轨迹、工具输入输出、截图、关键文件版本（为了可追溯）  
2) **Runbook（经验层）**：从 logs 中蒸馏出来的 gotchas、workflow、检查清单、恢复策略（为了可复用）  
3) **Skills（执行层）**：把 runbook 变成可调用的技能（为了可自动化）

对应到工程动作上：

- 先把证据链补齐（否则 runbook 不可审计）
- 再把常见失败模式写成 runbook（否则经验不可复用）
- 最后再把 runbook 做成 skill（否则无法规模化）

这也解释了为什么“薄 harness + 厚 skills”在生产里成立：你不是在堆 prompt，而是在堆可复用、可核验的经验资产。

---

## 参考链接

- <https://arxiv.org/abs/2605.12493>
- <https://arxiv.org/abs/2605.12481>
- <https://arxiv.org/abs/2605.12471>
- <https://blog.google/innovation-and-ai/technology/developers-tools/introducing-flex-and-priority-inference/>

## 关联笔记

- 本文新增摘录：[[LongMemEval-V2 Evaluating Long-Term Agent Memory Toward Experienced Colleagues]]、[[ToolCUA Towards Optimal GUI-Tool Path Orchestration for Computer Use Agents]]、[[KV-Fold One-Step KV-Cache Recurrence for Long-Context Inference]]、[[New ways to balance cost and reliability in the Gemini API]]
- 记忆与会话旧文摘：[[Built-in memory for Claude Managed Agents]]、[[ReasoningBank Enabling agents to learn from experience]]、[[New in Claude Managed Agents dreaming outcomes and multiagent orchestration]]
- 既有公众号脉络：[[2026-05-13 真正的AI生产力来自薄Harness和厚Skills]]、[[2026-05-13 Agent 上生产前，先管住它的会话]]、[[2026-05-12 Agent 不会靠提示词变可靠]]
