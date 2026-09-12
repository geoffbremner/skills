#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
skills_source="$repo_root/skills"
agent_dir="${PI_AGENT_DIR:-$HOME/.pi/agent}"

if [[ ! -d "$skills_source" ]]; then
  printf 'Error: skills directory not found at %s\n' "$skills_source" >&2
  exit 1
fi

mkdir -p "$agent_dir"

backup_path() {
  local target="$1"
  local backup="$target.backup-$(date +%Y%m%d-%H%M%S)"
  local suffix=1

  while [[ -e "$backup" || -L "$backup" ]]; do
    backup="$target.backup-$(date +%Y%m%d-%H%M%S)-$suffix"
    suffix=$((suffix + 1))
  done

  printf '%s\n' "$backup"
}

link_path() {
  local source="$1"
  local target="$2"

  if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
    return
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    local backup
    backup="$(backup_path "$target")"
    mv "$target" "$backup"
    printf 'Existing %s moved to %s\n' "$(basename "$target")" "$backup"
  fi

  ln -s "$source" "$target"
}

link_path "$skills_source" "$agent_dir/skills"
link_path "$repo_root/agents/AGENTS.md" "$agent_dir/AGENTS.md"
link_path "$repo_root/agents/AGENTS_OBSIDIAN.md" "$agent_dir/AGENTS_OBSIDIAN.md"
link_path "$repo_root/agents/AGENTS_SOFTWARE.md" "$agent_dir/AGENTS_SOFTWARE.md"
link_path "$repo_root/agents/AGENTS_FILES.md" "$agent_dir/AGENTS_FILES.md"

printf 'Pi is configured to use skills from %s\n' "$skills_source"
printf 'Primary agent instructions linked from %s/agents\n' "$repo_root"
printf 'Restart Pi or run /reload to load the changes.\n'
