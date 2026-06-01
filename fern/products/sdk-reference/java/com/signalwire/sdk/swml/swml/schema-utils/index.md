---
slug: "/reference/java/com/signalwire/sdk/swml/swml/schema-utils"
title: "SchemaUtils"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.SchemaUtils"
  parent: "com.signalwire.sdk.swml"
  module: "com.signalwire.sdk.swml"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java"
  visibility: "public"
---
# `SchemaUtils`

SchemaUtils \u2014 Java port of `signalwire.utils.schema_utils.SchemaUtils`.

<p>Loads the SWML JSON Schema, extracts verb metadata, and validates either a
 single verb config or a complete SWML document.</p>

 <p>Construction rules mirror Python:</p>
 <ul>
   <li>Pass `schemaPath=null` to use the embedded `schema.json`.</li>
   <li>`schemaValidation=false` disables validation (returns valid=true
       for every `validateVerb` call).</li>
   <li>The env var `SWML_SKIP_SCHEMA_VALIDATION=1/true/yes` also disables
       validation regardless of the constructor argument.</li>
 </ul>

 <p>The Java port currently ships only the lightweight validator (verb existence
 + required-property check). Full JSON Schema validation can be wired in by
 extending `#initFullValidator()`. The lightweight contract matches
 Python's `_validate_verb_lightweight()` exactly.</p>

## Signature

```java
public class SchemaUtils
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/init) — Construct a SchemaUtils.
- [`generateMethodBody`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/generate-method-body) — Generate a Python-style method body string for a verb.
- [`generateMethodSignature`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/generate-method-signature) — Generate a Python-style method signature string for a verb.
- [`getAllVerbNames`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/get-all-verb-names) — Sorted list of all known verb names.
- [`getVerbParameters`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/get-verb-parameters) — Parameter-definition block used by code-gen tooling.
- [`getVerbProperties`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/get-verb-properties) — The `properties[verb_name]` block for a verb, or an empty map when the verb is unknown.
- [`getVerbRequiredProperties`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/get-verb-required-properties) — The `required` list for a verb, or an empty list when the verb is unknown or has no required properties.
- [`isFullValidationAvailable`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/is-full-validation-available) — Whether full JSON Schema validation is wired up.
- [`loadSchema`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/load-schema) — Read and parse the JSON Schema.
- [`validateDocument`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/validate-document) — Validate a complete SWML document.
- [`validateVerb`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/validate-verb) — Validate a verb config against the schema.

## Classes

- [`VerbInfo`](/reference/java/com/signalwire/sdk/swml/swml/schema-utils/verb-info) — A verb extracted from the schema.

## Source

[`src/main/java/com/signalwire/sdk/swml/SchemaUtils.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java)

Line 51.
