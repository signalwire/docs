---
slug: "/reference/python/signalwire/cli/types/agent-info"
title: "AgentInfo"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.types.AgentInfo"
  parent: "signalwire.cli.types"
  module: "signalwire.cli.types"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py"
---
# `AgentInfo`

Information about a discovered agent

## Signature

```python
class AgentInfo(TypedDict)
```

## Inheritance

**Extends:** `TypedDict`

## Properties

| Name            | Type            | Required | Default | Description |
| --------------- | --------------- | -------- | ------- | ----------- |
| `class_name`    | `str`           | yes      | —       | —           |
| `file_path`     | `str`           | yes      | —       | —           |
| `instance_name` | `Optional[str]` | yes      | —       | —           |
| `is_instance`   | `bool`          | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/cli/types.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py)

Line 67.
