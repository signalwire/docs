---
slug: "/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill"
title: "ClaudeSkillsSkill"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.builtin.ClaudeSkillsSkill"
  parent: "com.signalwire.sdk.skills.builtin"
  module: "com.signalwire.sdk.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/builtin/ClaudeSkillsSkill.java"
  visibility: "public"
---
# `ClaudeSkillsSkill`

Load SKILL.md files as agent tools.

Reads .md files from a directory, extracts YAML frontmatter, and creates tools.

## Signature

```java
public class ClaudeSkillsSkill implements com.signalwire.sdk.skills.SkillBase
```

## Inheritance

**Implements:** [com.signalwire.sdk.skills.SkillBase](/reference/java/com/signalwire/sdk/skills/skills/skill-base)

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/init)
- [`getDescription`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/get-description)
- [`getHints`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/get-hints)
- [`getName`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/get-name)
- [`getPromptSections`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/get-prompt-sections)
- [`registerTools`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/register-tools)
- [`setup`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/setup)
- [`supportsMultipleInstances`](/reference/java/com/signalwire/sdk/skills/builtin/builtin/claude-skills-skill/supports-multiple-instances)

## Source

[`src/main/java/com/signalwire/sdk/skills/builtin/ClaudeSkillsSkill.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/builtin/ClaudeSkillsSkill.java)

Line 18.
