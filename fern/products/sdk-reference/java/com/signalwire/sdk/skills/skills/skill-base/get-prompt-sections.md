---
slug: "/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-prompt-sections"
title: "getPromptSections"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.SkillBase.getPromptSections"
  parent: "com.signalwire.sdk.skills.SkillBase"
  module: "com.signalwire.sdk.skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillBase.java"
  visibility: "public"
---
# `getPromptSections`

Get prompt sections to inject into the agent.

Each section is a map with: title, body, bullets (optional)

**Modifiers:** `default`

## Signature

```java
public default java.util.List<java.util.Map<java.lang.String,java.lang.Object>> getPromptSections()
```

## Returns

`java.util.List<java.util.Map<java.lang.String,java.lang.Object>>`

## Source

[`src/main/java/com/signalwire/sdk/skills/SkillBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillBase.java)

Line 58.
