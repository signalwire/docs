---
slug: "/reference/java/com/signalwire/sdk/logging/logging/logger/error"
title: "error"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.logging.Logger.error"
  parent: "com.signalwire.sdk.logging.Logger"
  module: "com.signalwire.sdk.logging.Logger"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/logging/Logger.java"
  visibility: "public"
---
# `error`

## Signature

**Overload 1**

```java
public void error(java.lang.String message)
```

**Overload 2**

```java
public void error(java.lang.String format, java.lang.Object... args)
```

**Overload 3**

```java
public void error(java.lang.String message, java.lang.Throwable t)
```

## Parameters (Overload 1)

| Name      | Type               | Required | Default | Description |
| --------- | ------------------ | -------- | ------- | ----------- |
| `message` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name      | Type                 | Required | Default | Description |
| --------- | -------------------- | -------- | ------- | ----------- |
| `format`  | `java.lang.String`   | yes      | —       | —           |
| `...args` | `java.lang.Object[]` | yes      | —       | —           |

## Parameters (Overload 3)

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `message` | `java.lang.String`    | yes      | —       | —           |
| `t`       | `java.lang.Throwable` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/logging/Logger.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/logging/Logger.java)

Line 111.
