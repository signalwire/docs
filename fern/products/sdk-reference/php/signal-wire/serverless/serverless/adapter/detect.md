---
slug: "/reference/php/signal-wire/serverless/serverless/adapter/detect"
title: "detect"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Serverless\\Adapter::detect"
  parent: "SignalWire\\Serverless\\Adapter"
  module: "SignalWire.Serverless"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php"
  visibility: "public"
---
# `detect`

Detect the current runtime environment.

**Modifiers:** `static`

## Signature

```php
public static function detect(): string
```

## Returns

`string` — One of 'lambda', 'gcf', 'azure', 'cgi', or 'server'.

## Source

[`/src/src/SignalWire/Serverless/Adapter.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php)

Line 18.
