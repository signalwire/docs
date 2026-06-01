---
slug: "/reference/java/com/signalwire/sdk/swml/swml/document"
title: "Document"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Document"
  parent: "com.signalwire.sdk.swml"
  module: "com.signalwire.sdk.swml"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Document.java"
  visibility: "public"
---
# `Document`

SWML Document model.

<p>
 A document has a version, sections (each a list of verbs), and a top-level
 verbs list that maps to the "main" section.

## Signature

```java
public class Document
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/swml/swml/document/init)
- [`addSection`](/reference/java/com/signalwire/sdk/swml/swml/document/add-section) — Add a named section.
- [`addVerb`](/reference/java/com/signalwire/sdk/swml/swml/document/add-verb) — Add a verb to the main section.
- [`addVerbToSection`](/reference/java/com/signalwire/sdk/swml/swml/document/add-verb-to-section) — Add a verb to a named section.
- [`getSectionVerbs`](/reference/java/com/signalwire/sdk/swml/swml/document/get-section-verbs) — Get verbs for a named section.
- [`getVerbs`](/reference/java/com/signalwire/sdk/swml/swml/document/get-verbs) — Get the main verbs list.
- [`hasSection`](/reference/java/com/signalwire/sdk/swml/swml/document/has-section) — Check whether a section exists.
- [`render`](/reference/java/com/signalwire/sdk/swml/swml/document/render) — Render as compact JSON.
- [`renderPretty`](/reference/java/com/signalwire/sdk/swml/swml/document/render-pretty) — Render as pretty-printed JSON.
- [`reset`](/reference/java/com/signalwire/sdk/swml/swml/document/reset) — Reset document to empty state.
- [`toMap`](/reference/java/com/signalwire/sdk/swml/swml/document/to-map) — Convert to a Map suitable for JSON serialization.

## Source

[`src/main/java/com/signalwire/sdk/swml/Document.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Document.java)

Line 20.
