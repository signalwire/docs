---
slug: "/reference/typescript/skills/skill-manager/skill-manager"
title: "SkillManager"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "skills.SkillManager.SkillManager"
  parent: "skills.SkillManager"
  module: "skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts"
---
# `SkillManager`

Manages the lifecycle of skills attached to an agent.

Handles loading, unloading, validation, and aggregation of skill tools,
hints, global data, and prompt sections.

**Remarks:** **Architectural note — push vs pull model:**
Python's `SkillManager.__init__(self, agent)` stores the agent reference and
uses a **push model**: when a skill is loaded via `load_skill()`, the manager
immediately calls `agent.add_hints()`, `agent.update_global_data()`, and
`agent.prompt_add_section()` to inject skill data into the agent.

This TypeScript implementation uses a **pull model** instead: `SkillManager`
has no agent reference and no constructor. `AgentBase` owns the manager and
calls `getAllHints()`, `getMergedGlobalData()`, and `getAllPromptSections()`
at render time. Both approaches produce the same observable behavior at the
SWML / SWAIG level. The pull model avoids circular-reference issues between
`AgentBase` and `SkillManager` and is better suited to TypeScript's
import-graph constraints.

## Signature

```typescript
class SkillManager
```

## Properties

| Name           | Type                                                 | Required | Default | Description                                                                                                                                                                                                                          |
| -------------- | ---------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `loadedSkills` | `get loadedSkills(): ReadonlyMap<string, SkillBase>` | yes      | —       | Public read-only view of all loaded skill instances, keyed by instance key. Python equivalent: `self.loaded_skills` (public `Dict[str, SkillBase]`). Use this to iterate or inspect loaded skills without mutating the internal map. |
| `size`         | `get size(): number`                                 | yes      | —       | Get the number of currently loaded skill instances.                                                                                                                                                                                  |

## Methods

- [`addSkill`](/reference/typescript/skills/skill-manager/skill-manager/add-skill) — Add a skill to the manager, validating env vars and calling setup(). Uses the skill's instance key for deduplication.
- [`clear`](/reference/typescript/skills/skill-manager/skill-manager/clear) — Remove all skills and clean up.
- [`constructor`](/reference/typescript/skills/skill-manager/skill-manager/constructor)
- [`getAllHints`](/reference/typescript/skills/skill-manager/skill-manager/get-all-hints) — Aggregate speech recognition hints from all loaded skills.
- [`getAllPromptSections`](/reference/typescript/skills/skill-manager/skill-manager/get-all-prompt-sections) — Aggregate prompt sections from all loaded skills.
- [`getAllTools`](/reference/typescript/skills/skill-manager/skill-manager/get-all-tools) — Aggregate tool definitions from all loaded skills.
- [`getLoadedSkillEntries`](/reference/typescript/skills/skill-manager/skill-manager/get-loaded-skill-entries) — Get metadata for all loaded skills, enabling ephemeral copy re-instantiation.
- [`getMergedGlobalData`](/reference/typescript/skills/skill-manager/skill-manager/get-merged-global-data) — Merge global data from all loaded skills into a single object.
- [`getSkill`](/reference/typescript/skills/skill-manager/skill-manager/get-skill) — Get a skill by its instance key or instance ID.
- [`hasSkill`](/reference/typescript/skills/skill-manager/skill-manager/has-skill) — Check if any skill instance with the given name is currently loaded.
- [`hasSkillByKey`](/reference/typescript/skills/skill-manager/skill-manager/has-skill-by-key) — Check if a skill with the given instance key is currently loaded. This matches Python's `has_skill` semantics, which performs a direct dictionary key lookup (`skill_identifier in self.loaded_skills`).
- [`listSkillKeys`](/reference/typescript/skills/skill-manager/skill-manager/list-skill-keys) — List the instance keys of all currently loaded skills. Python equivalent: `list_loaded_skills() -> List[str]` which returns `list(self.loaded_skills.keys())`.
- [`listSkills`](/reference/typescript/skills/skill-manager/skill-manager/list-skills) — List all loaded skill instances with their name, ID, and initialization state.
- [`loadSkill`](/reference/typescript/skills/skill-manager/skill-manager/load-skill) — Load a skill by providing the class constructor directly, bypassing the registry. This is the TypeScript equivalent of Python's `load_skill(skill_name, skill_class, params)` path where a caller-provided `skill_class` is used instead of a registry lookup.
- [`loadSkillByName`](/reference/typescript/skills/skill-manager/skill-manager/load-skill-by-name) — Load a skill by name from the global SkillRegistry, construct it, and add it. This is the TypeScript equivalent of Python's `load_skill(skill_name)` path where `skill_class=None` triggers a registry lookup.
- [`removeSkill`](/reference/typescript/skills/skill-manager/skill-manager/remove-skill) — Remove a skill by its instance key or instance ID, calling cleanup() before removal.
- [`removeSkillByName`](/reference/typescript/skills/skill-manager/skill-manager/remove-skill-by-name) — Remove all skill instances matching a given skill name.

## Source

[`src/skills/SkillManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts)

Line 45.
