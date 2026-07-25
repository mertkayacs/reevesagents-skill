#!/usr/bin/env sh
# Install the reevesagents skill for skill-aware AI CLIs (Claude Code, Codex, Kimi,
# OpenCode). It writes one SKILL.md to the two shared skill directories that all
# four read: ~/.claude/skills and ~/.agents/skills.
#
#   ./install.sh              install the skill
#   ./install.sh uninstall    remove it
set -eu

NAME="reevesagents"
# Resolve the directory this script lives in, so it works from any working dir.
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SRC="$SCRIPT_DIR/skills/$NAME/SKILL.md"
HOME_DIR="${HOME:?HOME is not set}"

TARGETS="$HOME_DIR/.claude/skills/$NAME $HOME_DIR/.agents/skills/$NAME"

if [ "${1:-install}" = "uninstall" ]; then
  for dir in $TARGETS; do
    rm -rf "$dir"
    echo "removed $dir"
  done
  echo "done. restart your CLIs."
  exit 0
fi

[ -f "$SRC" ] || { echo "error: $SRC not found" >&2; exit 1; }
for dir in $TARGETS; do
  mkdir -p "$dir"
  cp "$SRC" "$dir/SKILL.md"
  echo "installed $dir/SKILL.md"
done

echo
echo "done. restart Claude Code / Codex / Kimi / OpenCode to load the skill."
echo "the skill drives the reevesagents MCP, so install and attach the CLI too:"
echo "  npm install -g reevesagents && reevesagents attach"
