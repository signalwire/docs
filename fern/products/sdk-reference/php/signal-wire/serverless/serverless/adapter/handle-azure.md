---
slug: "/reference/php/signal-wire/serverless/serverless/adapter/handle-azure"
title: "handleAzure"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Serverless\\Adapter::handleAzure"
  parent: "SignalWire\\Serverless\\Adapter"
  module: "SignalWire.Serverless"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php"
  visibility: "public"
---
# `handleAzure`

Handle an Azure Functions invocation.

Extracts method, path, headers, and body from the Azure request
array, calls agent->handleRequest(), and returns an Azure-compatible
response array.

**Modifiers:** `static`

## Signature

```php
public static function handleAzure(object $agent, array $request): array
```

## Parameters

| Name      | Type     | Required | Default | Description                                            |
| --------- | -------- | -------- | ------- | ------------------------------------------------------ |
| `agent`   | `object` | yes      | —       | An AgentBase or Service instance with handleRequest(). |
| `request` | `array`  | yes      | —       | The Azure Functions HTTP request array.                |

## Returns

`array` — Azure response format {status, headers, body}.

## Source

[`/src/src/SignalWire/Serverless/Adapter.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php)

Line 127.
