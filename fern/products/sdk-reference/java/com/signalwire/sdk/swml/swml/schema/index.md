---
slug: "/reference/java/com/signalwire/sdk/swml/swml/schema"
title: "Schema"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Schema"
  parent: "com.signalwire.sdk.swml"
  module: "com.signalwire.sdk.swml"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Schema.java"
  visibility: "public"
---
# `Schema`

Singleton that loads schema.json from resources and extracts the 38 SWML verb definitions.

<p>
 The extraction algorithm:
 <ol>
   <li>Parse schema.json</li>
   <li>For each entry in $defs.SWMLMethod.anyOf, get the $ref</li>
   <li>Look up the definition in $defs</li>
   <li>The actual verb name is the first key in properties</li>
 </ol>

**Modifiers:** `final`

## Signature

```java
public final class Schema
```

## Methods

- [`getInstance`](/reference/java/com/signalwire/sdk/swml/swml/schema/get-instance)
- [`getVerb`](/reference/java/com/signalwire/sdk/swml/swml/schema/get-verb) — Get the full definition for a verb.
- [`getVerbNames`](/reference/java/com/signalwire/sdk/swml/swml/schema/get-verb-names) — Get all verb names.
- [`isValidVerb`](/reference/java/com/signalwire/sdk/swml/swml/schema/is-valid-verb) — Check if a verb name is valid.
- [`verbCount`](/reference/java/com/signalwire/sdk/swml/swml/schema/verb-count) — Get the number of loaded verb definitions.

## Source

[`src/main/java/com/signalwire/sdk/swml/Schema.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Schema.java)

Line 30.
