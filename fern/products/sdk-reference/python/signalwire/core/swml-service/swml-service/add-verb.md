---
slug: "/reference/python/signalwire/core/swml-service/swml-service/add-verb"
title: "add_verb"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService.add_verb"
  parent: "signalwire.core.swml_service.SWMLService"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
---
# `add_verb`

Add a verb to the main section of the current document

## Signature

```python
add_verb(verb_name: str, config: Union[Dict[str, Any], int]) -> bool
```

## Parameters

| Name        | Type                         | Required | Default | Description                                                                |
| ----------- | ---------------------------- | -------- | ------- | -------------------------------------------------------------------------- |
| `verb_name` | `str`                        | yes      | —       | The name of the verb to add                                                |
| `config`    | `Union[Dict[str, Any], int]` | yes      | —       | Configuration for the verb or direct value for certain verbs (e.g., sleep) |

## Returns

`bool` — True if the verb was added successfully, False otherwise

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 433.
