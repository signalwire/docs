---
slug: "/reference/python/signalwire/core/swml-handler/verb-handler-registry/get-handler"
title: "get_handler"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_handler.VerbHandlerRegistry.get_handler"
  parent: "signalwire.core.swml_handler.VerbHandlerRegistry"
  module: "signalwire.core.swml_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py"
---
# `get_handler`

Get the handler for a specific verb

## Signature

```python
get_handler(verb_name: str) -> Optional[SWMLVerbHandler]
```

## Parameters

| Name        | Type  | Required | Default | Description          |
| ----------- | ----- | -------- | ------- | -------------------- |
| `verb_name` | `str` | yes      | —       | The name of the verb |

## Returns

`Optional[SWMLVerbHandler]` — The handler if found, None otherwise

## Source

[`/src/signalwire/signalwire/core/swml_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py)

Line 235.
