---
slug: "/reference/python/signalwire/relay/client/relay-client"
title: "RelayClient"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.client.RelayClient"
  parent: "signalwire.relay.client"
  module: "signalwire.relay.client"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py"
---
# `RelayClient`

Manages a WebSocket connection to SignalWire RELAY.

Usage::

```
client = RelayClient(project="...", token="...", contexts=["default"])

@client.on_call
async def handle(call):
    await call.answer()
    await call.hangup()

client.run()
```

## Signature

```python
class RelayClient
```

## Examples

```python
client = RelayClient(project="...", token="...", contexts=["default"])

@client.on_call
async def handle(call):
    await call.answer()
    await call.hangup()

client.run()
```

## Properties

| Name             | Type        | Required | Default | Description                                                |
| ---------------- | ----------- | -------- | ------- | ---------------------------------------------------------- |
| `contexts`       | `contexts`  | yes      | —       | —                                                          |
| `host`           | `host`      | yes      | —       | —                                                          |
| `jwt_token`      | `jwt_token` | yes      | —       | —                                                          |
| `project`        | `project`   | yes      | —       | —                                                          |
| `relay_protocol` | `str`       | yes      | —       | Server-assigned protocol string from the connect response. |
| `token`          | `token`     | yes      | —       | —                                                          |

## Methods

- [`__aenter__`](/reference/python/signalwire/relay/client/relay-client/aenter)
- [`__aexit__`](/reference/python/signalwire/relay/client/relay-client/aexit)
- [`__del__`](/reference/python/signalwire/relay/client/relay-client/del)
- [`__init__`](/reference/python/signalwire/relay/client/relay-client/init)
- [`connect`](/reference/python/signalwire/relay/client/relay-client/connect) — Connect to RELAY and authenticate.
- [`dial`](/reference/python/signalwire/relay/client/relay-client/dial) — Initiate an outbound call using dial. Returns a Call object.
- [`disconnect`](/reference/python/signalwire/relay/client/relay-client/disconnect) — Cleanly close the connection.
- [`execute`](/reference/python/signalwire/relay/client/relay-client/execute) — Send a JSON-RPC request and await the response.
- [`on_call`](/reference/python/signalwire/relay/client/relay-client/on-call) — Register the inbound call handler (decorator).
- [`on_message`](/reference/python/signalwire/relay/client/relay-client/on-message) — Register the inbound message handler (decorator).
- [`receive`](/reference/python/signalwire/relay/client/relay-client/receive) — Subscribe to additional contexts for inbound events.
- [`run`](/reference/python/signalwire/relay/client/relay-client/run) — Blocking entry point — runs the event loop until interrupted.
- [`send_message`](/reference/python/signalwire/relay/client/relay-client/send-message) — Send an outbound SMS/MMS message.
- [`unreceive`](/reference/python/signalwire/relay/client/relay-client/unreceive) — Unsubscribe from contexts for inbound events.

## Source

[`/src/signalwire/signalwire/relay/client.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py)

Line 91.
