---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils"
title: "SchemaUtils"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `SchemaUtils`

SchemaUtils is the Go port of signalwire.utils.schema\_utils.SchemaUtils.

Construction rules:

- schemaPath empty + SWML\_SKIP\_SCHEMA\_VALIDATION unset → load embedded.
- schemaPath set → load from file.
- schemaValidation=false OR SWML\_SKIP\_SCHEMA\_VALIDATION=1 → no full validator (lightweight required-property check still runs).

## Signature

```go
type SchemaUtils struct
```

## Methods

- [`FullValidationAvailable`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/full-validation-available) — FullValidationAvailable reports whether the full JSON Schema validator is wired up. Mirrors Python's full\_validation\_available.
- [`GenerateMethodBody`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/generate-method-body) — GenerateMethodBody renders a Python-style method body for a verb. Mirrors Python's “generate\_method\_body(verb\_name)“.
- [`GenerateMethodSignature`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/generate-method-signature) — GenerateMethodSignature renders a Python-style method signature for a verb — used by code-gen tooling. Mirrors Python's “generate\_method\_signature(verb\_name)“.
- [`GetAllVerbNames`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/get-all-verb-names) — GetAllVerbNames returns the sorted list of all known verb names. Mirrors Python's “get\_all\_verb\_names()“.
- [`GetVerbParameters`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/get-verb-parameters) — GetVerbParameters returns the parameter-definition block used for codegen — verb\_props\["properties"]. Mirrors Python's “get\_verb\_parameters(verb\_name)“.
- [`GetVerbProperties`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/get-verb-properties) — GetVerbProperties returns the inner “properties\[verb\_name]“ block for a verb, or an empty map when the verb is unknown. Mirrors Python's “get\_verb\_properties(verb\_name)“.
- [`GetVerbRequiredProperties`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/get-verb-required-properties) — GetVerbRequiredProperties returns the “required“ list for a verb. Mirrors Python's “get\_verb\_required\_properties(verb\_name)“.
- [`LoadSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/load-schema) — LoadSchema reads and parses the JSON Schema. Mirrors Python's “load\_schema()“.
- [`ValidateDocument`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/validate-document) — ValidateDocument validates a complete SWML document against the schema. Mirrors Python's “validate\_document(document)“.
- [`ValidateVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/validate-verb) — ValidateVerb validates a verb config against the schema. Mirrors Python's “validate\_verb(verb\_name, verb\_config)“.

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 65.
