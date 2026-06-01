---
slug: "/reference/php/signal-wire/serverless/serverless/adapter"
title: "Adapter"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Serverless\\Adapter"
  parent: "SignalWire\\Serverless"
  module: "SignalWire.Serverless"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php"
---
# `Adapter`

Auto-detect and handle serverless environments (Lambda, GCF, Azure, CGI)

or fall back to the built-in PHP server.

## Signature

```php
class Adapter
```

## Methods

- [`detect`](/reference/php/signal-wire/serverless/serverless/adapter/detect) — Detect the current runtime environment.
- [`handleAzure`](/reference/php/signal-wire/serverless/serverless/adapter/handle-azure) — Handle an Azure Functions invocation.
- [`handleCgi`](/reference/php/signal-wire/serverless/serverless/adapter/handle-cgi) — Handle a CGI/FastCGI invocation.
- [`handleGcf`](/reference/php/signal-wire/serverless/serverless/adapter/handle-gcf) — Handle a Google Cloud Function invocation.
- [`handleLambda`](/reference/php/signal-wire/serverless/serverless/adapter/handle-lambda) — Handle an AWS Lambda (API Gateway) invocation.
- [`serve`](/reference/php/signal-wire/serverless/serverless/adapter/serve) — Auto-detect the runtime environment and serve the agent.

## Source

[`/src/src/SignalWire/Serverless/Adapter.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Serverless/Adapter.php)

Line 11.
