---
slug: "/reference/php/signal-wire/relay/relay/play-action/resolve"
title: "resolve"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\PlayAction::resolve"
  parent: "SignalWire\\Relay\\PlayAction"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
  visibility: "public"
---
# `resolve`

Mark this action as completed.

The optional $result is stored and the onCompleted callback is
fired exactly once.

## Signature

```php
public function resolve($result = NULL): void
```

## Parameters

| Name     | Type    | Required | Default | Description |
| -------- | ------- | -------- | ------- | ----------- |
| `result` | `mixed` | no       | `NULL`  | —           |

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 167.
