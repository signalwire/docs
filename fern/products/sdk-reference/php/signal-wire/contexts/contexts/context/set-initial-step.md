---
slug: "/reference/php/signal-wire/contexts/contexts/context/set-initial-step"
title: "setInitialStep"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\Context::setInitialStep"
  parent: "SignalWire\\Contexts\\Context"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `setInitialStep`

Set which step the context starts on when entered.

By default, a context starts on its first step (index 0). Use
this to skip a preamble step on re-entry via change\_context.

## Signature

```php
public function setInitialStep(string $stepName): SignalWire\Contexts\Context
```

## Parameters

| Name       | Type     | Required | Default | Description                   |
| ---------- | -------- | -------- | ------- | ----------------------------- |
| `stepName` | `string` | yes      | —       | name of the step to start on. |

## Returns

`SignalWire\Contexts\Context`

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 771.
