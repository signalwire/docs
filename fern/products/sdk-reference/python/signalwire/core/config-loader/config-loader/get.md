---
slug: "/reference/python/signalwire/core/config-loader/config-loader/get"
title: "get"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.config_loader.ConfigLoader.get"
  parent: "signalwire.core.config_loader.ConfigLoader"
  module: "signalwire.core.config_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/config_loader.py"
---
# `get`

Get a configuration value by dot-notation path.

## Signature

```python
get(key_path: str, default: Any = None) -> Any
```

## Parameters

| Name       | Type  | Required | Default | Description                                        |
| ---------- | ----- | -------- | ------- | -------------------------------------------------- |
| `key_path` | `str` | yes      | —       | Dot-separated path (e.g., "security.ssl\_enabled") |
| `default`  | `Any` | no       | `None`  | Default value if path not found                    |

## Returns

`Any` — The configuration value with variables substituted

## Source

[`/src/signalwire/signalwire/core/config_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/config_loader.py)

Line 129.
