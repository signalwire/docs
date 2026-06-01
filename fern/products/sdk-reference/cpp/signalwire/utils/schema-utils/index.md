---
slug: "/reference/cpp/signalwire/utils/schema-utils"
title: "SchemaUtils"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::utils::SchemaUtils"
  parent: "signalwire::utils"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
  visibility: "public"
---
# `SchemaUtils`

SchemaUtils — C++ port of signalwire.utils.schema\_utils.SchemaUtils.

## Signature

```cpp
class signalwire::utils::SchemaUtils
```

## Methods

- [`full_validation_available`](/reference/cpp/signalwire/utils/schema-utils/full-validation-available) — Whether full JSON Schema validation is wired up. Mirrors Python's full\_validation\_available property.
- [`generate_method_body`](/reference/cpp/signalwire/utils/schema-utils/generate-method-body) — Generate a Python-style method body string for a verb. Mirrors Python's generate\_method\_body(verb\_name).
- [`generate_method_signature`](/reference/cpp/signalwire/utils/schema-utils/generate-method-signature) — Generate a Python-style method signature string for a verb. Mirrors Python's generate\_method\_signature(verb\_name).
- [`get_all_verb_names`](/reference/cpp/signalwire/utils/schema-utils/get-all-verb-names) — Sorted list of all known verb names. Mirrors Python's get\_all\_verb\_names().
- [`get_verb_parameters`](/reference/cpp/signalwire/utils/schema-utils/get-verb-parameters) — Parameter-definition block used by code-gen tooling. Mirrors Python's get\_verb\_parameters(verb\_name).
- [`get_verb_properties`](/reference/cpp/signalwire/utils/schema-utils/get-verb-properties) — The properties\[verb\_name] block for a verb, or empty when unknown. Mirrors Python's get\_verb\_properties(verb\_name).
- [`get_verb_required_properties`](/reference/cpp/signalwire/utils/schema-utils/get-verb-required-properties) — The required list for a verb, or empty when unknown / not specified. Mirrors Python's get\_verb\_required\_properties(verb\_name).
- [`load_schema`](/reference/cpp/signalwire/utils/schema-utils/load-schema) — Read and parse the JSON Schema. Mirrors Python's load\_schema().
- [`SchemaUtils`](/reference/cpp/signalwire/utils/schema-utils/schema-utils) — Construct a SchemaUtils. Mirrors Python's SchemaUtils(schema\_path=None, schema\_validation=True). Pass schema\_path = "" to use the embedded schema.
- [`validate_document`](/reference/cpp/signalwire/utils/schema-utils/validate-document) — Validate a complete SWML document. Mirrors Python's validate\_document(document). Returns (false, \["Schema validator not initialized"]) when no full validator is wired in.
- [`validate_verb`](/reference/cpp/signalwire/utils/schema-utils/validate-verb) — Validate a verb config against the schema. Mirrors Python's validate\_verb(verb\_name, verb\_config). Returns (valid, errors) — Python's Tuple\[bool, List\[str]].

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 60.
