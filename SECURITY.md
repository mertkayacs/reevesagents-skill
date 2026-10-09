# Security

This repository ships a skill file, plugin manifests, an icon and a small `install.sh` that copies the skill file. The code that runs is the `reevesagents` CLI, which lives in [mertkayacs/reevesagents](https://github.com/mertkayacs/reevesagents).

## Reporting a vulnerability

Report it privately through a GitHub security advisory on the main repository: <https://github.com/mertkayacs/reevesagents/security/advisories/new>

This covers the CLI, the MCP server and anything in this repository, such as a manifest that starts something it should not. Please do not open a public issue for a security problem.

Include the reevesagents version (`reevesagents --version`), the host tool and its version, and the steps to reproduce.
