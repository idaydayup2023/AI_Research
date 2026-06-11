#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
vault_root="${AI_RESEARCH_VAULT:-$(cd "$repo_root/.." && pwd)}"

required=("Blogs" "Clippings" "Covers" "文章生产关系图谱.md")
for path in "${required[@]}"; do
  if [[ ! -e "$vault_root/$path" ]]; then
    printf 'Missing source: %s\n' "$vault_root/$path" >&2
    exit 1
  fi
done

sync_dir() {
  local source_name="$1"
  local target_name="$2"
  mkdir -p "$repo_root/$target_name"
  rsync -a --delete --exclude='.DS_Store' \
    "$vault_root/$source_name/" "$repo_root/$target_name/"
}

sync_dir "Blogs" "blogs"
sync_dir "Clippings" "clippings"
sync_dir "Covers" "covers"
cp "$vault_root/文章生产关系图谱.md" "$repo_root/文章生产关系图谱.md"

printf 'Public content synchronized from %s\n' "$vault_root"
printf 'No Git commit or push was performed.\n'

