#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "$repo_root"

required=(
  "automation/ai-research/manifest.json"
  "automation/ai-research/config.json"
  "automation/ai-research/task-prompt.md"
  "automation/ai-research/loop-protocol.md"
  "editorial/editorial-guidelines.md"
  "editorial/editorial-guidelines.candidates.md"
  "editorial/reviews/README.md"
  "editorial/retrospectives/README.md"
  "editorial/retrospectives/candidate-rules.md"
  "editorial/memory/ai-research-memory.md"
  "blogs"
  "clippings"
  "covers"
  "文章生产关系图谱.md"
)

for path in "${required[@]}"; do
  [[ -e "$path" ]] || { printf 'Missing: %s\n' "$path" >&2; exit 1; }
done

python3 -m json.tool automation/ai-research/manifest.json >/dev/null
python3 -m json.tool automation/ai-research/config.json >/dev/null

if rg -n --glob '!**/scripts/**' '/Users/[^/]+/|iCloud~|file://' automation editorial; then
  printf 'Non-portable local path found in automation package.\n' >&2
  exit 1
fi

for path in \
  automation/ai-research/scripts/bootstrap.sh \
  automation/ai-research/scripts/install-codex-runtime.sh \
  automation/ai-research/scripts/validate.sh; do
  [[ -x "$path" ]] || { printf 'Script is not executable: %s\n' "$path" >&2; exit 1; }
done

for token in \
  '主编审稿与自动修订' \
  '封面' \
  '关系图谱' \
  '复盘与主动学习' \
  'Git 发布边界' \
  'Memory'; do
  rg -q "$token" automation/ai-research/task-prompt.md || {
    printf 'Task prompt missing capability: %s\n' "$token" >&2
    exit 1
  }
done

printf 'ai-research automation package is valid.\n'
