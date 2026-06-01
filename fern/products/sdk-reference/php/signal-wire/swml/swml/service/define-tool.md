---
slug: "/reference/php/signal-wire/swml/swml/service/define-tool"
title: "defineTool"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Service::defineTool"
  parent: "SignalWire\\SWML\\Service"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php"
  visibility: "public"
---
# `defineTool`

Define a SWAIG function the AI can call.

Tool descriptions and parameter descriptions are LLM-facing prompt
engineering, not internal documentation. See PORTING\_GUIDE for guidance.

## Signature

```php
public function defineTool(
    string $name,
    string $description,
    array $parameters,
    callable $handler,
    bool $secure = false
): static
```

## Parameters

| Name          | Type       | Required | Default | Description |
| ------------- | ---------- | -------- | ------- | ----------- |
| `name`        | `string`   | yes      | —       | —           |
| `description` | `string`   | yes      | —       | —           |
| `parameters`  | `array`    | yes      | —       | —           |
| `handler`     | `callable` | yes      | —       | —           |
| `secure`      | `bool`     | no       | `false` | —           |

## Returns

`static`

## Source

[`/src/src/SignalWire/SWML/Service.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php)

Line 226.
