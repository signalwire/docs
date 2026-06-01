---
slug: "/reference/python/signalwire/core/swml-builder/swml-builder/getattr"
title: "__getattr__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_builder.SWMLBuilder.__getattr__"
  parent: "signalwire.core.swml_builder.SWMLBuilder"
  module: "signalwire.core.swml_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py"
---
# `__getattr__`

Dynamically generate and return SWML verb methods when accessed

This method is called when an attribute lookup fails through the normal
mechanisms. It checks if the attribute name corresponds to a SWML verb
defined in the schema, and if so, dynamically creates a method for that verb.

## Signature

```python
__getattr__(name: str) -> Any
```

## Parameters

| Name   | Type  | Required | Default | Description                              |
| ------ | ----- | -------- | ------- | ---------------------------------------- |
| `name` | `str` | yes      | —       | The name of the attribute being accessed |

## Returns

`Any` — The dynamically created verb method if name is a valid SWML verb, otherwise raises AttributeError

## Throws

- `AttributeError` — If name is not a valid SWML verb

## Source

[`/src/signalwire/signalwire/core/swml_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py)

Line 326.
