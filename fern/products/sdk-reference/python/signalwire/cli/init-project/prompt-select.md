---
slug: "/reference/python/signalwire/cli/init-project/prompt-select"
title: "prompt_select"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.init_project.prompt_select"
  parent: "signalwire.cli.init_project"
  module: "signalwire.cli.init_project"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/init_project.py"
---
# `prompt_select`

Prompt user to select from numbered options. Returns 1-based index.

## Signature

```python
prompt_select(question: str, options: List[str], default: int = 1) -> int
```

## Parameters

| Name       | Type        | Required | Default | Description |
| ---------- | ----------- | -------- | ------- | ----------- |
| `question` | `str`       | yes      | —       | —           |
| `options`  | `List[str]` | yes      | —       | —           |
| `default`  | `int`       | no       | `1`     | —           |

## Returns

`int`

## Source

[`/src/signalwire/signalwire/cli/init_project.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/init_project.py)

Line 83.
