---
slug: "/reference/python/signalwire/cli/init-project"
title: "init_project"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.cli.init_project"
  parent: "signalwire.cli"
  module: "signalwire.cli"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/init_project.py"
---
# `init_project`

SignalWire Agent Project Generator

Interactive CLI tool to create new SignalWire agent projects with customizable features.

> \[!NOTE]
> sw-agent-init                    # Interactive mode
> sw-agent-init myagent            # Quick mode with project name
> sw-agent-init myagent --type full --no-venv

## Signature

```python
module init_project
```

## Constants

| Name                            | Type                            | Required | Default | Description |
| ------------------------------- | ------------------------------- | -------- | ------- | ----------- |
| `AWS_DEPLOY_TEMPLATE`           | `AWS_DEPLOY_TEMPLATE`           | yes      | —       | —           |
| `AWS_HANDLER_TEMPLATE`          | `AWS_HANDLER_TEMPLATE`          | yes      | —       | —           |
| `AWS_REQUIREMENTS_TEMPLATE`     | `AWS_REQUIREMENTS_TEMPLATE`     | yes      | —       | —           |
| `AZURE_DEPLOY_TEMPLATE`         | `AZURE_DEPLOY_TEMPLATE`         | yes      | —       | —           |
| `AZURE_FUNCTION_JSON_TEMPLATE`  | `AZURE_FUNCTION_JSON_TEMPLATE`  | yes      | —       | —           |
| `AZURE_HOST_JSON_TEMPLATE`      | `AZURE_HOST_JSON_TEMPLATE`      | yes      | —       | —           |
| `AZURE_INIT_TEMPLATE`           | `AZURE_INIT_TEMPLATE`           | yes      | —       | —           |
| `AZURE_LOCAL_SETTINGS_TEMPLATE` | `AZURE_LOCAL_SETTINGS_TEMPLATE` | yes      | —       | —           |
| `AZURE_REQUIREMENTS_TEMPLATE`   | `AZURE_REQUIREMENTS_TEMPLATE`   | yes      | —       | —           |
| `CLOUD_PLATFORMS`               | `CLOUD_PLATFORMS`               | yes      | —       | —           |
| `DEFAULT_REGIONS`               | `DEFAULT_REGIONS`               | yes      | —       | —           |
| `GCP_DEPLOY_TEMPLATE`           | `GCP_DEPLOY_TEMPLATE`           | yes      | —       | —           |
| `GCP_MAIN_TEMPLATE`             | `GCP_MAIN_TEMPLATE`             | yes      | —       | —           |
| `GCP_REQUIREMENTS_TEMPLATE`     | `GCP_REQUIREMENTS_TEMPLATE`     | yes      | —       | —           |
| `TEMPLATE_AGENTS_INIT`          | `TEMPLATE_AGENTS_INIT`          | yes      | —       | —           |
| `TEMPLATE_ENV_EXAMPLE`          | `TEMPLATE_ENV_EXAMPLE`          | yes      | —       | —           |
| `TEMPLATE_GITIGNORE`            | `TEMPLATE_GITIGNORE`            | yes      | —       | —           |
| `TEMPLATE_REQUIREMENTS`         | `TEMPLATE_REQUIREMENTS`         | yes      | —       | —           |
| `TEMPLATE_SKILLS_INIT`          | `TEMPLATE_SKILLS_INIT`          | yes      | —       | —           |
| `TEMPLATE_TESTS_INIT`           | `TEMPLATE_TESTS_INIT`           | yes      | —       | —           |

## Functions

- [`generate_password`](/reference/python/signalwire/cli/init-project/generate-password) — Generate a secure random password.
- [`get_agent_template`](/reference/python/signalwire/cli/init-project/get-agent-template) — Generate the main agent template based on type and features.
- [`get_app_template`](/reference/python/signalwire/cli/init-project/get-app-template) — Generate the app.py template based on features.
- [`get_env_credentials`](/reference/python/signalwire/cli/init-project/get-env-credentials) — Get SignalWire credentials from environment variables.
- [`get_readme_template`](/reference/python/signalwire/cli/init-project/get-readme-template) — Generate README template.
- [`get_test_template`](/reference/python/signalwire/cli/init-project/get-test-template) — Generate test template.
- [`get_web_index_template`](/reference/python/signalwire/cli/init-project/get-web-index-template) — Generate a simple web UI template.
- [`main`](/reference/python/signalwire/cli/init-project/main) — Main entry point.
- [`mask_token`](/reference/python/signalwire/cli/init-project/mask-token) — Mask a token showing only first 4 and last 3 characters.
- [`print_error`](/reference/python/signalwire/cli/init-project/print-error)
- [`print_step`](/reference/python/signalwire/cli/init-project/print-step)
- [`print_success`](/reference/python/signalwire/cli/init-project/print-success)
- [`print_warning`](/reference/python/signalwire/cli/init-project/print-warning)
- [`prompt`](/reference/python/signalwire/cli/init-project/prompt) — Prompt user for input with optional default.
- [`prompt_multiselect`](/reference/python/signalwire/cli/init-project/prompt-multiselect) — Prompt user to toggle multiple options. Returns list of booleans.
- [`prompt_select`](/reference/python/signalwire/cli/init-project/prompt-select) — Prompt user to select from numbered options. Returns 1-based index.
- [`prompt_yes_no`](/reference/python/signalwire/cli/init-project/prompt-yes-no) — Prompt user for yes/no answer.
- [`run_interactive`](/reference/python/signalwire/cli/init-project/run-interactive) — Run interactive prompts and return configuration.
- [`run_quick`](/reference/python/signalwire/cli/init-project/run-quick) — Run in quick mode with minimal prompts.

## Classes

- [`Colors`](/reference/python/signalwire/cli/init-project/colors)
- [`ProjectGenerator`](/reference/python/signalwire/cli/init-project/project-generator) — Generates a new SignalWire agent project.

## Source

[`/src/signalwire/signalwire/cli/init_project.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/init_project.py)
