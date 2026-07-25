# reevesagents skill + plugin

Teach your AI coding CLI to spawn and drive a **team of other CLI agents** through
the [reevesagents](https://github.com/mertkayacs/reevesagents) MCP server. This repo
publishes the reevesagents skill (a `SKILL.md`) as a **plugin + marketplace** for
Claude Code, Codex, and Kimi Code, and as a **standalone skill** for any other
skill-aware CLI (OpenCode, the legacy Kimi CLI, and so on).

The same skill also ships inside the `reevesagents` npm package
(`reevesagents skills install`). This repo is for standalone discovery and the
per-CLI marketplaces.

## Prerequisite

The skill drives the reevesagents MCP, so the CLI has to be installed and on PATH
(the runtime needs `tmux`):

```bash
npm install -g reevesagents
```

## Claude Code

```
/plugin marketplace add mertkayacs/reevesagents-skill
/plugin install reevesagents@mertkayacs
```

Restart Claude Code. The plugin installs the `reevesagents` skill and registers the
`reevesagents` MCP server (it runs `reevesagents mcp`).

## Codex

```bash
codex plugin marketplace add https://github.com/mertkayacs/reevesagents-skill
codex plugin add reevesagents@mertkayacs
```

Start a new Codex session. The plugin bundles the skill and the MCP server.

## Kimi Code

```
/plugins install https://github.com/mertkayacs/reevesagents-skill
```

Then `/reload`. Kimi Code reads `kimi.plugin.json`, which bundles the skill and the
MCP server.

## Any other CLI (OpenCode, legacy Kimi CLI, manual)

These read `SKILL.md` from the shared skill directories. Clone and run the installer,
which writes the skill to both `~/.claude/skills` and `~/.agents/skills` (every one of
these CLIs reads one of those):

```bash
git clone https://github.com/mertkayacs/reevesagents-skill
cd reevesagents-skill
./install.sh            # or ./install.sh uninstall
```

Restart your CLI, then wire the MCP with `reevesagents attach` (it runs each CLI's own
`mcp add`). The reevesagents CLI's own `reevesagents skills install` does the same copy.

## What the skill does

It gives the model the reevesagents drive loop: `list_providers` to see installed CLIs,
`spawn` to start one in its own tmux window, `read` / `send_text` / `send_key` to steer
it, and `stop` / `kill` / `reap` to end it. Full worked examples are in
[`skills/reevesagents/SKILL.md`](skills/reevesagents/SKILL.md).

## Layout

```
.claude-plugin/marketplace.json   Claude Code marketplace ("mertkayacs")
.claude-plugin/plugin.json        Claude Code plugin manifest
.codex-plugin/plugin.json         Codex plugin manifest
.agents/plugins/marketplace.json  Codex marketplace ("mertkayacs")
kimi.plugin.json                  Kimi Code plugin manifest
.mcp.json                         MCP server config (runs: reevesagents mcp)
skills/reevesagents/SKILL.md      the skill (every plugin manifest points here)
install.sh                        cross-CLI installer for the standalone skill
```

Each CLI reads its own manifest, and all of them point at the single
`skills/reevesagents/SKILL.md`, so there is one copy of the skill.

## License

Apache-2.0. The skill tracks the copy in the
[reevesagents](https://github.com/mertkayacs/reevesagents) repo.
