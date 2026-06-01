---
slug: "/reference/python/signalwire/cli/types/function-info"
title: "FunctionInfo"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.types.FunctionInfo"
  parent: "signalwire.cli.types"
  module: "signalwire.cli.types"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py"
---
# `FunctionInfo`

Information about a SWAIG function

## Signature

```python
class FunctionInfo(TypedDict)
```

## Inheritance

**Extends:** `TypedDict`

## Properties

| Name          | Type             | Required | Default | Description |
| ------------- | ---------------- | -------- | ------- | ----------- |
| `description` | `str`            | yes      | —       | —           |
| `name`        | `str`            | yes      | —       | —           |
| `parameters`  | `Dict[str, Any]` | yes      | —       | —           |
| `type`        | `str`            | yes      | —       | —           |
| `webhook_url` | `Optional[str]`  | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/cli/types.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py)

Line 75.
