#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

fail=0

required=("README.md" "blogs" "clippings" "covers" "文章生产关系图谱.md")
for path in "${required[@]}"; do
  if [[ ! -e "$path" ]]; then
    printf 'Missing required public path: %s\n' "$path" >&2
    fail=1
  fi
done

if rg -n '/Users/|iCloud~|file://|BEGIN (RSA|OPENSSH|EC) PRIVATE KEY|sk-[A-Za-z0-9_-]{16,}|gh[opusr]_[A-Za-z0-9]{16,}|AKIA[0-9A-Z]{16}' \
  README.md PUBLISHING.md blogs clippings 文章生产关系图谱.md; then
  printf 'Potential private path or secret found.\n' >&2
  fail=1
fi

while IFS= read -r ref; do
  file="${ref#../covers/}"
  if [[ ! -f "covers/$file" ]]; then
    printf 'Missing cover referenced by a blog: covers/%s\n' "$file" >&2
    fail=1
  fi
done < <(rg -o --no-filename '\.\./covers/[^)]+' blogs | sort -u)

if find . -name '.DS_Store' -print -quit | grep -q .; then
  printf 'Found .DS_Store in public repository.\n' >&2
  fail=1
fi

blog_count="$(find blogs -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
clipping_count="$(find clippings -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
cover_count="$(find covers -maxdepth 1 -type f | wc -l | tr -d ' ')"

printf 'blogs=%s clippings=%s covers=%s\n' \
  "$blog_count" "$clipping_count" "$cover_count"

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

printf 'Public repository checks passed.\n'
