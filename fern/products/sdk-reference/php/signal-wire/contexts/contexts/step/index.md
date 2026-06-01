---
slug: "/reference/php/signal-wire/contexts/contexts/step"
title: "Step"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\Step"
  parent: "SignalWire\\Contexts"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
---
# `Step`

## Signature

```php
class Step
```

## Methods

- [`__construct`](/reference/php/signal-wire/contexts/contexts/step/construct)
- [`addBullets`](/reference/php/signal-wire/contexts/contexts/step/add-bullets) — Add a POM section with bullet points.
- [`addGatherQuestion`](/reference/php/signal-wire/contexts/contexts/step/add-gather-question) — Add a question to this step's gather\_info. Initializes
- [`addSection`](/reference/php/signal-wire/contexts/contexts/step/add-section) — Add a POM section with a body paragraph.
- [`clearSections`](/reference/php/signal-wire/contexts/contexts/step/clear-sections) — Clear all content (both text and sections).
- [`getGatherInfo`](/reference/php/signal-wire/contexts/contexts/step/get-gather-info)
- [`getName`](/reference/php/signal-wire/contexts/contexts/step/get-name)
- [`getValidContexts`](/reference/php/signal-wire/contexts/contexts/step/get-valid-contexts)
- [`getValidSteps`](/reference/php/signal-wire/contexts/contexts/step/get-valid-steps)
- [`setEnd`](/reference/php/signal-wire/contexts/contexts/step/set-end) — Mark this step as terminal for the step flow.
- [`setFunctions`](/reference/php/signal-wire/contexts/contexts/step/set-functions) — Set which non-internal functions are callable while this step is
- [`setGatherInfo`](/reference/php/signal-wire/contexts/contexts/step/set-gather-info) — Initialize the gather\_info configuration for this step. Questions are
- [`setResetConsolidate`](/reference/php/signal-wire/contexts/contexts/step/set-reset-consolidate)
- [`setResetFullReset`](/reference/php/signal-wire/contexts/contexts/step/set-reset-full-reset)
- [`setResetSystemPrompt`](/reference/php/signal-wire/contexts/contexts/step/set-reset-system-prompt)
- [`setResetUserPrompt`](/reference/php/signal-wire/contexts/contexts/step/set-reset-user-prompt)
- [`setSkipToNextStep`](/reference/php/signal-wire/contexts/contexts/step/set-skip-to-next-step)
- [`setSkipUserTurn`](/reference/php/signal-wire/contexts/contexts/step/set-skip-user-turn)
- [`setStepCriteria`](/reference/php/signal-wire/contexts/contexts/step/set-step-criteria)
- [`setText`](/reference/php/signal-wire/contexts/contexts/step/set-text) — Set the step's prompt text directly. Mutually exclusive with POM sections.
- [`setValidContexts`](/reference/php/signal-wire/contexts/contexts/step/set-valid-contexts)
- [`setValidSteps`](/reference/php/signal-wire/contexts/contexts/step/set-valid-steps)
- [`toArray`](/reference/php/signal-wire/contexts/contexts/step/to-array)

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 169.
