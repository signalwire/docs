---
slug: "/reference/php/signal-wire/relay/relay/fax-action/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\FaxAction::__construct"
  parent: "SignalWire\\Relay\\FaxAction"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
  visibility: "public"
---
# `__construct`

## Signature

```php
public function __construct(
    string $controlId,
    string $callId,
    string $nodeId,
    object $client,
    string $faxType = 'send'
)
```

## Parameters

| Name        | Type     | Required | Default  | Description         |
| ----------- | -------- | -------- | -------- | ------------------- |
| `controlId` | `string` | yes      | —        | —                   |
| `callId`    | `string` | yes      | —        | —                   |
| `nodeId`    | `string` | yes      | —        | —                   |
| `client`    | `object` | yes      | —        | —                   |
| `faxType`   | `string` | no       | `'send'` | 'send' or 'receive' |

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 405.
