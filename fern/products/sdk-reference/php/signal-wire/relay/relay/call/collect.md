---
slug: "/reference/php/signal-wire/relay/relay/call/collect"
title: "collect"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::collect"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `collect`

Standalone collect (digits / speech / both).

## Signature

```php
public function collect(array $opts = array (
)): SignalWire\Relay\CollectAction
```

## Parameters

| Name   | Type    | Required | Default     | Description                                                                                                                                                                                        |
| ------ | ------- | -------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `opts` | `array` | no       | `array (
)` | - \`\`digits\`\` / \`\`speech\`\` / \`\`initial\_timeout\`\` etc forwarded as-is&#xA;  \- \`\`control\_id\`\`&#xA;  \- \`\`start\_input\_timers\`\` (bool)&#xA;  \- \`\`on\_completed\`\` callback |

## Returns

`SignalWire\Relay\CollectAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 439.
