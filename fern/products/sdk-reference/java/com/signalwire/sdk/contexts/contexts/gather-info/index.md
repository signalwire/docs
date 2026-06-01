---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/gather-info"
title: "GatherInfo"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.GatherInfo"
  parent: "com.signalwire.sdk.contexts"
  module: "com.signalwire.sdk.contexts"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/GatherInfo.java"
  visibility: "public"
---
# `GatherInfo`

Configuration for gathering information in a step via the C-side gather\_info system.

<p>
 This produces zero tool_call/tool_result entries in LLM-visible history,
 instead using dynamic step instruction re-injection to present one question at a time.

## Signature

```java
public class GatherInfo
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/contexts/contexts/gather-info/init)
- [`addQuestion`](/reference/java/com/signalwire/sdk/contexts/contexts/gather-info/add-question) — Add a question to gather.
- [`getCompletionAction`](/reference/java/com/signalwire/sdk/contexts/contexts/gather-info/get-completion-action)
- [`getQuestions`](/reference/java/com/signalwire/sdk/contexts/contexts/gather-info/get-questions)
- [`toMap`](/reference/java/com/signalwire/sdk/contexts/contexts/gather-info/to-map)

## Source

[`src/main/java/com/signalwire/sdk/contexts/GatherInfo.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/GatherInfo.java)

Line 17.
