# reevesagents-skill: instructions for an AI coding team

Teach an AI coding tool to start, inspect and direct other coding tools through [reevesagents](https://github.com/mertkayacs/reevesagents). This repository supplies the operating instructions and plugin manifests; reevesagents runs the terminal sessions.

Start with the standalone installation below. Plugin installation options are listed separately.

## Install the skill

Install reevesagents first. Its runtime needs Node.js 20.19 or newer, tmux 3.0 or newer, and an installed, authenticated AI coding tool.

```sh
npm install -g reevesagents && reevesagents doctor
```

Clone this repository and install the shared skill:

```sh
git clone https://github.com/mertkayacs/reevesagents-skill && cd reevesagents-skill && ./install.sh
```

The installer copies [SKILL.md](skills/reevesagents/SKILL.md) into `~/.claude/skills/reevesagents` and `~/.agents/skills/reevesagents`. Restart your coding tool, then connect the Model Context Protocol (MCP) server to the host you want to control the team. For example, for Claude Code:

```sh
reevesagents attach claude && reevesagents hosts
```

Restart the host again to load the MCP connection. Attach only hosts you trust to control local tools. Keep permission prompts enabled for workers and review sensitive actions. The [MCP reference](https://github.com/mertkayacs/reevesagents/blob/master/docs/mcp.md) explains the connection and host requirements.

## Plugin options

The same skill is packaged for Claude Code, Codex and Kimi Code. The manifests are in [.claude-plugin](.claude-plugin), [.codex-plugin](.codex-plugin) and [kimi.plugin.json](kimi.plugin.json). Use your host's plugin installer with this repository as the marketplace source.

<details>
<summary>Claude Code commands</summary>

Run these commands inside Claude Code:

```text
/plugin marketplace add mertkayacs/reevesagents-skill
```

```text
/plugin install reevesagents@mertkayacs
```

</details>

## Package contents

- One [skill](skills/reevesagents/SKILL.md) shared by the plugin manifests.
- [install.sh](install.sh) for standalone installation and removal (`./install.sh uninstall`).
- MCP configuration that starts `reevesagents mcp`.

## License

[Apache-2.0](LICENSE).

<a href="https://eschatialabs.com"><picture><source media="(min-resolution: 2dppx)" srcset="https://eschatialabs.com/brand/lockup-46@2x.png"><img src="https://eschatialabs.com/brand/lockup-46@1x.png" width="124" height="46" alt="Eschatia Labs"></picture></a><br>An [Eschatia Labs](https://eschatialabs.com) project by [Mert Kaya](https://mertkayacs.com).
