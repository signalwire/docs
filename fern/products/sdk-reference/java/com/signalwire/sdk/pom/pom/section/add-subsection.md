---
slug: "/reference/java/com/signalwire/sdk/pom/pom/section/add-subsection"
title: "addSubsection"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.Section.addSubsection"
  parent: "com.signalwire.sdk.pom.Section"
  module: "com.signalwire.sdk.pom.Section"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java"
  visibility: "public"
---
# `addSubsection`

Add a subsection to this section.

Mirrors Python
`Section.add_subsection`. Subsections must have a title.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.pom.Section addSubsection(
    java.lang.String title,
    java.lang.String body,
    java.util.List<java.lang.String> bullets,
    java.lang.Boolean numbered,
    boolean numberedBullets
)
```

**Overload 2**

```java
public com.signalwire.sdk.pom.Section addSubsection(java.lang.String title)
```

**Overload 3**

```java
public com.signalwire.sdk.pom.Section addSubsection(
    java.lang.String title,
    java.lang.String body
)
```

**Overload 4**

```java
public com.signalwire.sdk.pom.Section addSubsection(
    java.lang.String title,
    java.lang.String body,
    java.util.List<java.lang.String> bullets
)
```

## Parameters (Overload 1)

| Name              | Type                               | Required | Default | Description |
| ----------------- | ---------------------------------- | -------- | ------- | ----------- |
| `title`           | `java.lang.String`                 | yes      | —       | —           |
| `body`            | `java.lang.String`                 | yes      | —       | —           |
| `bullets`         | `java.util.List<java.lang.String>` | yes      | —       | —           |
| `numbered`        | `java.lang.Boolean`                | yes      | —       | —           |
| `numberedBullets` | `boolean`                          | yes      | —       | —           |

## Parameters (Overload 2)

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `title` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 3)

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `title` | `java.lang.String` | yes      | —       | —           |
| `body`  | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 4)

| Name      | Type                               | Required | Default | Description |
| --------- | ---------------------------------- | -------- | ------- | ----------- |
| `title`   | `java.lang.String`                 | yes      | —       | —           |
| `body`    | `java.lang.String`                 | yes      | —       | —           |
| `bullets` | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.pom.Section` — the newly created sub-`Section`

## Returns (Overload 2)

`com.signalwire.sdk.pom.Section`

## Returns (Overload 3)

`com.signalwire.sdk.pom.Section`

## Returns (Overload 4)

`com.signalwire.sdk.pom.Section`

## Throws

- `IllegalArgumentException` — if `title` is `null`

## Source

[`src/main/java/com/signalwire/sdk/pom/Section.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java)

Line 123.
