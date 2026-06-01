---
slug: "/reference/python/signalwire/relay/call"
title: "call"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.relay.call"
  parent: "signalwire.relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `call`

Call object — represents a live RELAY call with command methods.

## Signature

```python
module call
```

## Properties

| Name           | Type           | Required | Default | Description |
| -------------- | -------------- | -------- | ------- | ----------- |
| `EventHandler` | `EventHandler` | yes      | —       | —           |
| `logger`       | `logger`       | yes      | —       | —           |

## Classes

- [`Action`](/reference/python/signalwire/relay/call/action) — Base class for async action handles (play, record, detect, etc.).
- [`AIAction`](/reference/python/signalwire/relay/call/ai-action) — Handle for an active AI agent session.
- [`Call`](/reference/python/signalwire/relay/call/call) — Represents a live RELAY call.
- [`CollectAction`](/reference/python/signalwire/relay/call/collect-action) — Handle for play\_and\_collect or standalone collect.
- [`DetectAction`](/reference/python/signalwire/relay/call/detect-action) — Handle for an active detect operation.
- [`FaxAction`](/reference/python/signalwire/relay/call/fax-action) — Handle for an active send\_fax or receive\_fax operation.
- [`PayAction`](/reference/python/signalwire/relay/call/pay-action) — Handle for an active pay operation.
- [`PlayAction`](/reference/python/signalwire/relay/call/play-action) — Handle for an active play operation.
- [`RecordAction`](/reference/python/signalwire/relay/call/record-action) — Handle for an active record operation.
- [`StandaloneCollectAction`](/reference/python/signalwire/relay/call/standalone-collect-action) — Handle for standalone calling.collect (without play).
- [`StreamAction`](/reference/python/signalwire/relay/call/stream-action) — Handle for an active stream operation.
- [`TapAction`](/reference/python/signalwire/relay/call/tap-action) — Handle for an active tap operation.
- [`TranscribeAction`](/reference/python/signalwire/relay/call/transcribe-action) — Handle for an active transcribe operation.

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)
