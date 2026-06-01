---
slug: "/reference/python/signalwire/utils/schema-utils/schema-utils/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.utils.schema_utils.SchemaUtils.__init__"
  parent: "signalwire.utils.schema_utils.SchemaUtils"
  module: "signalwire.utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py"
---
# `__init__`

Initialize the schema utilities.

## Signature

```python
__init__(schema_path: Optional[str] = None, schema_validation: bool = True)
```

## Parameters

| Name                | Type            | Required | Default | Description                                                                                               |
| ------------------- | --------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------- |
| `schema_path`       | `Optional[str]` | no       | `None`  | Path to the schema file                                                                                   |
| `schema_validation` | `bool`          | no       | `True`  | Enable schema validation. Can also be disabled via SWML\_SKIP\_SCHEMA\_VALIDATION=1 environment variable. |

## Source

[`/src/signalwire/signalwire/utils/schema_utils.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py)

Line 45.
