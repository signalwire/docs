---
slug: "/reference/python/signalwire/utils/schema-utils/schema-utils/validate-verb"
title: "validate_verb"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.utils.schema_utils.SchemaUtils.validate_verb"
  parent: "signalwire.utils.schema_utils.SchemaUtils"
  module: "signalwire.utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py"
---
# `validate_verb`

Validate a verb configuration against the schema.

Performs full JSON Schema validation including type checking and nested
object validation using jsonschema-rs.

## Signature

```python
validate_verb(
    verb_name: str,
    verb_config: Dict[str, Any]
) -> Tuple[bool, List[str]]
```

## Parameters

| Name          | Type             | Required | Default | Description                                       |
| ------------- | ---------------- | -------- | ------- | ------------------------------------------------- |
| `verb_name`   | `str`            | yes      | —       | The name of the verb (e.g., "ai", "answer", etc.) |
| `verb_config` | `Dict[str, Any]` | yes      | —       | The configuration for the verb                    |

## Returns

`Tuple[bool, List[str]]` — (is\_valid, error\_messages) tuple

## Source

[`/src/signalwire/signalwire/utils/schema_utils.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py)

Line 260.
