---
slug: "/reference/java/com/signalwire/sdk/pom/pom/section/render-markdown"
title: "renderMarkdown"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.Section.renderMarkdown"
  parent: "com.signalwire.sdk.pom.Section"
  module: "com.signalwire.sdk.pom.Section"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java"
  visibility: "public"
---
# `renderMarkdown`

Render this section and its subsections as Markdown.

Mirrors Python
`Section.render_markdown`.

## Signature

**Overload 1**

```java
public java.lang.String renderMarkdown(
    int level,
    java.util.List<java.lang.Integer> sectionNumber
)
```

**Overload 2**

```java
public java.lang.String renderMarkdown()
```

## Parameters (Overload 1)

| Name            | Type                                | Required | Default | Description                                  |
| --------------- | ----------------------------------- | -------- | ------- | -------------------------------------------- |
| `level`         | `int`                               | yes      | —       | heading level (default 2 \u2192 "##")        |
| `sectionNumber` | `java.util.List<java.lang.Integer>` | yes      | —       | current numbering breadcrumb (may be `null`) |

## Returns (Overload 1)

`java.lang.String`

## Returns (Overload 2)

`java.lang.String`

## Source

[`src/main/java/com/signalwire/sdk/pom/Section.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java)

Line 188.
