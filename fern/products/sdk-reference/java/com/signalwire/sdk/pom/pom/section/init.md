---
slug: "/reference/java/com/signalwire/sdk/pom/pom/section/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.Section.<init>"
  parent: "com.signalwire.sdk.pom.Section"
  module: "com.signalwire.sdk.pom.Section"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java"
  visibility: "public"
---
# `<init>`

Construct a section.

All parameters except `title` default to
empty/null. Mirrors Python's keyword-only constructor.

## Signature

**Overload 1**

```java
public void <init>(
    java.lang.String title,
    java.lang.String body,
    java.util.List<java.lang.String> bullets,
    java.lang.Boolean numbered,
    boolean numberedBullets
)
```

**Overload 2**

```java
public void <init>(java.lang.String title)
```

**Overload 3**

```java
public void <init>(java.lang.String title, java.lang.String body)
```

**Overload 4**

```java
public void <init>(
    java.lang.String title,
    java.lang.String body,
    java.util.List<java.lang.String> bullets
)
```

## Parameters (Overload 1)

| Name              | Type                               | Required | Default | Description                                       |
| ----------------- | ---------------------------------- | -------- | ------- | ------------------------------------------------- |
| `title`           | `java.lang.String`                 | yes      | —       | section title (may be `null` for an unnamed root) |
| `body`            | `java.lang.String`                 | yes      | —       | body text (must not be `null`)                    |
| `bullets`         | `java.util.List<java.lang.String>` | yes      | —       | bullet points (may be `null` \u2192 empty list)   |
| `numbered`        | `java.lang.Boolean`                | yes      | —       | tri-state numbering flag (may be `null`)          |
| `numberedBullets` | `boolean`                          | yes      | —       | when `true`, bullets render as a numbered list    |

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

## Throws

- `NullPointerException` — if `body` is `null`

## Source

[`src/main/java/com/signalwire/sdk/pom/Section.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/Section.java)

Line 50.
