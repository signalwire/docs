---
slug: "/reference/python/signalwire/core/swaig-function/swaig-function"
title: "SWAIGFunction"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.swaig_function.SWAIGFunction"
  parent: "signalwire.core.swaig_function"
  module: "signalwire.core.swaig_function"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py"
---
# `SWAIGFunction`

Represents a SWAIG function — i.e., a tool the AI model can call.

A SWAIG function is exactly the same concept as a "tool" in native
OpenAI / Anthropic tool calling. Each SWAIGFunction is rendered into
the OpenAI tool schema format and sent to the model on every turn:

```
{"type": "function", "function": {
    "name":        self.name,
    "description": self.description,
    "parameters":  self.parameters,
}}
```

The model parses `description` (and the `description` inside each
parameter) to decide WHEN to call the tool and HOW to fill in the
arguments. Both fields are prompt-engineered text — the quality of
your descriptions directly drives tool-selection accuracy.

Use AgentBase.define\_tool() to create one (it builds the
SWAIGFunction for you and registers it). Use the @agent.tool()
decorator for the same thing in class-based agents.

## Signature

```python
class SWAIGFunction
```

## Examples

```python
{"type": "function", "function": {
    "name":        self.name,
    "description": self.description,
    "parameters":  self.parameters,
}}
```

## Properties

| Name                 | Type                 | Required | Default | Description |
| -------------------- | -------------------- | -------- | ------- | ----------- |
| `description`        | `description`        | yes      | —       | —           |
| `extra_swaig_fields` | `extra_swaig_fields` | yes      | —       | —           |
| `fillers`            | `fillers`            | yes      | —       | —           |
| `handler`            | `handler`            | yes      | —       | —           |
| `is_external`        | `is_external`        | yes      | —       | —           |
| `is_typed_handler`   | `is_typed_handler`   | yes      | —       | —           |
| `name`               | `name`               | yes      | —       | —           |
| `parameters`         | `parameters`         | yes      | —       | —           |
| `required`           | `required`           | yes      | —       | —           |
| `secure`             | `secure`             | yes      | —       | —           |
| `wait_file`          | `wait_file`          | yes      | —       | —           |
| `wait_file_loops`    | `wait_file_loops`    | yes      | —       | —           |
| `webhook_url`        | `webhook_url`        | yes      | —       | —           |

## Methods

- [`__call__`](/reference/python/signalwire/core/swaig-function/swaig-function/call) — Call the underlying handler function
- [`__init__`](/reference/python/signalwire/core/swaig-function/swaig-function/init) — Initialize a new SWAIG function.
- [`execute`](/reference/python/signalwire/core/swaig-function/swaig-function/execute) — Execute the function with the given arguments
- [`to_swaig`](/reference/python/signalwire/core/swaig-function/swaig-function/to-swaig) — Convert this function to a SWAIG-compatible JSON object for SWML
- [`validate_args`](/reference/python/signalwire/core/swaig-function/swaig-function/validate-args) — Validate the arguments against the parameter schema.

## Source

[`/src/signalwire/signalwire/core/swaig_function.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py)

Line 21.
