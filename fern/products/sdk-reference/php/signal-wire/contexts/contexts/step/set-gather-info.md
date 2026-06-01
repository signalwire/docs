---
slug: "/reference/php/signal-wire/contexts/contexts/step/set-gather-info"
title: "setGatherInfo"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\Step::setGatherInfo"
  parent: "SignalWire\\Contexts\\Step"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `setGatherInfo`

Initialize the gather\_info configuration for this step. Questions are

presented one at a time via dynamic step instruction re-injection,
producing zero tool\_call/tool\_result entries in LLM-visible history.

After calling this, use addGatherQuestion() to define questions.

## Signature

```php
public function setGatherInfo(
    ?string $output_key = NULL,
    ?string $completion_action = NULL,
    ?string $prompt = NULL
): SignalWire\Contexts\Step
```

## Parameters

| Name                | Type      | Required | Default | Description                                                                       |
| ------------------- | --------- | -------- | ------- | --------------------------------------------------------------------------------- |
| `output_key`        | `?string` | no       | `NULL`  | Key in global\_data to store answers under.                                       |
| `completion_action` | `?string` | no       | `NULL`  | Where to go when all questions are answered ('next\_step', a step name, or null). |
| `prompt`            | `?string` | no       | `NULL`  | Preamble text injected once when entering the gather step.                        |

## Returns

`SignalWire\Contexts\Step`

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 360.
