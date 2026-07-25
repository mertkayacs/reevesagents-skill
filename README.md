# reevesagents skill + plugin

Teach your AI coding CLI to spawn and drive a **team of other CLI agents** through
the [reevesagents](https://github.com/mertkayacs/reevesagents) MCP server. This repo
publishes the reevesagents skill (a `SKILL.md`) in two forms:

- a **Claude Code plugin + marketplace** (installs the skill and wires the MCP in one step), and
- a **standalone skill** for Codex, Kimi, and OpenCode (one `SKILL.md`, installed with a script).

The same skill also ships inside the `reevesagents` npm package (`reevesagents skills install`).
This repo is for standalone discovery and the Claude Code marketplace.

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
`reevesagents` MCP server (it runs `reevesagents mcp`). Ask it something like
"spawn a codex agent to summarize the README and show me its output".

To wire the MCP yourself instead of via the plugin, run `reevesagents attach claude`.

## Codex, Kimi, OpenCode (and Claude Code, manually)

These read `SKILL.md` from the shared skill directories. Clone and run the installer,
which writes the skill to both `~/.claude/skills` and `~/.agents/skills` (every one of
the four CLIs reads one of those):

```bash
git clone https://github.com/mertkayacs/reevesagents-skill
cd reevesagents-skill
./install.sh            # or ./install.sh uninstall
```

Restart your CLI. Then wire the MCP with `reevesagents attach` (it runs each CLI's own
`mcp add`), or use the reevesagents CLI's `reevesagents skills install`, which does the
same copy.

## What the skill does

It gives the model the reevesagents drive loop: `list_providers` to see installed CLIs,
`spawn` to start one in its own tmux window, `read` / `send_text` / `send_key` to steer
it, and `stop` / `kill` / `reap` to end it. Full worked examples are in
[`skills/reevesagents/SKILL.md`](skills/reevesagents/SKILL.md).

## Layout

```
.claude-plugin/
  marketplace.json     # the "mertkayacs" marketplace, one plugin (source ./)
  plugin.json          # the reevesagents plugin manifest
.mcp.json              # registers the reevesagents MCP server (runs: reevesagents mcp)
skills/reevesagents/
  SKILL.md             # the skill (identical to the one shipped in the npm package)
install.sh             # cross-CLI installer for the standalone skill
```

## License

Apache-2.0. The skill tracks the copy in the
[reevesagents](https://github.com/mertkayacs/reevesagents) repo.
