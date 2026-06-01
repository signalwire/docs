---
slug: "/reference/python/signalwire/utils/schema-utils/schema-utils"
title: "SchemaUtils"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.utils.schema_utils.SchemaUtils"
  parent: "signalwire.utils.schema_utils"
  module: "signalwire.utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py"
---
# `SchemaUtils`

Utility class for loading and working with SWML schemas

## Signature

```python
class SchemaUtils
```

## Properties

| Name                        | Type          | Required | Default | Description                                        |
| --------------------------- | ------------- | -------- | ------- | -------------------------------------------------- |
| `full_validation_available` | `bool`        | yes      | —       | Check if full JSON Schema validation is available. |
| `log`                       | `log`         | yes      | —       | —                                                  |
| `schema`                    | `schema`      | yes      | —       | —                                                  |
| `schema_path`               | `schema_path` | yes      | —       | —                                                  |
| `verbs`                     | `verbs`       | yes      | —       | —                                                  |

## Methods

- [`__init__`](/reference/python/signalwire/utils/schema-utils/schema-utils/init) — Initialize the schema utilities.
- [`generate_method_body`](/reference/python/signalwire/utils/schema-utils/schema-utils/generate-method-body) — Generate the method body implementation for a verb
- [`generate_method_signature`](/reference/python/signalwire/utils/schema-utils/schema-utils/generate-method-signature) — Generate a Python method signature for a verb
- [`get_all_verb_names`](/reference/python/signalwire/utils/schema-utils/schema-utils/get-all-verb-names) — Get all verb names defined in the schema
- [`get_verb_parameters`](/reference/python/signalwire/utils/schema-utils/schema-utils/get-verb-parameters) — Get the parameter definitions for a specific verb
- [`get_verb_properties`](/reference/python/signalwire/utils/schema-utils/schema-utils/get-verb-properties) — Get the properties for a specific verb
- [`get_verb_required_properties`](/reference/python/signalwire/utils/schema-utils/schema-utils/get-verb-required-properties) — Get the required properties for a specific verb
- [`load_schema`](/reference/python/signalwire/utils/schema-utils/schema-utils/load-schema) — Load the JSON schema from the specified path
- [`validate_document`](/reference/python/signalwire/utils/schema-utils/schema-utils/validate-document) — Validate a complete SWML document against the schema.
- [`validate_verb`](/reference/python/signalwire/utils/schema-utils/schema-utils/validate-verb) — Validate a verb configuration against the schema.

## Source

[`/src/signalwire/signalwire/utils/schema_utils.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/schema_utils.py)

Line 40.
