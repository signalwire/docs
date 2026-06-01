---
slug: "/reference/php/signal-wire/relay/relay/client/run"
title: "run"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client::run"
  parent: "SignalWire\\Relay\\Client"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
  visibility: "public"
---
# `run`

Main event loop – reads messages until disconnect.

Auto-reconnects with exponential backoff on transport errors,
preserving authorization\_state across reconnects so the server
can fast-path the session resumption.

## Signature

```php
public function run(): void
```

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 285.
