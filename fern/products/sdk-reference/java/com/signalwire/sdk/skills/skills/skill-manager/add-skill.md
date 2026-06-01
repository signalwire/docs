---
slug: "/reference/java/com/signalwire/sdk/skills/skills/skill-manager/add-skill"
title: "addSkill"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.SkillManager.addSkill"
  parent: "com.signalwire.sdk.skills.SkillManager"
  module: "com.signalwire.sdk.skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillManager.java"
  visibility: "public"
---
# `addSkill`

Add a skill to the agent.

1. Get skill factory from registry
2. Create instance
3. Check for duplicates
4. Validate env vars
5. Call setup()
6. Register tools
7. Merge hints
8. Merge global data
9. Add prompt sections

## Signature

```java
public void addSkill(
    java.lang.String skillName,
    java.util.Map<java.lang.String,java.lang.Object> params
)
```

## Parameters

| Name        | Type                                               | Required | Default | Description |
| ----------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `skillName` | `java.lang.String`                                 | yes      | —       | —           |
| `params`    | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/skills/SkillManager.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillManager.java)

Line 35.
