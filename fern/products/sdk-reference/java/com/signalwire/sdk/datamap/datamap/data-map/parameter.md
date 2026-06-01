---
slug: "/reference/java/com/signalwire/sdk/datamap/datamap/data-map/parameter"
title: "parameter"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.datamap.DataMap.parameter"
  parent: "com.signalwire.sdk.datamap.DataMap"
  module: "com.signalwire.sdk.datamap.DataMap"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java"
  visibility: "public"
---
# `parameter`

Add a parameter to this data-map tool \u2014 the `description` is
LLM-FACING.

<p>Each parameter description is rendered into the OpenAI tool schema
 under `parameters.properties.<name>.description` and sent to
 the model. The model uses it to decide HOW to fill in the argument
 from user speech. It is prompt engineering, not developer FYI.

 <h3>Bad vs good</h3>
 <pre>: .parameter("city", "string", "the city", true, null)
 GOOD: .parameter("city", "string",
           "The name of the city to get weather for, e.g. "
           + "\"San Francisco\". Ask the user if they did not "
           + "provide one. Include the state or country if the "
           + "city name is ambiguous.", true, null)</pre>

## Signature

**Overload 1**

```java
public com.signalwire.sdk.datamap.DataMap parameter(
    java.lang.String name,
    java.lang.String paramType,
    java.lang.String description,
    boolean required,
    java.util.List<java.lang.String> enumValues
)
```

**Overload 2**

```java
public com.signalwire.sdk.datamap.DataMap parameter(
    java.lang.String name,
    java.lang.String paramType,
    java.lang.String description,
    boolean required
)
```

**Overload 3**

```java
public com.signalwire.sdk.datamap.DataMap parameter(
    java.lang.String name,
    java.lang.String paramType,
    java.lang.String description
)
```

## Parameters (Overload 1)

| Name          | Type                               | Required | Default | Description |
| ------------- | ---------------------------------- | -------- | ------- | ----------- |
| `name`        | `java.lang.String`                 | yes      | —       | —           |
| `paramType`   | `java.lang.String`                 | yes      | —       | —           |
| `description` | `java.lang.String`                 | yes      | —       | —           |
| `required`    | `boolean`                          | yes      | —       | —           |
| `enumValues`  | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `name`        | `java.lang.String` | yes      | —       | —           |
| `paramType`   | `java.lang.String` | yes      | —       | —           |
| `description` | `java.lang.String` | yes      | —       | —           |
| `required`    | `boolean`          | yes      | —       | —           |

## Parameters (Overload 3)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `name`        | `java.lang.String` | yes      | —       | —           |
| `paramType`   | `java.lang.String` | yes      | —       | —           |
| `description` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.datamap.DataMap`

## Returns (Overload 2)

`com.signalwire.sdk.datamap.DataMap`

## Returns (Overload 3)

`com.signalwire.sdk.datamap.DataMap`

## Source

[`src/main/java/com/signalwire/sdk/datamap/DataMap.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java)

Line 102.
