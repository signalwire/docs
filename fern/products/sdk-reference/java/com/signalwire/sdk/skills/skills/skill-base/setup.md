---
slug: "/reference/java/com/signalwire/sdk/skills/skills/skill-base/setup"
title: "setup"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.SkillBase.setup"
  parent: "com.signalwire.sdk.skills.SkillBase"
  module: "com.signalwire.sdk.skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillBase.java"
  visibility: "public"
---
# `setup`

Initialize the skill with parameters.

**Modifiers:** `abstract`

## Signature

```java
public abstract boolean setup(
    java.util.Map<java.lang.String,java.lang.Object> params
)
```

## Parameters

| Name     | Type                                               | Required | Default | Description              |
| -------- | -------------------------------------------------- | -------- | ------- | ------------------------ |
| `params` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | Configuration parameters |

## Returns

`boolean` — true if setup succeeded

## Source

[`src/main/java/com/signalwire/sdk/skills/SkillBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillBase.java)

Line 36.
