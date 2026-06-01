---
slug: "/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.PromptObjectModel"
  parent: "com.signalwire.sdk.pom"
  module: "com.signalwire.sdk.pom"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java"
  visibility: "public"
---
# `PromptObjectModel`

A structured data format for composing, organising, and rendering prompt
instructions for large language models.

Java port of the Python reference
`signalwire.pom.pom.PromptObjectModel` (signalwire-python:
`pom/pom.py`).

 <p>The Prompt Object Model provides a tree-based representation of a prompt
 document composed of nested `Section`s. Each section can include a
 title, body text, bullet points, and arbitrarily nested subsections.

 <p>Idiom mapping:
 <ul>
   <li>Python `to_dict()` \u2194 Java `#toMap()` (returns
       `List<Map<String,Object>>`)</li>
   <li>Python `from_json(str|dict)` \u2194 Java `#fromJson(String)`
       and `#fromJsonMap(List)`</li>
   <li>Python `from_yaml(str|dict)` \u2194 Java `#fromYaml(String)`
       and `#fromYamlMap(List)`</li>
 </ul>

## Signature

```java
public class PromptObjectModel
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/init) — Empty model (Python parity: `PromptObjectModel()` with debug=False).
- [`addPomAsSubsection`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/add-pom-as-subsection) — Add another POM's top-level sections as subsections of an existing section.
- [`addSection`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/add-section) — Add a top-level section.
- [`findSection`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/find-section) — Recursively search for a section with the given title.
- [`fromJson`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/from-json) — Parse a JSON string into a model.
- [`fromJsonMap`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/from-json-map) — Build a model from an already-parsed list-of-maps.
- [`fromYaml`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/from-yaml) — Parse a YAML string into a model.
- [`fromYamlMap`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/from-yaml-map) — Build a model from an already-parsed list-of-maps (YAML form).
- [`getSections`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/get-sections)
- [`isDebug`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/is-debug)
- [`renderMarkdown`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/render-markdown) — Render the entire model as Markdown.
- [`renderXml`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/render-xml) — Render the entire model as XML.
- [`toJson`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/to-json) — Convert to a JSON string with 2-space indent.
- [`toMap`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/to-map) — Convert the entire model to a list of maps.
- [`toYaml`](/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/to-yaml) — Convert to a YAML string.

## Source

[`src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java)

Line 37.
