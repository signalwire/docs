---
slug: "/reference/dotnet/signal-wire.swml/schema"
title: "Schema"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Schema"
  parent: "SignalWire.SWML"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Schema`

Thread-safe singleton that loads the SWML JSON schema from an embedded resource
and exposes verb definitions parsed from $defs.SWMLMethod.anyOf.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class Schema
```

## Properties

| Name        | Type                                     | Required | Default | Description                            |
| ----------- | ---------------------------------------- | -------- | ------- | -------------------------------------- |
| `Instance`  | `public static Schema Instance { get; }` | yes      | —       | Thread-safe singleton accessor.        |
| `VerbCount` | `public int VerbCount { get; }`          | yes      | —       | Number of verbs defined in the schema. |

## Methods

- [`GetAllVerbNames()`](/reference/dotnet/signal-wire.swml/schema/get-all-verb-names) — Alias of <xref href="SignalWire.SWML.Schema.GetVerbNames" data-throw-if-not-resolved="false"></xref>. (Python parity: `SchemaUtils.get_all_verb_names`.)
- [`GetVerb(string)`](/reference/dotnet/signal-wire.swml/schema/get-verb-string) — Get verb metadata, or null if not found.
- [`GetVerbNames()`](/reference/dotnet/signal-wire.swml/schema/get-verb-names) — Get a sorted list of all verb names.
- [`GetVerbParameters(string)`](/reference/dotnet/signal-wire.swml/schema/get-verb-parameters-string) — Get the parameter (property) definitions for a verb. Returns an empty dict when the verb is unknown or has no `properties`. (Python parity: `SchemaUtils.get_verb_parameters(verb_name)`.)
- [`IsValidVerb(string)`](/reference/dotnet/signal-wire.swml/schema/is-valid-verb-string) — Check whether a verb name is valid.
- [`LoadSchemaPublic()`](/reference/dotnet/signal-wire.swml/schema/load-schema-public) — Public load-schema accessor. Returns the embedded SWML schema as a Dictionary\<string, JsonElement>. Empty dict when the schema can't be loaded. (Python parity: `SchemaUtils.load_schema`.)
- [`Reset()`](/reference/dotnet/signal-wire.swml/schema/reset) — Reset the singleton (for testing).
- [`ValidateDocument(Dictionary<string, object>)`](/reference/dotnet/signal-wire.swml/schema/validate-document-dictionary-string-object) — Validate a SWML document against the loaded schema. Returns `(true, [])` on success or `(false, [errors...])` on failure. Lightweight verb-presence check — full JSON-Schema validation is out of scope for the bundled SDK. (Python parity: `SchemaUtils.validate_document(document) -> (bool, list)`.)
