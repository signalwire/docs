---
slug: "/reference/python/signalwire/cli/types/call-data"
title: "CallData"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.types.CallData"
  parent: "signalwire.cli.types"
  module: "signalwire.cli.types"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py"
---
# `CallData`

Call data structure for SWML post\_data

## Signature

```python
class CallData(TypedDict)
```

## Inheritance

**Extends:** `TypedDict`

## Properties

| Name          | Type             | Required | Default | Description |
| ------------- | ---------------- | -------- | ------- | ----------- |
| `direction`   | `str`            | yes      | —       | —           |
| `from_`       | `str`            | yes      | —       | —           |
| `from_name`   | `str`            | yes      | —       | —           |
| `from_number` | `str`            | yes      | —       | —           |
| `headers`     | `Dict[str, str]` | yes      | —       | —           |
| `id`          | `str`            | yes      | —       | —           |
| `node_id`     | `str`            | yes      | —       | —           |
| `project_id`  | `str`            | yes      | —       | —           |
| `space_id`    | `str`            | yes      | —       | —           |
| `state`       | `str`            | yes      | —       | —           |
| `tag`         | `str`            | yes      | —       | —           |
| `timeout`     | `int`            | yes      | —       | —           |
| `to`          | `str`            | yes      | —       | —           |
| `to_number`   | `str`            | yes      | —       | —           |
| `type`        | `str`            | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/cli/types.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py)

Line 18.
