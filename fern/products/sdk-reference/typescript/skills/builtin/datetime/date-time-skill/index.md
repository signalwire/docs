---
slug: "/reference/typescript/skills/builtin/datetime/date-time-skill"
title: "DateTimeSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "skills.builtin.datetime.DateTimeSkill"
  parent: "skills.builtin.datetime"
  module: "skills.builtin.datetime"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datetime.ts"
---
# `DateTimeSkill`

Provides the current date and time with optional timezone support.

Tier 1 built-in skill with no external dependencies. Supports all IANA
timezone identifiers via the Intl.DateTimeFormat API.

Registers two SWAIG tools: `get_current_time` and `get_current_date`.

## Signature

```typescript
class DateTimeSkill extends SkillBase
```

## Inheritance

**Extends:** [SkillBase](/reference/typescript/skills/skill-base)

## Examples

```typescript
agent.addSkill('datetime');
```

## Properties

| Name                          | Type                      | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ----------------------------- | ------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agent`                       | `AgentBase`               | no       | —       | Reference to the agent that owns this skill. Set via `setAgent()` when the skill is added to an agent. Python equivalent: `self.agent` (set in `__init__`). In the Python SDK `agent` is always non-null because it is injected in the constructor.  In the TypeScript SDK the SkillManager always calls `setAgent()` before `setup()`, so subclasses can rely on `getAgent()` being safe to call inside `setup()` and any method invoked after it. |
| `config`                      | `SkillConfig`             | yes      | —       | Configuration options provided at construction time.                                                                                                                                                                                                                                                                                                                                                                                                |
| `instanceId`                  | `string`                  | yes      | —       | Unique identifier for this skill instance (includes timestamp and random bytes).                                                                                                                                                                                                                                                                                                                                                                    |
| `logger`                      | `Logger`                  | yes      | —       | Logger scoped to this skill. Python equivalent: `self.logger = get_logger(...)` set in `SkillBase.__init__` so every subclass can call `self.logger.info(...)`.                                                                                                                                                                                                                                                                                     |
| `REQUIRED_ENV_VARS`           | `readonly string[]`       | yes      | —       | Environment variables required for the skill to function, checked at load time by `validateEnvVars()`. Python parity: `REQUIRED_ENV_VARS: List[str] = []` at `core/skill_base.py:27`.                                                                                                                                                                                                                                                               |
| `REQUIRED_PACKAGES`           | `readonly string[]`       | yes      | —       | Packages required by the skill, checked at load time by `validatePackages()`. Python parity: `REQUIRED_PACKAGES: List[str] = []` at `core/skill_base.py:26`. In TS these are npm package names importable via dynamic `import()`.                                                                                                                                                                                                                   |
| `SKILL_DESCRIPTION`           | `string`                  | yes      | —       | Human-readable description of the skill. Subclasses MUST override. Python parity: `SKILL_DESCRIPTION: str = None` at `core/skill_base.py:24`.                                                                                                                                                                                                                                                                                                       |
| `SKILL_NAME`                  | `string`                  | yes      | —       | Unique skill name. Subclasses MUST override with a non-empty string. Python parity: `SKILL_NAME: str = None` at `core/skill_base.py:23`. Python raises `ValueError` in `__init__` when this is left as `None`; TS throws at construction when this is left as the empty default.                                                                                                                                                                    |
| `SKILL_VERSION`               | `string`                  | yes      | —       | Semantic version string. Subclasses may override; defaults to `"1.0.0"`. Python parity: `SKILL_VERSION: str = "1.0.0"` at `core/skill_base.py:25`.                                                                                                                                                                                                                                                                                                  |
| `skillName`                   | `string`                  | yes      | —       | The registered name of this skill type.                                                                                                                                                                                                                                                                                                                                                                                                             |
| `SUPPORTS_MULTIPLE_INSTANCES` | `boolean`                 | yes      | —       | Whether this skill type supports multiple simultaneous instances (e.g., with different tool\_name). Python parity: `SUPPORTS_MULTIPLE_INSTANCES: bool = False` at `core/skill_base.py:30`.                                                                                                                                                                                                                                                          |
| `swaigFields`                 | `Record<string, unknown>` | yes      | —       | Additional SWAIG fields extracted from config, merged into tool definitions.                                                                                                                                                                                                                                                                                                                                                                        |

## Methods

- [`cleanup`](/reference/typescript/skills/builtin/datetime/date-time-skill/cleanup) — Cleanup resources. Called when the skill is removed from an agent.
- [`constructor`](/reference/typescript/skills/builtin/datetime/date-time-skill/constructor) — Create a new skill instance.
- [`defineTool`](/reference/typescript/skills/builtin/datetime/date-time-skill/define-tool) — Imperatively register a tool with this skill.
- [`getAgent`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-agent) — Return the agent that owns this skill, asserting it is non-null. Equivalent to accessing `self.agent` in Python, where the agent reference is always set before `setup()` is called.
- [`getConfig`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-config) — Get a configuration value by key, falling back to a default if not set.
- [`getDataMapTools`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-data-map-tools) — Optional DataMap-style tool definitions. Skills that build their own SWAIG function dicts (e.g. via `DataMap.toSwaigFunction()`) return them here and `AgentBase.addSkill()` registers each via `registerSwaigFunction`.
- [`getGlobalData`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-global-data) — Get global data to merge into the agent's global data store.
- [`getHints`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-hints) — Get speech recognition hints relevant to this skill.
- [`getInstanceKey`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-instance-key) — Get the instance key used for deduplication in the SkillManager.
- [`getParameterSchema`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-parameter-schema) — Get the parameter schema for this skill class, describing all accepted configuration options. Subclasses should override and call `super.getParameterSchema()` to include base parameters.
- [`getPromptSections`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-prompt-sections) — Get prompt sections to inject into the agent's system prompt. Respects the `skip_prompt` config option — returns `[]` if set to `true`. Subclasses should override `_getPromptSections()` instead of this method.
- [`getSkillData`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-skill-data) — Read this skill's data from a raw call data object's global\_data.
- [`getSkillNamespace`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-skill-namespace) — Get the namespaced key for storing per-skill data in global\_data.
- [`getTools`](/reference/typescript/skills/builtin/datetime/date-time-skill/get-tools)
- [`hasAllEnvVars`](/reference/typescript/skills/builtin/datetime/date-time-skill/has-all-env-vars) — Check if all required environment variables are present. Convenience wrapper around `validateEnvVars()` that returns a boolean, matching the Python `validate_env_vars() -> bool` return type.
- [`hasAllPackages`](/reference/typescript/skills/builtin/datetime/date-time-skill/has-all-packages) — Check if all required packages declared in the manifest are available. Convenience wrapper around `validatePackages()` that returns a boolean, matching the Python `validate_packages() -> bool` return type.
- [`isInitialized`](/reference/typescript/skills/builtin/datetime/date-time-skill/is-initialized) — Check if the skill has been initialized by the SkillManager.
- [`markInitialized`](/reference/typescript/skills/builtin/datetime/date-time-skill/mark-initialized) — Mark the skill as initialized (called by SkillManager).
- [`setAgent`](/reference/typescript/skills/builtin/datetime/date-time-skill/set-agent) — Set the agent reference for this skill. Called by the SkillManager/AgentBase when the skill is attached to an agent. Python equivalent: `self.agent = agent` in `__init__`.
- [`setup`](/reference/typescript/skills/builtin/datetime/date-time-skill/setup) — Setup the skill. Called when the skill is added to an agent. Override to perform initialization (API connections, config validation, etc.)
- [`updateSkillData`](/reference/typescript/skills/builtin/datetime/date-time-skill/update-skill-data) — Update this skill's namespaced data on a FunctionResult via updateGlobalData.
- [`validateEnvVars`](/reference/typescript/skills/builtin/datetime/date-time-skill/validate-env-vars) — Validate that all required environment variables declared on the skill class are set in the current process environment.
- [`validatePackages`](/reference/typescript/skills/builtin/datetime/date-time-skill/validate-packages) — Validate that all required packages declared on the skill class can be imported.

## Source

[`src/skills/builtin/datetime.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datetime.ts)

Line 29.
