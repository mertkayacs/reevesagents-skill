# reevesagents-skill

A skill and plugin package that teaches AI coding CLIs to spawn and drive a team of
other CLI agents through the [reevesagents](https://github.com/mertkayacs/reevesagents)
MCP server. It ships the same skill (`skills/reevesagents/SKILL.md`) as a plugin and
marketplace for Claude Code, Codex, and Kimi Code, and as a standalone skill for any
other skill-aware CLI (OpenCode, the legacy Kimi CLI, and so on).

## How to run

The skill drives the reevesagents MCP, so the reevesagents CLI must be installed first
(the runtime needs `tmux`):

```bash
npm install -g reevesagents
```

Then install the plugin for your CLI.

Claude Code:

```
/plugin marketplace add mertkayacs/reevesagents-skill
/plugin install reevesagents@mertkayacs
```

Codex:

```bash
codex plugin marketplace add https://github.com/mertkayacs/reevesagents-skill
codex plugin add reevesagents@mertkayacs
```

Note: Codex sandboxes MCP tool calls by default, which blocks reevesagents from
launching agents in tmux. Run Codex with full access, for example
`codex --sandbox danger-full-access`, or use a profile that sets
`sandbox_mode = "danger-full-access"`.

Kimi Code:

```
/plugins install https://github.com/mertkayacs/reevesagents-skill
```

Then `/reload`.

Any other CLI: clone this repo and run the installer, which copies the skill into the
shared skill directories (`~/.claude/skills` and `~/.agents/skills`):

```bash
git clone https://github.com/mertkayacs/reevesagents-skill
cd reevesagents-skill
./install.sh            # or ./install.sh uninstall
```

Then restart the CLI and attach the MCP server with `reevesagents attach`.

## Tech used

- Markdown (`SKILL.md`), one copy referenced by every plugin manifest
- JSON plugin and marketplace manifests (Claude Code, Codex, Kimi Code)
- POSIX shell (`install.sh`, install and uninstall)
- MCP (server config runs `reevesagents mcp`)

## Status

Active, 2026.

## License

Apache License 2.0. See [LICENSE](LICENSE).
