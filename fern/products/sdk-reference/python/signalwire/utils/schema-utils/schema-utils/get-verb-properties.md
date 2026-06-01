---
slug: "/reference/python/signalwire/utils/schema-utils/schema-utils/get-verb-properties"
title: "get_verb_properties"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.utils.schema_utils.SchemaUtils.get_verb_properties"
  parent: "signalwire.utils.schema_utils.SchemaUtils"
  module: "signalwire.utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py"
---
# `get_verb_properties`

Get the properties for a specific verb

## Signature

```python
get_verb_properties(verb_name: str) -> Dict[str, Any]
```

## Parameters

| Name        | Type  | Required | Default | Description                                       |
| ----------- | ----- | -------- | ------- | ------------------------------------------------- |
| `verb_name` | `str` | yes      | —       | The name of the verb (e.g., "ai", "answer", etc.) |

## Returns

`Dict[str, Any]` — The properties for the verb or an empty dict if not found

## Source

[`/src/signalwire/signalwire/utils/schema_utils.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py)

Line 227.
