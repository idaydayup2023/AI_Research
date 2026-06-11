#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
codex_home="${CODEX_HOME:-$HOME/.codex}"
runtime_dir="$codex_home/automations/ai-research"
version="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["package_version"])' "$repo_root/automation/ai-research/manifest.json")"

"$repo_root/automation/ai-research/scripts/bootstrap.sh"
mkdir -p "$runtime_dir"
ln -sfn "$repo_root/editorial/memory/ai-research-memory.md" "$runtime_dir/memory.md"
cp "$repo_root/automation/ai-research/task-prompt.md" "$runtime_dir/task-prompt.md"
printf '%s\n' "$version" > "$runtime_dir/task-version.txt"

printf 'Installed ai-research runtime files in %s\n' "$runtime_dir"
printf 'Create or update the Codex Desktop automation using %s\n' \
  "$repo_root/automation/ai-research/task-prompt.md"
printf 'Set the automation working directory to %s\n' "$repo_root"
