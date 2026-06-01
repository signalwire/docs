---
slug: "/reference/php/signal-wire/serverless/serverless/adapter/handle-lambda"
title: "handleLambda"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Serverless\\Adapter::handleLambda"
  parent: "SignalWire\\Serverless\\Adapter"
  module: "SignalWire.Serverless"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php"
  visibility: "public"
---
# `handleLambda`

Handle an AWS Lambda (API Gateway) invocation.

Extracts method, path, headers, and body from the API Gateway event
format, calls agent->handleRequest(), and returns an API Gateway
compatible response.

**Modifiers:** `static`

## Signature

```php
public static function handleLambda(object $agent, array $event, object $context): array
```

## Parameters

| Name      | Type     | Required | Default | Description                                            |
| --------- | -------- | -------- | ------- | ------------------------------------------------------ |
| `agent`   | `object` | yes      | —       | An AgentBase or Service instance with handleRequest(). |
| `event`   | `array`  | yes      | —       | The API Gateway event payload.                         |
| `context` | `object` | yes      | —       | The Lambda context object.                             |

## Returns

`array` — API Gateway response format {statusCode, headers, body}.

## Source

[`/src/src/SignalWire/Serverless/Adapter.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php)

Line 51.
