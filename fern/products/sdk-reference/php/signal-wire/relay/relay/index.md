---
slug: "/reference/php/signal-wire/relay/relay"
title: "Relay"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "module"
  language: "php"
  qualified_name: "SignalWire\\Relay"
  module: "SignalWire.Relay"
---
# `Relay`

## Signature

```php
namespace SignalWire\Relay
```

## Classes

- [`Action`](/reference/php/signal-wire/relay/relay/action) — Base class for all RELAY call actions (play, record, collect, etc.).
- [`AIAction`](/reference/php/signal-wire/relay/relay/ai-action) — Handle for calling.ai operations.
- [`Call`](/reference/php/signal-wire/relay/relay/call) — Represents a RELAY voice call.
- [`Client`](/reference/php/signal-wire/relay/relay/client) — RELAY Client – manages the WebSocket connection to SignalWire, sends
- [`CollectAction`](/reference/php/signal-wire/relay/relay/collect-action) — Handle for calling.collect (and play\_and\_collect) operations.
- [`Constants`](/reference/php/signal-wire/relay/relay/constants)
- [`DetectAction`](/reference/php/signal-wire/relay/relay/detect-action) — Handle for calling.detect operations (fax-tone, digit, machine, etc.).
- [`Event`](/reference/php/signal-wire/relay/relay/event)
- [`FaxAction`](/reference/php/signal-wire/relay/relay/fax-action) — Handle for calling.fax operations (send or receive).
- [`Message`](/reference/php/signal-wire/relay/relay/message) — Represents a RELAY messaging message (SMS / MMS).
- [`PayAction`](/reference/php/signal-wire/relay/relay/pay-action) — Handle for calling.pay operations.
- [`PlayAction`](/reference/php/signal-wire/relay/relay/play-action) — Handle for calling.play operations.
- [`RecordAction`](/reference/php/signal-wire/relay/relay/record-action) — Handle for calling.record operations.
- [`RelayError`](/reference/php/signal-wire/relay/relay/relay-error) — Exception type for RELAY-protocol-level failures.
- [`StreamAction`](/reference/php/signal-wire/relay/relay/stream-action) — Handle for calling.stream operations.
- [`TapAction`](/reference/php/signal-wire/relay/relay/tap-action) — Handle for calling.tap operations.
- [`TranscribeAction`](/reference/php/signal-wire/relay/relay/transcribe-action) — Handle for calling.transcribe operations.
- [`WebSocket`](/reference/php/signal-wire/relay/relay/web-socket) — Minimal RFC 6455 WebSocket client built on PHP streams.
