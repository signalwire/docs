---
slug: "/reference/typescript/skills/skill-registry/skill-registry"
title: "SkillRegistry"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "skills.SkillRegistry.SkillRegistry"
  parent: "skills.SkillRegistry"
  module: "skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts"
---
# `SkillRegistry`

Global singleton registry for registering and instantiating skills.

Skills can be registered programmatically via `register(SkillClass)`.
Matches Python's `skill_registry` global (`skills/registry.py:481`).

## Signature

```typescript
class SkillRegistry
```

## Properties

| Name   | Type                 | Required | Default | Description                          |
| ------ | -------------------- | -------- | ------- | ------------------------------------ |
| `size` | `get size(): number` | yes      | —       | Get the number of registered skills. |

## Methods

- [`addSearchPath`](/reference/typescript/skills/skill-registry/skill-registry/add-search-path) — Add a directory path to search during skill discovery.
- [`addSkillDirectory`](/reference/typescript/skills/skill-registry/skill-registry/add-skill-directory) — Add a directory to search for skills.
- [`clear`](/reference/typescript/skills/skill-registry/skill-registry/clear) — Clear all registrations.
- [`constructor`](/reference/typescript/skills/skill-registry/skill-registry/constructor)
- [`create`](/reference/typescript/skills/skill-registry/skill-registry/create) — Create a new skill instance by looking up its class in the registry. Matches Python's `skill_manager.load_skill(name)` class-lookup + instantiate flow (`skill_manager.py:97`: `skill_instance = skill_class(self.agent, params)`).
- [`discoverAll`](/reference/typescript/skills/skill-registry/skill-registry/discover-all) — Discover and register skills from all configured search paths.
- [`discoverFromDirectory`](/reference/typescript/skills/skill-registry/skill-registry/discover-from-directory) — Discover and register skills from a directory by importing each file. Looks for SkillBase subclass exports and registers them.
- [`getAllSkillsSchema`](/reference/typescript/skills/skill-registry/skill-registry/get-all-skills-schema) — Get combined schema info for all registered skills.
- [`getExternalPaths`](/reference/typescript/skills/skill-registry/skill-registry/get-external-paths) — Returns a copy of the external skill directories registered via [addSkillDirectory](/reference/typescript/add-skill-directory). Parity surface for Python's `_external_paths`.
- [`getInstance`](/reference/typescript/skills/skill-registry/skill-registry/get-instance) — Get the global singleton instance, creating it on first access.
- [`getSearchPaths`](/reference/typescript/skills/skill-registry/skill-registry/get-search-paths) — Get all configured search paths for skill discovery.
- [`getSkillClass`](/reference/typescript/skills/skill-registry/skill-registry/get-skill-class) — Get the registered skill class by name. Matches Python's `get_skill_class(skill_name)` (`registry.py:196-203`).
- [`getSkillSchema`](/reference/typescript/skills/skill-registry/skill-registry/get-skill-schema) — Get the combined schema info for a registered skill. Matches Python `get_all_skills_schema` per-skill shape (`registry.py:287-295`).
- [`has`](/reference/typescript/skills/skill-registry/skill-registry/has) — Check if a skill name is registered.
- [`listAllSkillSources`](/reference/typescript/skills/skill-registry/skill-registry/list-all-skill-sources) — Group registered skill names by source category. Matches Python's `list_all_skill_sources` (`skills/registry.py:436-478`).
- [`listRegistered`](/reference/typescript/skills/skill-registry/skill-registry/list-registered) — List all registered skill names.
- [`listSkills`](/reference/typescript/skills/skill-registry/skill-registry/list-skills) — List all registered skills with their full metadata. Matches Python's `list_skills()` shape (`registry.py:205-227`) plus TS-idiomatic camelCase keys.
- [`lock`](/reference/typescript/skills/skill-registry/skill-registry/lock) — Lock one or more skill names to prevent overwriting. If called with no arguments, locks all currently registered skills.
- [`register`](/reference/typescript/skills/skill-registry/skill-registry/register) — Register a skill class. The skill name is read from the class's static `SKILL_NAME`. Mirrors Python's `register_skill(skill_class)` (`skills/registry.py:132-194`) — including the schema-non-empty check and the protection against overwriting locked skills.
- [`resetInstance`](/reference/typescript/skills/skill-registry/skill-registry/reset-instance) — Reset the global singleton (for testing).
- [`unregister`](/reference/typescript/skills/skill-registry/skill-registry/unregister) — Unregister a skill by name, removing it from the registry.

## Source

[`src/skills/SkillRegistry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts)

Line 55.
