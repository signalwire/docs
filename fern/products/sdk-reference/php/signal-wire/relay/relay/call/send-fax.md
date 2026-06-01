---
slug: "/reference/php/signal-wire/relay/relay/call/send-fax"
title: "sendFax"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::sendFax"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `sendFax`

## Signature

```php
public function sendFax(
    string $document,
    ?string $identity = NULL,
    array $opts = array (
)
): SignalWire\Relay\FaxAction
```

## Parameters

| Name       | Type      | Required | Default     | Description |
| ---------- | --------- | -------- | ----------- | ----------- |
| `document` | `string`  | yes      | —           | —           |
| `identity` | `?string` | no       | `NULL`      | —           |
| `opts`     | `array`   | no       | `array (
)` | —           |

## Returns

`SignalWire\Relay\FaxAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 476.
