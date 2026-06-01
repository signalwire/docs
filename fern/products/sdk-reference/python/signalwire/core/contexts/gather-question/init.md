---
slug: "/reference/python/signalwire/core/contexts/gather-question/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.GatherQuestion.__init__"
  parent: "signalwire.core.contexts.GatherQuestion"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `__init__`

## Signature

```python
__init__(
    key: str,
    question: str,
    type: str = 'string',
    confirm: bool = False,
    prompt: Optional[str] = None,
    functions: Optional[List[str]] = None
)
```

## Parameters

| Name        | Type                  | Required | Default    | Description |
| ----------- | --------------------- | -------- | ---------- | ----------- |
| `key`       | `str`                 | yes      | —          | —           |
| `question`  | `str`                 | yes      | —          | —           |
| `type`      | `str`                 | no       | `'string'` | —           |
| `confirm`   | `bool`                | no       | `False`    | —           |
| `prompt`    | `Optional[str]`       | no       | `None`     | —           |
| `functions` | `Optional[List[str]]` | no       | `None`     | —           |

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 27.
