---
slug: "/reference/rust/signalwire/utils/schema-utils/schema-utils"
title: "SchemaUtils"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::utils::schema_utils::SchemaUtils"
  parent: "signalwire::utils::schema_utils"
  module: "utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs"
  visibility: "public"
---
# `SchemaUtils`

SchemaUtils — Rust port of
`signalwire.utils.schema_utils.SchemaUtils`.

## Signature

```rust
struct SchemaUtils { /* fields */ }
```

## Methods

- [`full_validation_available`](/reference/rust/signalwire/utils/schema-utils/schema-utils/full-validation-available) — Whether full JSON Schema validation is wired up. Mirrors Python's `full_validation_available` property.
- [`generate_method_body`](/reference/rust/signalwire/utils/schema-utils/schema-utils/generate-method-body) — Generate a Python-style method body string for a verb. Mirrors Python's `generate_method_body(verb_name)`.
- [`generate_method_signature`](/reference/rust/signalwire/utils/schema-utils/schema-utils/generate-method-signature) — Generate a Python-style method signature string for a verb. Mirrors Python's `generate_method_signature(verb_name)`.
- [`get_all_verb_names`](/reference/rust/signalwire/utils/schema-utils/schema-utils/get-all-verb-names) — Sorted list of all known verb names. Mirrors Python's `get_all_verb_names()`.
- [`get_verb_parameters`](/reference/rust/signalwire/utils/schema-utils/schema-utils/get-verb-parameters) — Parameter-definition block used by code-gen tooling. Mirrors Python's `get_verb_parameters(verb_name)`.
- [`get_verb_properties`](/reference/rust/signalwire/utils/schema-utils/schema-utils/get-verb-properties) — The `properties[verb_name]` block for a verb, or empty when unknown. Mirrors Python's `get_verb_properties(verb_name)`.
- [`get_verb_required_properties`](/reference/rust/signalwire/utils/schema-utils/schema-utils/get-verb-required-properties) — The `required` list for a verb, or empty when unknown / not specified. Mirrors Python's `get_verb_required_properties(verb_name)`.
- [`load_schema`](/reference/rust/signalwire/utils/schema-utils/schema-utils/load-schema) — Read and parse the JSON Schema. Mirrors Python's `load_schema()`.
- [`new`](/reference/rust/signalwire/utils/schema-utils/schema-utils/new) — Construct a SchemaUtils. Mirrors Python's `SchemaUtils(schema_path=None, schema_validation=True)`.
- [`validate_document`](/reference/rust/signalwire/utils/schema-utils/schema-utils/validate-document) — Validate a complete SWML document. Mirrors Python's `validate_document(document)`. Returns `(false, ["Schema validator not initialized"])` when no full validator is wired in.
- [`validate_verb`](/reference/rust/signalwire/utils/schema-utils/schema-utils/validate-verb) — Validate a verb config against the schema. Mirrors Python's `validate_verb(verb_name, verb_config)`.

## Source

[`src/utils/schema_utils.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs)

Line 63.
