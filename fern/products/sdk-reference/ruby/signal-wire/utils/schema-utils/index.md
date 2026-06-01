---
slug: "/reference/ruby/signal-wire/utils/schema-utils"
title: "SchemaUtils"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Utils::SchemaUtils"
  parent: "SignalWire::Utils"
  module: "SignalWire.Utils"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/schema_utils.rb"
  visibility: "public"
---
# `SchemaUtils`

SchemaUtils — Ruby port of signalwire.utils.schema\_utils.SchemaUtils.

Loads the SWML JSON Schema, extracts verb metadata, and validates
either a single verb config or a complete SWML document.

Construction rules mirror Python:

- Pass schema\_path: nil to use the bundled schema.json.
- schema\_validation: false disables validation (validate\_verb returns
  true for every call).
- The env var SWML\_SKIP\_SCHEMA\_VALIDATION=1/true/yes also disables
  validation regardless of the constructor argument.

The Ruby port currently ships only the lightweight validator (verb
existence + required-property check). Full JSON Schema validation
can be wired in via the `json_schemer` gem by extending
init\_full\_validator. The lightweight contract matches Python's
\_validate\_verb\_lightweight() exactly.

## Signature

```ruby
class SchemaUtils < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`full_validation_available?`](/reference/ruby/signal-wire/utils/schema-utils/full-validation-available) — Whether full JSON Schema validation is wired up. Mirrors Python's full\_validation\_available property.
- [`generate_method_body`](/reference/ruby/signal-wire/utils/schema-utils/generate-method-body) — Generate a Python-style method body string for a verb. Mirrors Python's generate\_method\_body(verb\_name).
- [`generate_method_signature`](/reference/ruby/signal-wire/utils/schema-utils/generate-method-signature) — Generate a Python-style method signature string for a verb. Mirrors Python's generate\_method\_signature(verb\_name).
- [`get_all_verb_names`](/reference/ruby/signal-wire/utils/schema-utils/get-all-verb-names) — Sorted list of all known verb names. Mirrors Python's get\_all\_verb\_names().
- [`get_verb_parameters`](/reference/ruby/signal-wire/utils/schema-utils/get-verb-parameters) — Parameter-definition block used by code-gen tooling. Mirrors Python's get\_verb\_parameters(verb\_name).
- [`get_verb_properties`](/reference/ruby/signal-wire/utils/schema-utils/get-verb-properties) — The properties\[verb\_name] block for a verb, or {} when unknown. Mirrors Python's get\_verb\_properties(verb\_name).
- [`get_verb_required_properties`](/reference/ruby/signal-wire/utils/schema-utils/get-verb-required-properties) — The required list for a verb, or \[] when unknown / no required. Mirrors Python's get\_verb\_required\_properties(verb\_name).
- [`initialize`](/reference/ruby/signal-wire/utils/schema-utils/initialize) — Construct a SchemaUtils.
- [`load_schema`](/reference/ruby/signal-wire/utils/schema-utils/load-schema) — Read and parse the JSON Schema. Mirrors Python's load\_schema().
- [`schema`](/reference/ruby/signal-wire/utils/schema-utils/schema)
- [`schema_path`](/reference/ruby/signal-wire/utils/schema-utils/schema-path)
- [`validate_document`](/reference/ruby/signal-wire/utils/schema-utils/validate-document) — Validate a complete SWML document. Mirrors Python's validate\_document(document). Returns (false, \['Schema validator not initialized']) when no full validator is wired in.
- [`validate_verb`](/reference/ruby/signal-wire/utils/schema-utils/validate-verb) — Validate a verb config against the schema. Mirrors Python's validate\_verb(verb\_name, verb\_config).

## Source

[`lib/signalwire/utils/schema_utils.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/schema_utils.rb)

Line 46.
