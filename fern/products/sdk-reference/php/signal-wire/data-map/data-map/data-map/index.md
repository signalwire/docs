---
slug: "/reference/php/signal-wire/data-map/data-map/data-map"
title: "DataMap"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap"
  parent: "SignalWire\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
---
# `DataMap`

## Signature

```php
class DataMap
```

## Methods

- [`__construct`](/reference/php/signal-wire/data-map/data-map/data-map/construct)
- [`body`](/reference/php/signal-wire/data-map/data-map/data-map/body) — Set body on the last webhook.
- [`createExpressionTool`](/reference/php/signal-wire/data-map/data-map/data-map/create-expression-tool) — Build a complete SWAIG function definition with expressions only.
- [`createSimpleApiTool`](/reference/php/signal-wire/data-map/data-map/data-map/create-simple-api-tool) — Build a complete SWAIG function definition with a single webhook.
- [`description`](/reference/php/signal-wire/data-map/data-map/data-map/description) — Alias for purpose(). Sets the LLM-facing tool description.
- [`errorKeys`](/reference/php/signal-wire/data-map/data-map/data-map/error-keys) — Set error\_keys on the last webhook.
- [`expression`](/reference/php/signal-wire/data-map/data-map/data-map/expression) — Add an expression rule.
- [`fallbackOutput`](/reference/php/signal-wire/data-map/data-map/data-map/fallback-output) — Set global fallback output.
- [`foreach`](/reference/php/signal-wire/data-map/data-map/data-map/foreach) — Set foreach on the last webhook.
- [`globalErrorKeys`](/reference/php/signal-wire/data-map/data-map/data-map/global-error-keys) — Set global error\_keys.
- [`output`](/reference/php/signal-wire/data-map/data-map/data-map/output) — Set output on the last webhook.
- [`parameter`](/reference/php/signal-wire/data-map/data-map/data-map/parameter) — Add a parameter to this data-map tool — the `$description` is
- [`params`](/reference/php/signal-wire/data-map/data-map/data-map/params) — Set params on the last webhook.
- [`purpose`](/reference/php/signal-wire/data-map/data-map/data-map/purpose) — Set the LLM-facing tool description (the "purpose"). PROMPT
- [`toSwaigFunction`](/reference/php/signal-wire/data-map/data-map/data-map/to-swaig-function) — Serialize to a SWAIG function definition array.
- [`webhook`](/reference/php/signal-wire/data-map/data-map/data-map/webhook) — Add a webhook definition.
- [`webhookExpressions`](/reference/php/signal-wire/data-map/data-map/data-map/webhook-expressions) — Set expressions on the last webhook.

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 9.
