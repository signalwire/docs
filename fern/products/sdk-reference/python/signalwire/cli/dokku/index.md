---
slug: "/reference/python/signalwire/cli/dokku"
title: "dokku"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.cli.dokku"
  parent: "signalwire.cli"
  module: "signalwire.cli"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/dokku.py"
---
# `dokku`

SignalWire Agent Dokku Deployment Tool

CLI tool for deploying SignalWire agents to Dokku with support for:

- Simple git push deployment
- Full CI/CD with GitHub Actions
- Service provisioning (PostgreSQL, Redis)
- Preview environments for PRs

> \[!NOTE]
> sw-agent-dokku init myagent                    # Simple mode
> sw-agent-dokku init myagent --cicd             # With GitHub Actions CI/CD
> sw-agent-dokku deploy                          # Deploy current directory
> sw-agent-dokku logs                            # Tail logs
> sw-agent-dokku config set KEY=value            # Set environment variables
> sw-agent-dokku scale web=2                     # Scale processes

## Signature

```python
module dokku
```

## Constants

| Name                        | Type                        | Required | Default | Description |
| --------------------------- | --------------------------- | -------- | ------- | ----------- |
| `APP_JSON_TEMPLATE`         | `APP_JSON_TEMPLATE`         | yes      | —       | —           |
| `APP_TEMPLATE`              | `APP_TEMPLATE`              | yes      | —       | —           |
| `APP_TEMPLATE_WITH_WEB`     | `APP_TEMPLATE_WITH_WEB`     | yes      | —       | —           |
| `CHECKS_TEMPLATE`           | `CHECKS_TEMPLATE`           | yes      | —       | —           |
| `DEPLOY_SCRIPT_TEMPLATE`    | `DEPLOY_SCRIPT_TEMPLATE`    | yes      | —       | —           |
| `DEPLOY_WORKFLOW_TEMPLATE`  | `DEPLOY_WORKFLOW_TEMPLATE`  | yes      | —       | —           |
| `DOKKU_CONFIG_TEMPLATE`     | `DOKKU_CONFIG_TEMPLATE`     | yes      | —       | —           |
| `ENV_EXAMPLE_TEMPLATE`      | `ENV_EXAMPLE_TEMPLATE`      | yes      | —       | —           |
| `GITIGNORE_TEMPLATE`        | `GITIGNORE_TEMPLATE`        | yes      | —       | —           |
| `PREVIEW_WORKFLOW_TEMPLATE` | `PREVIEW_WORKFLOW_TEMPLATE` | yes      | —       | —           |
| `PROCFILE_TEMPLATE`         | `PROCFILE_TEMPLATE`         | yes      | —       | —           |
| `README_CICD_TEMPLATE`      | `README_CICD_TEMPLATE`      | yes      | —       | —           |
| `README_SIMPLE_TEMPLATE`    | `README_SIMPLE_TEMPLATE`    | yes      | —       | —           |
| `REQUIREMENTS_TEMPLATE`     | `REQUIREMENTS_TEMPLATE`     | yes      | —       | —           |
| `RUNTIME_TEMPLATE`          | `RUNTIME_TEMPLATE`          | yes      | —       | —           |
| `SERVICES_TEMPLATE`         | `SERVICES_TEMPLATE`         | yes      | —       | —           |
| `WEB_INDEX_TEMPLATE`        | `WEB_INDEX_TEMPLATE`        | yes      | —       | —           |

## Functions

- [`cmd_config`](/reference/python/signalwire/cli/dokku/cmd-config) — Manage Dokku config.
- [`cmd_deploy`](/reference/python/signalwire/cli/dokku/cmd-deploy) — Deploy to Dokku.
- [`cmd_init`](/reference/python/signalwire/cli/dokku/cmd-init) — Initialize a new Dokku project.
- [`cmd_logs`](/reference/python/signalwire/cli/dokku/cmd-logs) — Tail Dokku logs.
- [`cmd_scale`](/reference/python/signalwire/cli/dokku/cmd-scale) — Scale Dokku processes.
- [`generate_password`](/reference/python/signalwire/cli/dokku/generate-password)
- [`main`](/reference/python/signalwire/cli/dokku/main)
- [`print_error`](/reference/python/signalwire/cli/dokku/print-error)
- [`print_header`](/reference/python/signalwire/cli/dokku/print-header)
- [`print_step`](/reference/python/signalwire/cli/dokku/print-step)
- [`print_success`](/reference/python/signalwire/cli/dokku/print-success)
- [`print_warning`](/reference/python/signalwire/cli/dokku/print-warning)
- [`prompt`](/reference/python/signalwire/cli/dokku/prompt)
- [`prompt_yes_no`](/reference/python/signalwire/cli/dokku/prompt-yes-no)

## Classes

- [`Colors`](/reference/python/signalwire/cli/dokku/colors)
- [`DokkuProjectGenerator`](/reference/python/signalwire/cli/dokku/dokku-project-generator) — Generates Dokku deployment files for SignalWire agents.

## Source

[`/src/signalwire/signalwire/cli/dokku.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/dokku.py)
