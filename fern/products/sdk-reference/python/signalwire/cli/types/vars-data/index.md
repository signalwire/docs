---
slug: "/reference/python/signalwire/cli/types/vars-data"
title: "VarsData"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.types.VarsData"
  parent: "signalwire.cli.types"
  module: "signalwire.cli.types"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py"
---
# `VarsData`

Variables data structure for SWML post\_data

## Signature

```python
class VarsData(TypedDict)
```

## Inheritance

**Extends:** `TypedDict`

## Properties

| Name            | Type             | Required | Default | Description |
| --------------- | ---------------- | -------- | ------- | ----------- |
| `call_data`     | `Dict[str, Any]` | yes      | —       | —           |
| `environment`   | `str`            | yes      | —       | —           |
| `userVariables` | `Dict[str, Any]` | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/cli/types.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py)

Line 37.
