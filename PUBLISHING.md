# Publishing

本仓库采用人工发布，不设置定时提交、自动推送或无人审批的 GitHub 发布流程。

## 同步公开内容

仓库位于 Obsidian 知识库内部时：

```bash
./scripts/sync_from_vault.sh
```

仓库位于其他位置时，显式指定知识库路径：

```bash
AI_RESEARCH_VAULT="/absolute/path/to/vault" ./scripts/sync_from_vault.sh
```

同步范围固定为：

- `Blogs/` -> `blogs/`
- `Clippings/` -> `clippings/`
- `Covers/` -> `covers/`
- `文章生产关系图谱.md`

脚本不会同步编辑指令、审稿单、自动化 memory 或知识库中的其他目录。

## 发布前检查

```bash
./scripts/check_public_repo.sh
git status --short
git diff --stat
git diff
```

重点检查：

- 是否包含私人信息、密钥或本机路径。
- 新文章的封面是否存在。
- 外部来源是否有可核验链接。
- 是否意外删除了仍需公开的文章或摘录。
- `clippings/` 是否只保留必要转述和引用。

## 人工发布

只有收到明确的人工发布指令后才执行：

```bash
git add README.md PUBLISHING.md AGENTS.md .gitignore .gitattributes \
  LICENSE-CONTENT LICENSE-CODE scripts automation editorial blogs clippings covers \
  文章生产关系图谱.md
git commit -m "Publish AI Research update"
git push origin main
```

维护者也可以按实际变更显式选择文件，不应使用未经检查的全目录自动提交。
