---
slug: "/reference/python/signalwire/relay/call/call/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.__init__"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `__init__`

## Signature

```python
__init__(
    client: 'RelayClient',
    call_id: str,
    node_id: str,
    project_id: str,
    context: str,
    *,
    tag: str = '',
    direction: str = '',
    device: Optional[dict[str, Any]] = None,
    state: str = '',
    segment_id: str = ''
)
```

## Parameters

| Name         | Type                       | Required | Default | Description |
| ------------ | -------------------------- | -------- | ------- | ----------- |
| `client`     | `'RelayClient'`            | yes      | —       | —           |
| `call_id`    | `str`                      | yes      | —       | —           |
| `node_id`    | `str`                      | yes      | —       | —           |
| `project_id` | `str`                      | yes      | —       | —           |
| `context`    | `str`                      | yes      | —       | —           |
| `tag`        | `str`                      | no       | `''`    | —           |
| `direction`  | `str`                      | no       | `''`    | —           |
| `device`     | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `state`      | `str`                      | no       | `''`    | —           |
| `segment_id` | `str`                      | no       | `''`    | —           |

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 291.
