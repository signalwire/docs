---
slug: "/reference/php/signal-wire/relay/relay/action/execute-subcommand"
title: "executeSubcommand"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Action::executeSubcommand"
  parent: "SignalWire\\Relay\\Action"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
  visibility: "public"
---
# `executeSubcommand`

Send a sub-command RPC through the client.

The payload always includes control\_id, call\_id, and node\_id so
the server knows which action instance to target.

## Signature

```php
public function executeSubcommand(string $method, array $extraParams = array (
)): void
```

## Parameters

| Name          | Type     | Required | Default     | Description |
| ------------- | -------- | -------- | ----------- | ----------- |
| `method`      | `string` | yes      | —           | —           |
| `extraParams` | `array`  | no       | `array (
)` | —           |

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 211.
