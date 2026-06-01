---
slug: "/reference/python/signalwire/relay/client/relay-client/send-message"
title: "send_message"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.client.RelayClient.send_message"
  parent: "signalwire.relay.client.RelayClient"
  module: "signalwire.relay.client"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py"
---
# `send_message`

Send an outbound SMS/MMS message.

At least one of `body` or `media` must be provided.

Returns a Message object that tracks state changes. Use
`await message.wait()` to block until delivery confirmation
(or failure).

**Modifiers:** `async`

## Signature

```python
async send_message(
    *,
    to_number: str,
    from_number: str,
    context: Optional[str] = None,
    body: Optional[str] = None,
    media: Optional[list[str]] = None,
    tags: Optional[list[str]] = None,
    region: Optional[str] = None,
    on_completed: Optional[Callable] = None
) -> Message
```

## Parameters

| Name           | Type                  | Required | Default | Description                                                                              |
| -------------- | --------------------- | -------- | ------- | ---------------------------------------------------------------------------------------- |
| `to_number`    | `str`                 | yes      | —       | Destination phone number in E.164 format.                                                |
| `from_number`  | `str`                 | yes      | —       | Sender phone number in E.164 format.                                                     |
| `context`      | `Optional[str]`       | no       | `None`  | Context for receiving state events. Defaults to the relay protocol.                      |
| `body`         | `Optional[str]`       | no       | `None`  | Text body of the message.                                                                |
| `media`        | `Optional[list[str]]` | no       | `None`  | List of media URLs for MMS.                                                              |
| `tags`         | `Optional[list[str]]` | no       | `None`  | Optional tags for the message.                                                           |
| `region`       | `Optional[str]`       | no       | `None`  | Optional origination region.                                                             |
| `on_completed` | `Optional[Callable]`  | no       | `None`  | Optional callback fired when a terminal state (delivered/undelivered/failed) is reached. |

## Returns

`Message`

## Source

[`/src/signalwire/signalwire/relay/client.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py)

Line 406.
