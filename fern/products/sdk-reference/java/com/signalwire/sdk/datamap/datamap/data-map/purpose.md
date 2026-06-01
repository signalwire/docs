---
slug: "/reference/java/com/signalwire/sdk/datamap/datamap/data-map/purpose"
title: "purpose"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.datamap.DataMap.purpose"
  parent: "com.signalwire.sdk.datamap.DataMap"
  module: "com.signalwire.sdk.datamap.DataMap"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java"
  visibility: "public"
---
# `purpose`

Set the LLM-facing tool description \u2014 this is PROMPT ENGINEERING,
not developer documentation.

<p>The description string is rendered into the OpenAI tool schema
 `description` field on every LLM turn. The model reads it to
 decide WHEN to call this tool. A vague `purpose()` is the #1
 cause of "the model has the right tool but doesn't call it" failures
 with data-map tools.

 <h3>Bad vs good</h3>
 <pre>: .purpose("weather api")
 GOOD: .purpose("Get the current weather conditions and forecast "
              + "for a specific city. Use this whenever the user "
              + "asks about weather, temperature, rain, or similar "
              + "conditions in a named location.")</pre>

## Signature

```java
public com.signalwire.sdk.datamap.DataMap purpose(java.lang.String description)
```

## Parameters

| Name          | Type               | Required | Default | Description                                               |
| ------------- | ------------------ | -------- | ------- | --------------------------------------------------------- |
| `description` | `java.lang.String` | yes      | —       | prompt-engineering description of when to call this tool. |

## Returns

`com.signalwire.sdk.datamap.DataMap`

## Source

[`src/main/java/com/signalwire/sdk/datamap/DataMap.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java)

Line 68.
