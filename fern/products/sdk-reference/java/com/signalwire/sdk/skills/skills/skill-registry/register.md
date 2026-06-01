---
slug: "/reference/java/com/signalwire/sdk/skills/skills/skill-registry/register"
title: "register"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.SkillRegistry.register"
  parent: "com.signalwire.sdk.skills.SkillRegistry"
  module: "com.signalwire.sdk.skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillRegistry.java"
  visibility: "public"
---
# `register`

Register a skill factory.

**Modifiers:** `static`

## Signature

```java
public static void register(
    java.lang.String name,
    java.util.function.Supplier<com.signalwire.sdk.skills.SkillBase> factory
)
```

## Parameters

| Name      | Type                                                               | Required | Default | Description |
| --------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `name`    | `java.lang.String`                                                 | yes      | —       | —           |
| `factory` | `java.util.function.Supplier<com.signalwire.sdk.skills.SkillBase>` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/skills/SkillRegistry.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillRegistry.java)

Line 58.
