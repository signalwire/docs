---
slug: "/reference/python/signalwire/core/logging-config/strip-control-chars"
title: "strip_control_chars"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.core.logging_config.strip_control_chars"
  parent: "signalwire.core.logging_config"
  module: "signalwire.core.logging_config"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/logging_config.py"
---
# `strip_control_chars`

Strip control characters from log event values to prevent log injection.

## Signature

```python
strip_control_chars(logger, method_name, event_dict)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `logger`      | —    | yes      | —       | —           |
| `method_name` | —    | yes      | —       | —           |
| `event_dict`  | —    | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/core/logging_config.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/logging_config.py)

Line 33.
