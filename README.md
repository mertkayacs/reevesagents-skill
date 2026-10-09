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

The same skill is packaged for Claude Code, Codex, Kimi Code and Gemini CLI. The manifests are in [.claude-plugin](.claude-plugin), [.codex-plugin](.codex-plugin), [kimi.plugin.json](kimi.plugin.json) and [gemini-extension.json](gemini-extension.json). Use your host's plugin installer with this repository as the marketplace source.

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

<details>
<summary>Gemini CLI command</summary>

Run this in a terminal, then restart Gemini CLI:

```sh
gemini extensions install https://github.com/mertkayacs/reevesagents-skill
```

Gemini CLI reads `gemini-extension.json` for the MCP server and loads the skill from `skills/`.

</details>

## Package contents

- One [skill](skills/reevesagents/SKILL.md) shared by the plugin manifests.
- [install.sh](install.sh) for standalone installation and removal (`./install.sh uninstall`).
- MCP configuration that starts `reevesagents mcp`.

## What it runs

This repository holds the skill file, JSON manifests, an icon and `install.sh`, which only copies the skill file. The plugin starts one program: the `reevesagents` binary from your PATH, which you install yourself from npm. It talks to your host over stdio as an MCP server. When the model asks for an agent, reevesagents starts `tmux` and the coding tool you named (Claude Code, Codex, Kimi and so on) in a tmux window on your machine.

reevesagents makes no network calls of its own. Its optional web UI (`reevesagents web`) listens on 127.0.0.1 only. The coding tools it starts use your existing logins and talk to their own model providers, the same as when you run them by hand.

The skill mentions `permissions:"skip"`. That value starts a worker with its tool's own approval bypass flag (`--dangerously-skip-permissions` for Claude Code, `--dangerously-bypass-approvals-and-sandbox` for Codex, `--yolo` for Kimi, `--approval-mode yolo` for Qwen), so the worker acts without asking you first. It is opt-in for each spawn. The default is `ask`, and it stays that way unless you change `default_permissions` yourself.

The plugin needs a local shell with tmux and the binary installed, so use it from Claude Code or one of the other tools above. claude.ai chat and Cowork cannot start a program on your machine, so the plugin does nothing there.

## Security

Report vulnerabilities privately as described in [SECURITY.md](SECURITY.md).

## License

[Apache-2.0](LICENSE).

<a href="https://eschatialabs.com"><picture><source media="(prefers-color-scheme: dark) and (min-resolution: 2dppx)" srcset="https://eschatialabs.com/brand/lockup-46-dark@2x.png"><source media="(prefers-color-scheme: dark)" srcset="https://eschatialabs.com/brand/lockup-46-dark@1x.png"><source media="(min-resolution: 2dppx)" srcset="https://eschatialabs.com/brand/lockup-46@2x.png"><img src="https://eschatialabs.com/brand/lockup-46@1x.png" width="124" height="46" alt="Eschatia Labs"></picture></a><br>An [Eschatia Labs](https://eschatialabs.com) project by [Mert Kaya](https://mertkayacs.com).
