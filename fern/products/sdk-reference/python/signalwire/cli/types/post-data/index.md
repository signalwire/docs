---
slug: "/reference/python/signalwire/cli/types/post-data"
title: "PostData"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.types.PostData"
  parent: "signalwire.cli.types"
  module: "signalwire.cli.types"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py"
---
# `PostData`

Complete post\_data structure for SWML requests

## Signature

```python
class PostData(TypedDict)
```

## Inheritance

**Extends:** `TypedDict`

## Properties

| Name               | Type             | Required | Default | Description |
| ------------------ | ---------------- | -------- | ------- | ----------- |
| `call`             | `CallData`       | yes      | —       | —           |
| `call_id`          | `str`            | yes      | —       | —           |
| `error`            | `Optional[str]`  | yes      | —       | —           |
| `meta_data`        | `Dict[str, Any]` | yes      | —       | —           |
| `params`           | `Dict[str, Any]` | yes      | —       | —           |
| `parse_error`      | `Optional[bool]` | yes      | —       | —           |
| `post_prompt_data` | `Dict[str, Any]` | yes      | —       | —           |
| `project_id`       | `str`            | yes      | —       | —           |
| `protocol_error`   | `Optional[bool]` | yes      | —       | —           |
| `space_id`         | `str`            | yes      | —       | —           |
| `vars`             | `VarsData`       | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/cli/types.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/types.py)

Line 44.
