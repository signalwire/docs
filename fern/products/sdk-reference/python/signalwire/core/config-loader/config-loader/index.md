---
slug: "/reference/python/signalwire/core/config-loader/config-loader"
title: "ConfigLoader"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.config_loader.ConfigLoader"
  parent: "signalwire.core.config_loader"
  module: "signalwire.core.config_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/config_loader.py"
---
# `ConfigLoader`

Configuration loader with environment variable substitution.

Supports ${VAR|default} syntax for referencing environment variables
within JSON configuration files. This provides a clean pattern for
configuration across all SignalWire services.

## Signature

```python
class ConfigLoader
```

## Properties

| Name           | Type           | Required | Default | Description |
| -------------- | -------------- | -------- | ------- | ----------- |
| `config_paths` | `config_paths` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/config-loader/config-loader/init) — Initialize config loader.
- [`find_config_file`](/reference/python/signalwire/core/config-loader/config-loader/find-config-file) — Static method to find a config file for a service.
- [`get`](/reference/python/signalwire/core/config-loader/config-loader/get) — Get a configuration value by dot-notation path.
- [`get_config`](/reference/python/signalwire/core/config-loader/config-loader/get-config) — Get the raw configuration (before substitution).
- [`get_config_file`](/reference/python/signalwire/core/config-loader/config-loader/get-config-file) — Get the path of the loaded config file.
- [`get_section`](/reference/python/signalwire/core/config-loader/config-loader/get-section) — Get an entire configuration section.
- [`has_config`](/reference/python/signalwire/core/config-loader/config-loader/has-config) — Check if a configuration was loaded.
- [`merge_with_env`](/reference/python/signalwire/core/config-loader/config-loader/merge-with-env) — Merge configuration with environment variables.
- [`substitute_vars`](/reference/python/signalwire/core/config-loader/config-loader/substitute-vars) — Recursively substitute environment variables in configuration values.

## Source

[`/src/signalwire/signalwire/core/config_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/config_loader.py)

Line 19.
