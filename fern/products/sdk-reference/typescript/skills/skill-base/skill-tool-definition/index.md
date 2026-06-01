---
slug: "/reference/typescript/skills/skill-base/skill-tool-definition"
title: "SkillToolDefinition"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "skills.SkillBase.SkillToolDefinition"
  parent: "skills.SkillBase"
  module: "skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `SkillToolDefinition`

Definition of a SWAIG tool provided by a skill.

## Signature

```typescript
interface SkillToolDefinition
```

## Properties

| Name               | Type                       | Required | Default | Description                                                                                                                                                                                                                                                                              |
| ------------------ | -------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `description`      | `string`                   | yes      | —       | Human-readable description of what the tool does, shown to the AI.                                                                                                                                                                                                                       |
| `fillers`          | `Record<string, string[]>` | no       | —       | Filler phrases spoken while the tool executes, keyed by language.                                                                                                                                                                                                                        |
| `handler`          | `SwaigHandler`             | yes      | —       | Handler function invoked when the tool is called.                                                                                                                                                                                                                                        |
| `isHangupHook`     | `boolean`                  | no       | —       | When true, the SignalWire platform automatically invokes this tool when the call ends (hangup), regardless of whether the AI explicitly calls it. Equivalent to Python's `is_hangup_hook=True` in `define_tool()`. The flag is serialised as `"is_hangup_hook": true` in the SWAIG JSON. |
| `name`             | `string`                   | yes      | —       | Unique tool name used in SWAIG function registration.                                                                                                                                                                                                                                    |
| `parameters`       | `Record<string, unknown>`  | no       | —       | Parameter schema for the tool, keyed by parameter name.                                                                                                                                                                                                                                  |
| `required`         | `string[]`                 | no       | —       | List of parameter names that are required.                                                                                                                                                                                                                                               |
| `secure`           | `boolean`                  | no       | —       | Whether the tool requires secure (authenticated) invocation.                                                                                                                                                                                                                             |
| `skip_fillers`     | `boolean`                  | no       | —       | If true, suppress filler phrases while the tool executes.                                                                                                                                                                                                                                |
| `wait_for_fillers` | `boolean`                  | no       | —       | If true, wait for any in-flight fillers to complete before executing the tool.                                                                                                                                                                                                           |

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 20.
