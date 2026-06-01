---
slug: "/reference/python/signalwire/core/swml-handler/swml-verb-handler"
title: "SWMLVerbHandler"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.swml_handler.SWMLVerbHandler"
  parent: "signalwire.core.swml_handler"
  module: "signalwire.core.swml_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py"
---
# `SWMLVerbHandler`

Base interface for SWML verb handlers

This abstract class defines the interface that all SWML verb handlers
must implement. Verb handlers provide specialized logic for complex
SWML verbs that cannot be handled generically.

## Signature

```python
class SWMLVerbHandler(ABC)
```

## Inheritance

**Extends:** `ABC`

## Methods

- [`build_config`](/reference/python/signalwire/core/swml-handler/swml-verb-handler/build-config) — Build a configuration for this verb from the provided arguments
- [`get_verb_name`](/reference/python/signalwire/core/swml-handler/swml-verb-handler/get-verb-name) — Get the name of the verb this handler handles
- [`validate_config`](/reference/python/signalwire/core/swml-handler/swml-verb-handler/validate-config) — Validate the configuration for this verb

## Source

[`/src/signalwire/signalwire/core/swml_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py)

Line 21.
