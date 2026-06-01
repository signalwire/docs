---
slug: "/reference/php/signal-wire/relay/relay/client/execute"
title: "execute"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client::execute"
  parent: "SignalWire\\Relay\\Client"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
  visibility: "public"
---
# `execute`

Send a JSON-RPC request and synchronously wait for the matching

response.  Returns the "result" portion of the response.

## Signature

```php
public function execute(string $method, array $params = array (
)): array
```

## Parameters

| Name     | Type     | Required | Default     | Description |
| -------- | -------- | -------- | ----------- | ----------- |
| `method` | `string` | yes      | —           | —           |
| `params` | `array`  | no       | `array (
)` | —           |

## Returns

`array`

## Throws

- `\RuntimeException` — on error responses or transport timeout.

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 320.
