---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/step/add-gather-question"
title: "addGatherQuestion"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.Step.addGatherQuestion"
  parent: "com.signalwire.sdk.contexts.Step"
  module: "com.signalwire.sdk.contexts.Step"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Step.java"
  visibility: "public"
---
# `addGatherQuestion`

Add a question to this step's gather\_info configuration.

String, String) must be called first.

 <p><b>IMPORTANT \u2014 gather mode locks function access:</b> While the model
 is asking gather questions, the runtime forcibly deactivates ALL of the
 step's other functions. The only callable tools during a gather
 question are:
 <ul>
   <li>`gather_submit` (the native answer-submission tool)</li>
   <li>Whatever names you pass in this question's `functions`
       argument</li>
 </ul>

 <p>`next_step` and `change_context` are also filtered out \u2014
 the model cannot navigate away until the gather completes. This is by
 design: it forces a tight ask \u2192 submit \u2192 next-question loop.

 <p>If a question needs to call out to a tool (e.g. validate an email,
 geocode a ZIP), list that tool name in this question's `functions`
 argument. Functions listed here are active ONLY for this question.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.contexts.Step addGatherQuestion(
    java.lang.String key,
    java.lang.String question,
    java.lang.String type,
    boolean confirm,
    java.lang.String prompt,
    java.util.List<java.lang.String> functions
)
```

**Overload 2**

```java
public com.signalwire.sdk.contexts.Step addGatherQuestion(
    java.lang.String key,
    java.lang.String question
)
```

## Parameters (Overload 1)

| Name        | Type                               | Required | Default | Description |
| ----------- | ---------------------------------- | -------- | ------- | ----------- |
| `key`       | `java.lang.String`                 | yes      | —       | —           |
| `question`  | `java.lang.String`                 | yes      | —       | —           |
| `type`      | `java.lang.String`                 | yes      | —       | —           |
| `confirm`   | `boolean`                          | yes      | —       | —           |
| `prompt`    | `java.lang.String`                 | yes      | —       | —           |
| `functions` | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `key`      | `java.lang.String` | yes      | —       | —           |
| `question` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.contexts.Step`

## Returns (Overload 2)

`com.signalwire.sdk.contexts.Step`

## Source

[`src/main/java/com/signalwire/sdk/contexts/Step.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Step.java)

Line 206.
