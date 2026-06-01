---
slug: "/reference/php/signal-wire/swml/swml/service/call"
title: "__call"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Service::__call"
  parent: "SignalWire\\SWML\\Service"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php"
  visibility: "public"
---
# `__call`

Dynamic verb methods from schema.

$service->answer('main', \['max\_duration' => 3600]);
$service->sleep('main', 2000);
$service->hangup();

## Signature

```php
public function __call(string $method, array $args): static
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `method` | `string` | yes      | —       | —           |
| `args`   | `array`  | yes      | —       | —           |

## Returns

`static`

## Source

[`/src/src/SignalWire/SWML/Service.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php)

Line 114.
