---
slug: "/reference/python/signalwire/core/swml-builder/swml-builder"
title: "SWMLBuilder"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.swml_builder.SWMLBuilder"
  parent: "signalwire.core.swml_builder"
  module: "signalwire.core.swml_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py"
---
# `SWMLBuilder`

Fluent builder for SWML documents

This class provides a fluent interface for building SWML documents
by chaining method calls. It delegates to an underlying SWMLService
instance for the actual document creation.

## Signature

```python
class SWMLBuilder
```

## Properties

| Name      | Type      | Required | Default | Description |
| --------- | --------- | -------- | ------- | ----------- |
| `service` | `service` | yes      | —       | —           |

## Methods

- [`__getattr__`](/reference/python/signalwire/core/swml-builder/swml-builder/getattr) — Dynamically generate and return SWML verb methods when accessed
- [`__init__`](/reference/python/signalwire/core/swml-builder/swml-builder/init) — Initialize with a SWMLService instance
- [`add_section`](/reference/python/signalwire/core/swml-builder/swml-builder/add-section) — Add a new section to the document
- [`ai`](/reference/python/signalwire/core/swml-builder/swml-builder/ai) — Add an 'ai' verb to the main section
- [`answer`](/reference/python/signalwire/core/swml-builder/swml-builder/answer) — Add an 'answer' verb to the main section
- [`build`](/reference/python/signalwire/core/swml-builder/swml-builder/build) — Build and return the SWML document
- [`hangup`](/reference/python/signalwire/core/swml-builder/swml-builder/hangup) — Add a 'hangup' verb to the main section
- [`play`](/reference/python/signalwire/core/swml-builder/swml-builder/play) — Add a 'play' verb to the main section
- [`render`](/reference/python/signalwire/core/swml-builder/swml-builder/render) — Build and render the SWML document as a JSON string
- [`reset`](/reference/python/signalwire/core/swml-builder/swml-builder/reset) — Reset the document to an empty state
- [`say`](/reference/python/signalwire/core/swml-builder/swml-builder/say) — Add a 'play' verb with say: prefix for text-to-speech

## Source

[`/src/signalwire/signalwire/core/swml_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py)

Line 30.
