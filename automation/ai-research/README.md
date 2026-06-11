# ai-research 自动化任务包

这个目录提供公开、可移植的 `每日 AI Research` 自动化。它可以在本仓库或 fork 中完成以下闭环：

1. 检查官方 AI 博客与 arXiv 新增内容。
2. 筛选并写入结构化研究摘录。
3. 回看全库，生成非重复的中文观点文章。
4. 生成并校验公众号封面。
5. 生成主编审稿单并按必改项做最小修订。
6. 更新文章关系图谱和来源回链。
7. 生成自动化复盘，维护跨运行 memory 和候选规则。
8. 执行任务内 Loop 与跨运行持续改进。

## 目录

- `manifest.json`：任务包版本和路径。
- `config.json`：来源、数量上限和资产参数。
- `task-prompt.md`：自动化的完整执行指令。
- `loop-protocol.md`：任务内与跨运行双层 Loop。
- `CHANGELOG.md`：公开任务包变更记录。
- `templates/`：摘录、文章、审稿、复盘和 memory 模板。
- `scripts/bootstrap.sh`：初始化可写状态目录。
- `scripts/install-codex-runtime.sh`：安装 Codex runtime memory 和版本文件。
- `scripts/validate.sh`：检查第三方运行所需文件和路径。

## 快速开始

依赖：Git、Bash、Python 3，以及能够执行网页检索、文件编辑和图片生成的 Agent 环境。推荐 Codex Desktop。

```bash
git clone https://github.com/idaydayup2023/AI_Research.git
cd AI_Research
./automation/ai-research/scripts/bootstrap.sh
./automation/ai-research/scripts/install-codex-runtime.sh
./automation/ai-research/scripts/validate.sh
```

在 Codex Desktop 创建自动化：

- Automation ID：`ai-research`
- 显示名称：`每日 AI Research 博客摘录`
- 工作目录：仓库根目录
- Prompt：使用 `automation/ai-research/task-prompt.md` 全文
- 调度：建议每天 08:30
- 执行环境：local
- 模型：支持网页检索、图片生成和本地文件编辑的高推理模型

如果平台不能直接导入 prompt 文件，可以在任务 prompt 中写：

```text
运行前读取 automation/ai-research/task-prompt.md，并将其作为本次任务的完整执行协议。工作目录为当前仓库根目录。
```

## 自定义

- 修改 `editorial/editorial-guidelines.md` 调整读者、口吻、主题和成稿标准。
- 修改 `automation/ai-research/config.json` 调整来源、论文上限、文章上限和封面比例。
- 不要直接把单次运行经验写成硬规则；先写入候选规则或复盘。
- `editorial/memory/ai-research-memory.md` 属于每个使用者自己的运行状态，可自行决定是否提交到 fork。

## 能力降级

- 没有图片生成工具：文章、摘录、审稿和图谱照常生成，在总结和 memory 中记录待补封面。
- 某个来源不可访问：记录来源、错误和替代检查方式，继续其他来源。
- 无法写 `$CODEX_HOME`：以仓库内 canonical memory 为准。
- 没有自动化调度器：可在仓库根目录手动启动 Agent，并要求其执行 `task-prompt.md`。

## Git 安全边界

内容自动化不包含 Git 发布权限。它可以写本地文件，但不得 commit、push、创建 PR 或 release。只有当前对话中的明确人工发布指令才能授权 Git 发布。
