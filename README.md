# AI Research

AI Research 是一个持续更新的中文 AI 研究与工程实践知识库，也是同名公众号文章的公开源仓库。

项目关注的不只是模型新闻，而是 AI 系统真正进入生产时需要解决的问题：Agent、Skills、Context Engineering、Harness、Tool Use、Coding Agents、知识管理、评测、安全、推理基础设施与成本优化。

## 仓库内容

- `blogs/`：经过二次加工的中文观点文章。
- `clippings/`：官方博客和论文的结构化研究笔记，保留原文链接。
- `covers/`：公众号文章封面。
- `文章生产关系图谱.md`：文章、摘录与主题簇之间的关系导航。
- `automation/ai-research/`：可移植的每日研究、成稿、审稿和学习自动化任务包。
- `editorial/`：可由使用者修改的总编规则、审稿/复盘规范和运行记忆。
- `scripts/`：人工触发的同步与公开仓库检查脚本。

## 阅读方式

可以直接在 GitHub 阅读，也可以把仓库作为 Obsidian Vault 打开。文章和研究笔记使用 Obsidian Wiki Link 互相连接。

建议从以下入口开始：

1. 阅读 [`文章生产关系图谱.md`](文章生产关系图谱.md)，按主题寻找文章。
2. 在 `blogs/` 阅读完整观点文章。
3. 沿文章末尾的“关联笔记”进入 `clippings/` 查看证据与研究背景。

## 核心主题

- Agent 系统工程与 Harness
- Skills、工具调用与上下文工程
- Coding Agents 与开发者工作流
- Agent 评测、安全、权限和审计
- 长期记忆、知识层与证据链
- 推理、缓存、Serving 与成本优化
- Google DeepMind、Anthropic、Perplexity 等研究进展

## 更新与发布

本仓库不启用自动 Git 发布。内容从私人知识库同步到公开仓库后，必须经过人工检查，并且只有在收到明确的人工发布指令时才允许 commit 和 push。

本地维护流程见 [`PUBLISHING.md`](PUBLISHING.md)。

## 使用自动化

克隆仓库后运行：

```bash
./automation/ai-research/scripts/bootstrap.sh
./automation/ai-research/scripts/install-codex-runtime.sh
./automation/ai-research/scripts/validate.sh
```

然后在 Codex Desktop 中创建一个每天运行的自动化：

- 工作目录：仓库根目录
- Prompt：[`automation/ai-research/task-prompt.md`](automation/ai-research/task-prompt.md) 全文
- 建议时间：每天当地时间 08:30
- 建议模型：支持网页检索、文件编辑和图片生成的高推理模型

完整说明见 [`automation/ai-research/README.md`](automation/ai-research/README.md)。自动化会更新本地知识库，但不会自行执行 Git commit 或 push。

## 内容边界

公开仓库包含文章、研究摘录、封面、关系图谱和脱敏后的通用自动化规则。它不包含维护者私人知识库的历史审稿单、历史运行记忆、个人资料或其他项目文件。第三方运行时会在自己的克隆中生成独立的审稿、复盘和 memory。

`clippings/` 主要是结构化转述、评论和少量必要引用。每篇笔记均尽量保留原始来源链接。外部材料的权利归原作者和原发布机构所有。

## 许可

- 原创文章、原创研究笔记和原创封面：见 [`LICENSE-CONTENT`](LICENSE-CONTENT)。
- `scripts/` 与 `automation/` 下的脚本代码：见 [`LICENSE-CODE`](LICENSE-CODE)。
- 编辑规则、模板与说明文档按原创内容许可处理。
- 外部引用、论文标题、商标及链接内容不包含在本项目许可授权范围内。

## 反馈

欢迎通过 GitHub Issues 提交事实纠错、失效链接、主题建议和内容改进意见。请附上可核验来源。
