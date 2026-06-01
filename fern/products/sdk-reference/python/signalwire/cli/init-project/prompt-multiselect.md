---
slug: "/reference/python/signalwire/cli/init-project/prompt-multiselect"
title: "prompt_multiselect"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.init_project.prompt_multiselect"
  parent: "signalwire.cli.init_project"
  module: "signalwire.cli.init_project"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/init_project.py"
---
# `prompt_multiselect`

Prompt user to toggle multiple options. Returns list of booleans.

## Signature

```python
prompt_multiselect(
    question: str,
    options: List[str],
    defaults: List[bool]
) -> List[bool]
```

## Parameters

| Name       | Type         | Required | Default | Description |
| ---------- | ------------ | -------- | ------- | ----------- |
| `question` | `str`        | yes      | —       | —           |
| `options`  | `List[str]`  | yes      | —       | —           |
| `defaults` | `List[bool]` | yes      | —       | —           |

## Returns

`List[bool]`

## Source

[`/src/signalwire/signalwire/cli/init_project.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/init_project.py)

Line 101.
