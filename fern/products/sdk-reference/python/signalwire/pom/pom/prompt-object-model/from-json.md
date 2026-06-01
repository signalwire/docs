---
slug: "/reference/python/signalwire/pom/pom/prompt-object-model/from-json"
title: "from_json"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.PromptObjectModel.from_json"
  parent: "signalwire.pom.pom.PromptObjectModel"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `from_json`

Create a PromptObjectModel instance from JSON data.

**Modifiers:** `static`

## Signature

```python
@staticmethod
from_json(json_data: Union[str, dict]) -> PromptObjectModel
```

## Parameters

| Name        | Type               | Required | Default | Description                                 |
| ----------- | ------------------ | -------- | ------- | ------------------------------------------- |
| `json_data` | `Union[str, dict]` | yes      | —       | Either a JSON string or a parsed dictionary |

## Returns

`PromptObjectModel` — A new PromptObjectModel populated with the data from the JSON

## Throws

- `ValueError` — If the JSON is not properly formatted

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 247.
