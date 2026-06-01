---
slug: "/reference/typescript/skills/skill-registry/skill-schema-info"
title: "SkillSchemaInfo"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "skills.SkillRegistry.SkillSchemaInfo"
  parent: "skills.SkillRegistry"
  module: "skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts"
---
# `SkillSchemaInfo`

Metadata exposed for a registered skill. Shape matches Python's
`SkillRegistry.list_skills()` / `get_all_skills_schema()` return values
(`skills/registry.py:205-227`, `229-296`).

## Signature

```typescript
interface SkillSchemaInfo
```

## Properties

| Name                        | Type                                   | Required | Default | Description                                                          |
| --------------------------- | -------------------------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `description`               | `string`                               | yes      | —       | Human-readable description (from `SkillBase.SKILL_DESCRIPTION`).     |
| `name`                      | `string`                               | yes      | —       | The skill's registered name (from `SkillBase.SKILL_NAME`).           |
| `parameters`                | `Record<string, ParameterSchemaEntry>` | yes      | —       | Full parameter schema with types, defaults, and constraints.         |
| `requiredEnvVars`           | `string[]`                             | yes      | —       | Environment variables required by the skill.                         |
| `requiredPackages`          | `string[]`                             | yes      | —       | NPM packages required by the skill.                                  |
| `source`                    | `string`                               | no       | —       | Optional source category for grouping (e.g., "builtin", "external"). |
| `supportsMultipleInstances` | `boolean`                              | yes      | —       | Whether this skill supports multiple simultaneous instances.         |
| `version`                   | `string`                               | yes      | —       | Semantic version string (from `SkillBase.SKILL_VERSION`).            |

## Source

[`src/skills/SkillRegistry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts)

Line 28.
