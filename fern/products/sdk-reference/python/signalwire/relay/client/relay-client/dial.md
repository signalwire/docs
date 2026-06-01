---
slug: "/reference/python/signalwire/relay/client/relay-client/dial"
title: "dial"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.client.RelayClient.dial"
  parent: "signalwire.relay.client.RelayClient"
  module: "signalwire.relay.client"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py"
---
# `dial`

Initiate an outbound call using dial. Returns a Call object.

The `calling.dial` RPC response only contains
`{"code": "200", "message": "Dialing"}` — no call\_id. The real
call\_id and node\_id arrive via `calling.call.dial` events
matched by `tag`.  This method waits for that event so the
returned Call always has valid identifiers.

**Modifiers:** `async`

## Signature

```python
async dial(
    devices: list[list[dict[str, Any]]],
    *,
    tag: Optional[str] = None,
    max_duration: Optional[int] = None,
    dial_timeout: Optional[float] = None
) -> Call
```

## Parameters

| Name           | Type                         | Required | Default | Description                                                                                         |
| -------------- | ---------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------- |
| `devices`      | `list[list[dict[str, Any]]]` | yes      | —       | Array of device lists (serial/parallel dial).                                                       |
| `tag`          | `Optional[str]`              | no       | `None`  | Client-provided tag for event correlation. Auto-generated if not supplied.                          |
| `max_duration` | `Optional[int]`              | no       | `None`  | Optional max call duration in minutes.                                                              |
| `dial_timeout` | `Optional[float]`            | no       | `None`  | How long (seconds) to wait for the dial to complete before raising TimeoutError.  Defaults to 120s. |

## Returns

`Call`

## Source

[`/src/signalwire/signalwire/relay/client.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py)

Line 343.
