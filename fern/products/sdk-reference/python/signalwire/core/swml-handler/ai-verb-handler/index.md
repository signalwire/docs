---
slug: "/reference/python/signalwire/core/swml-handler/ai-verb-handler"
title: "AIVerbHandler"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.swml_handler.AIVerbHandler"
  parent: "signalwire.core.swml_handler"
  module: "signalwire.core.swml_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py"
---
# `AIVerbHandler`

Handler for the SWML 'ai' verb

The 'ai' verb is complex and requires specialized handling, particularly
for managing prompts, SWAIG functions, and AI configurations.

## Signature

```python
class AIVerbHandler(SWMLVerbHandler)
```

## Inheritance

**Extends:** [SWMLVerbHandler](/reference/python/signalwire/core/swml-handler/swml-verb-handler)

## Methods

- [`build_config`](/reference/python/signalwire/core/swml-handler/ai-verb-handler/build-config) — Build a configuration for the AI verb
- [`get_verb_name`](/reference/python/signalwire/core/swml-handler/ai-verb-handler/get-verb-name) — Get the name of the verb this handler handles
- [`validate_config`](/reference/python/signalwire/core/swml-handler/ai-verb-handler/validate-config) — Validate the configuration for the AI verb

## Source

[`/src/signalwire/signalwire/core/swml_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py)

Line 67.
