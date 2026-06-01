---
slug: "/reference/python/signalwire/utils/schema-utils/schema-utils/get-verb-required-properties"
title: "get_verb_required_properties"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.utils.schema_utils.SchemaUtils.get_verb_required_properties"
  parent: "signalwire.utils.schema_utils.SchemaUtils"
  module: "signalwire.utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py"
---
# `get_verb_required_properties`

Get the required properties for a specific verb

## Signature

```python
get_verb_required_properties(verb_name: str) -> List[str]
```

## Parameters

| Name        | Type  | Required | Default | Description                                       |
| ----------- | ----- | -------- | ------- | ------------------------------------------------- |
| `verb_name` | `str` | yes      | —       | The name of the verb (e.g., "ai", "answer", etc.) |

## Returns

`List[str]` — List of required property names for the verb or an empty list if not found

## Source

[`/src/signalwire/signalwire/utils/schema_utils.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py)

Line 243.
