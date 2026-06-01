---
slug: "/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/add-section"
title: "addSection"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.PromptObjectModel.addSection"
  parent: "com.signalwire.sdk.pom.PromptObjectModel"
  module: "com.signalwire.sdk.pom.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java"
  visibility: "public"
---
# `addSection`

Add a top-level section.

Mirrors Python `add_section(...)`.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.pom.Section addSection(
    java.lang.String title,
    java.lang.String body,
    java.util.List<java.lang.String> bullets,
    java.lang.Boolean numbered,
    boolean numberedBullets
)
```

**Overload 2**

```java
public com.signalwire.sdk.pom.Section addSection(java.lang.String title)
```

**Overload 3**

```java
public com.signalwire.sdk.pom.Section addSection(
    java.lang.String title,
    java.lang.String body
)
```

**Overload 4**

```java
public com.signalwire.sdk.pom.Section addSection(
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

`com.signalwire.sdk.pom.Section` — the newly created `Section`

## Returns (Overload 2)

`com.signalwire.sdk.pom.Section`

## Returns (Overload 3)

`com.signalwire.sdk.pom.Section`

## Returns (Overload 4)

`com.signalwire.sdk.pom.Section`

## Throws

- `IllegalArgumentException` — if a null-title section is added after the first section

## Source

[`src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java)

Line 144.
