---
slug: "/reference/java/com/signalwire/sdk/pom/pom/section/render-xml"
title: "renderXml"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.Section.renderXml"
  parent: "com.signalwire.sdk.pom.Section"
  module: "com.signalwire.sdk.pom.Section"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java"
  visibility: "public"
---
# `renderXml`

Render this section and its subsections as XML.

Mirrors Python
`Section.render_xml`.

## Signature

**Overload 1**

```java
public java.lang.String renderXml(
    int indent,
    java.util.List<java.lang.Integer> sectionNumber
)
```

**Overload 2**

```java
public java.lang.String renderXml()
```

## Parameters (Overload 1)

| Name            | Type                                | Required | Default | Description |
| --------------- | ----------------------------------- | -------- | ------- | ----------- |
| `indent`        | `int`                               | yes      | —       | —           |
| `sectionNumber` | `java.util.List<java.lang.Integer>` | yes      | —       | —           |

## Returns (Overload 1)

`java.lang.String`

## Returns (Overload 2)

`java.lang.String`

## Source

[`src/main/java/com/signalwire/sdk/pom/Section.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java)

Line 259.
