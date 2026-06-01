---
slug: "/reference/python/signalwire/cli/execution/datamap-exec/simple-template-expand"
title: "simple_template_expand"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.execution.datamap_exec.simple_template_expand"
  parent: "signalwire.cli.execution.datamap_exec"
  module: "signalwire.cli.execution.datamap_exec"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/execution/datamap_exec.py"
---
# `simple_template_expand`

Simple template expansion for DataMap testing
Supports both ${key} and %{key} syntax with nested object access and array indexing

## Signature

```python
simple_template_expand(template: str, data: Dict[str, Any]) -> str
```

## Parameters

| Name       | Type             | Required | Default | Description                               |
| ---------- | ---------------- | -------- | ------- | ----------------------------------------- |
| `template` | `str`            | yes      | —       | Template string with ${} or %{} variables |
| `data`     | `Dict[str, Any]` | yes      | —       | Data dictionary for expansion             |

## Returns

`str` — Expanded string

## Source

[`/src/signalwire/signalwire/cli/execution/datamap_exec.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/execution/datamap_exec.py)

Line 22.
