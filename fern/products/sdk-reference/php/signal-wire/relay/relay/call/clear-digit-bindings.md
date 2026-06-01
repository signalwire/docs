---
slug: "/reference/php/signal-wire/relay/relay/call/clear-digit-bindings"
title: "clearDigitBindings"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::clearDigitBindings"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `clearDigitBindings`

Clear all digit bindings, optionally filtered by realm.

Mirrors Python's Call.clear\_digit\_bindings(\*, realm=None, \*\*kwargs).

## Signature

```php
public function clearDigitBindings(
    ?string $realm = NULL,
    array $kwargs = array (
)
): array
```

## Parameters

| Name     | Type      | Required | Default     | Description                                                                         |
| -------- | --------- | -------- | ----------- | ----------------------------------------------------------------------------------- |
| `realm`  | `?string` | no       | `NULL`      | Optional realm filter — restricts clearing to bindings registered under that realm. |
| `kwargs` | `array`   | no       | `array (
)` | Additional params forwarded to the wire call.                                       |

## Returns

`array`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 273.
