---
slug: "/reference/java/com/signalwire/sdk/skills/skills/skill-base"
title: "SkillBase"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "interface"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.SkillBase"
  parent: "com.signalwire.sdk.skills"
  module: "com.signalwire.sdk.skills"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillBase.java"
  visibility: "public"
---
# `SkillBase`

Interface for all skills.

Skills are modular capabilities that can be
added to agents to provide tools, prompts, hints, and global data.

**Modifiers:** `abstract`

## Signature

```java
public abstract interface SkillBase
```

## Inheritance

**Extends:** `none`

## Methods

- [`cleanup`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/cleanup) — Cleanup resources.
- [`getDescription`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-description) — Human-readable description.
- [`getExtraFields`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-extra-fields) — Get extra fields to merge into all tool definitions (e.g., fillers).
- [`getGlobalData`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-global-data) — Get global data to merge into the agent.
- [`getHints`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-hints) — Get speech recognition hints for this skill.
- [`getInstanceKey`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-instance-key) — Get unique instance key (for multi-instance skills).
- [`getName`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-name) — Unique skill name.
- [`getParameterSchema`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-parameter-schema) — Get parameter schema for GUI tools.
- [`getPromptSections`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-prompt-sections) — Get prompt sections to inject into the agent.
- [`getRequiredEnvVars`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-required-env-vars) — Required environment variables.
- [`getRequiredPackages`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-required-packages) — Required packages (informational).
- [`getSwaigFunctions`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-swaig-functions) — Get SWAIG functions (for DataMap-based skills that bypass handlers).
- [`getVersion`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/get-version) — Semantic version string.
- [`registerTools`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/register-tools) — Register tools with the agent.
- [`setup`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/setup) — Initialize the skill with parameters.
- [`supportsMultipleInstances`](/reference/java/com/signalwire/sdk/skills/skills/skill-base/supports-multiple-instances) — Whether multiple instances can be loaded with different configs.

## Source

[`src/main/java/com/signalwire/sdk/skills/SkillBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillBase.java)

Line 11.
