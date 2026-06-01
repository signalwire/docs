---
slug: "/reference/python/signalwire/core/contexts"
title: "contexts"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.core.contexts"
  parent: "signalwire.core"
  module: "signalwire.core"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `contexts`

Copyright (c) 2025 SignalWire

This file is part of the SignalWire SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## Signature

```python
module contexts
```

## Constants

| Name                         | Type                         | Required | Default | Description |
| ---------------------------- | ---------------------------- | -------- | ------- | ----------- |
| `MAX_CONTEXTS`               | `MAX_CONTEXTS`               | yes      | —       | —           |
| `MAX_STEPS_PER_CONTEXT`      | `MAX_STEPS_PER_CONTEXT`      | yes      | —       | —           |
| `RESERVED_NATIVE_TOOL_NAMES` | `RESERVED_NATIVE_TOOL_NAMES` | yes      | —       | —           |

## Functions

- [`create_simple_context`](/reference/python/signalwire/core/contexts/create-simple-context) — Helper function to create a simple single context

## Classes

- [`Context`](/reference/python/signalwire/core/contexts/context) — A single context containing an ordered list of steps.
- [`ContextBuilder`](/reference/python/signalwire/core/contexts/context-builder) — Builder for multi-step, multi-context AI agent workflows.
- [`GatherInfo`](/reference/python/signalwire/core/contexts/gather-info) — Configuration for gathering information in a step via the C-side gather\_info system.
- [`GatherQuestion`](/reference/python/signalwire/core/contexts/gather-question) — Represents a single question in a gather\_info configuration
- [`Step`](/reference/python/signalwire/core/contexts/step) — Represents a single step within a context

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)
