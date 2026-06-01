---
slug: "/reference/python/signalwire/relay/message/message/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.message.Message.__init__"
  parent: "signalwire.relay.message.Message"
  module: "signalwire.relay.message"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py"
---
# `__init__`

## Signature

```python
__init__(
    *,
    message_id: str = '',
    context: str = '',
    direction: str = '',
    from_number: str = '',
    to_number: str = '',
    body: str = '',
    media: Optional[list[str]] = None,
    segments: int = 0,
    state: str = '',
    reason: str = '',
    tags: Optional[list[str]] = None
)
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `message_id`  | `str`                 | no       | `''`    | —           |
| `context`     | `str`                 | no       | `''`    | —           |
| `direction`   | `str`                 | no       | `''`    | —           |
| `from_number` | `str`                 | no       | `''`    | —           |
| `to_number`   | `str`                 | no       | `''`    | —           |
| `body`        | `str`                 | no       | `''`    | —           |
| `media`       | `Optional[list[str]]` | no       | `None`  | —           |
| `segments`    | `int`                 | no       | `0`     | —           |
| `state`       | `str`                 | no       | `''`    | —           |
| `reason`      | `str`                 | no       | `''`    | —           |
| `tags`        | `Optional[list[str]]` | no       | `None`  | —           |

## Source

[`/src/signalwire/signalwire/relay/message.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py)

Line 28.
