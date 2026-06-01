---
slug: "/reference/java/com/signalwire/sdk/pom/pom/section"
title: "Section"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.Section"
  parent: "com.signalwire.sdk.pom"
  module: "com.signalwire.sdk.pom"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java"
  visibility: "public"
---
# `Section`

Represents a section in the Prompt Object Model.

<p>Each section contains a title, optional body text, optional bullet points,
 and can have any number of nested subsections. Mirrors the Python reference
 `signalwire.pom.pom.Section` (see signalwire-python: pom/pom.py).

 <p>Idiom mapping:
 <ul>
   <li>Python `to_dict()` \u2194 Java `#toMap()` (returns
       `Map<String,Object>`)</li>
   <li>Python section_number) \u2194 Java
       java.util.List)</li>
   <li>Python section_number) \u2194 Java
       java.util.List)</li>
 </ul>

 <p>Output format is byte-identical to Python's renderer so cross-port POMs
 can round-trip through markdown/XML/JSON.

## Signature

```java
public class Section
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/pom/pom/section/init) — Construct a section.
- [`addBody`](/reference/java/com/signalwire/sdk/pom/pom/section/add-body) — Add or replace the body text for this section.
- [`addBullets`](/reference/java/com/signalwire/sdk/pom/pom/section/add-bullets) — Append bullet points to this section.
- [`addSubsection`](/reference/java/com/signalwire/sdk/pom/pom/section/add-subsection) — Add a subsection to this section.
- [`getBody`](/reference/java/com/signalwire/sdk/pom/pom/section/get-body)
- [`getBullets`](/reference/java/com/signalwire/sdk/pom/pom/section/get-bullets)
- [`getNumbered`](/reference/java/com/signalwire/sdk/pom/pom/section/get-numbered)
- [`getSubsections`](/reference/java/com/signalwire/sdk/pom/pom/section/get-subsections)
- [`getTitle`](/reference/java/com/signalwire/sdk/pom/pom/section/get-title)
- [`isNumberedBullets`](/reference/java/com/signalwire/sdk/pom/pom/section/is-numbered-bullets)
- [`renderMarkdown`](/reference/java/com/signalwire/sdk/pom/pom/section/render-markdown) — Render this section and its subsections as Markdown.
- [`renderXml`](/reference/java/com/signalwire/sdk/pom/pom/section/render-xml) — Render this section and its subsections as XML.
- [`toMap`](/reference/java/com/signalwire/sdk/pom/pom/section/to-map) — Convert this section to an ordered `Map` for JSON / YAML serialisation.

## Source

[`src/main/java/com/signalwire/sdk/pom/Section.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java)

Line 29.
