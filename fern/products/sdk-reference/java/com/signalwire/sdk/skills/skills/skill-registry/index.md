---
slug: "/reference/java/com/signalwire/sdk/skills/skills/skill-registry"
title: "SkillRegistry"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.skills.SkillRegistry"
  parent: "com.signalwire.sdk.skills"
  module: "com.signalwire.sdk.skills"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillRegistry.java"
  visibility: "public"
---
# `SkillRegistry`

Static registry of all available skills.

Skills are registered by name and can be instantiated on demand.

 <p>The class also exposes a small per-instance surface for
 Python-parity: an instance constructor and `#addSkillDirectory(String)`
 mirror Python's `SkillRegistry().add_skill_directory(path)`. The
 static registry is kept for the existing Java idiom; instance state is
 limited to the external skill directories list.

**Modifiers:** `final`

## Signature

```java
public final class SkillRegistry
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/init) — Public no-arg constructor so callers can manage their own external-paths list.
- [`addSkillDirectory`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/add-skill-directory) — Add a directory to search for skills.
- [`get`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/get) — Get a new instance of a skill by name.
- [`getAllSkillsSchema`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/get-all-skills-schema) — Get complete schema for all registered skills.
- [`getExternalPaths`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/get-external-paths) — Returns an immutable copy of the registered external skill directories.
- [`has`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/has) — Check if a skill is registered.
- [`list`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/list) — List all registered skill names.
- [`register`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/register) — Register a skill factory.
- [`unregister`](/reference/java/com/signalwire/sdk/skills/skills/skill-registry/unregister) — Unregister a skill (for testing).

## Source

[`src/main/java/com/signalwire/sdk/skills/SkillRegistry.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/skills/SkillRegistry.java)

Line 21.
