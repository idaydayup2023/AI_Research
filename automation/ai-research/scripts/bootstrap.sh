#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

mkdir -p \
  "$repo_root/blogs" \
  "$repo_root/clippings" \
  "$repo_root/covers" \
  "$repo_root/editorial/reviews" \
  "$repo_root/editorial/retrospectives" \
  "$repo_root/editorial/memory"

if [[ ! -f "$repo_root/editorial/memory/ai-research-memory.md" ]]; then
  cp "$repo_root/automation/ai-research/templates/memory.md" \
    "$repo_root/editorial/memory/ai-research-memory.md"
fi

if [[ ! -f "$repo_root/editorial/editorial-guidelines.candidates.md" ]]; then
  printf '# 编辑指令候选\n' > "$repo_root/editorial/editorial-guidelines.candidates.md"
fi

if [[ ! -f "$repo_root/editorial/retrospectives/candidate-rules.md" ]]; then
  printf '# 自动化复盘规则候选\n' > "$repo_root/editorial/retrospectives/candidate-rules.md"
fi

if [[ ! -f "$repo_root/文章生产关系图谱.md" ]]; then
  printf '# 文章生产关系图谱\n\n## 已形成公众号稿\n\n## 主题簇\n' > "$repo_root/文章生产关系图谱.md"
fi

printf 'ai-research workspace initialized at %s\n' "$repo_root"
