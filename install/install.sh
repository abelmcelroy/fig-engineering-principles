#!/bin/sh
set -eu

REPO="${FIG_REPO:-abelmcelroy/fig-engineering-principles}"
REF="${FIG_REF:-main}"
RAW="https://raw.githubusercontent.com/$REPO/$REF"
SOURCE="${FIG_SOURCE:-}"

fetch() {
  if [ -n "$SOURCE" ]; then cat "$SOURCE/$1"; else curl -fsSL "$RAW/$1"; fi
}

skills="$HOME/.claude/skills"
agents="$HOME/.claude/agents"
mkdir -p "$agents"
for skill in fig fig-workflow; do
  mkdir -p "$skills/$skill"
  fetch "skills/$skill/SKILL.md" > "$skills/$skill/SKILL.md"
  printf 'installed /%s skill -> %s/%s/SKILL.md\n' "$skill" "$skills" "$skill"
done
fetch agents/fig-agent.md > "$agents/fig-agent.md"
printf 'installed /fig-agent -> %s/fig-agent.md\n' "$agents"
