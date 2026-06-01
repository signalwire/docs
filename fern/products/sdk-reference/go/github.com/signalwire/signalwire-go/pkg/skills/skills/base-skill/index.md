---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill"
title: "BaseSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go"
---
# `BaseSkill`

BaseSkill provides default implementations for the SkillBase interface. Concrete skills should embed this struct and override methods as needed.

## Signature

```go
type BaseSkill struct
```

## Properties

| Name        | Type                     | Required | Default | Description                                                                                                                                                                                |
| ----------- | ------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Logger`    | `Logger *logging.Logger` | yes      | —       | Logger is a named logger for this skill instance. It is initialized automatically when Name() is first called via NewBaseSkill, or can be set explicitly. Mirrors Python SkillBase.logger. |
| `Params`    | `Params map[string]any`  | yes      | —       | —                                                                                                                                                                                          |
| `SkillDesc` | `SkillDesc string`       | yes      | —       | —                                                                                                                                                                                          |
| `SkillName` | `SkillName string`       | yes      | —       | —                                                                                                                                                                                          |
| `SkillVer`  | `SkillVer string`        | yes      | —       | —                                                                                                                                                                                          |

## Methods

- [`Cleanup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/cleanup) — Cleanup is a no-op by default.
- [`Description`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/description) — Description returns the skill description.
- [`GetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-global-data) — GetGlobalData returns nil (no global data by default).
- [`GetHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-hints) — GetHints returns nil (no hints by default).
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-instance-key) — GetInstanceKey returns a unique key for tracking this skill instance. When SupportsMultipleInstances() returns true, the key is composed of the skill name and the "tool\_name" parameter (defaulting to the skill name), matching Python's get\_instance\_key() behavior for multi-instance skills. When SupportsMultipleInstances() returns false, returns the skill name.
- [`GetParam`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-param) — GetParam retrieves a parameter value from the skill's Params map. Returns the value and true if found, or nil and false otherwise.
- [`GetParamBool`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-param-bool) — GetParamBool retrieves a boolean parameter, returning the default if not found.
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-parameter-schema) — GetParameterSchema returns the common parameters available to all skills. The "tool\_name" parameter is only included when SupportsMultipleInstances() returns true, matching Python's conditional inclusion in get\_parameter\_schema().
- [`GetParamFloat`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-param-float) — GetParamFloat retrieves a float parameter, returning the default if not found.
- [`GetParamInt`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-param-int) — GetParamInt retrieves an integer parameter, returning the default if not found.
- [`GetParamString`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-param-string) — GetParamString retrieves a string parameter, returning the default if not found.
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-prompt-sections) — GetPromptSections returns nil (no prompt sections by default). When skip\_prompt is set to true in Params, returns nil even for concrete overrides — concrete overrides that inject prompt sections MUST call ShouldSkipPrompt() and return nil (or an empty slice) when it is true.
- [`GetSkillData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-skill-data) — GetSkillData reads this skill instance's namespaced state from rawData. rawData is the raw\_data map passed to SWAIG function handlers, expected to contain a "global\_data" key. Returns an empty map when not found. Mirrors Python's get\_skill\_data(raw\_data).
- [`GetSkillNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-skill-namespace) — GetSkillNamespace returns the namespaced key used to store this skill instance's state in agent global\_data. Uses the "prefix" parameter if set, otherwise falls back to the instance key. Mirrors Python's \_get\_skill\_namespace().
- [`Name`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/name) — Name returns the skill name.
- [`RequiredEnvVars`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/required-env-vars) — RequiredEnvVars returns nil (no required env vars by default).
- [`ShouldSkipPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/should-skip-prompt) — ShouldSkipPrompt returns true if the "skip\_prompt" parameter is set to true. Concrete skill overrides of GetPromptSections should call this helper before returning prompt content, mirroring Python's get\_prompt\_sections() guard.
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/supports-multiple-instances) — SupportsMultipleInstances returns false by default.
- [`UpdateSkillData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/update-skill-data) — UpdateSkillData writes this skill instance's namespaced state into result's global\_data via result.UpdateGlobalData(). Returns result for method chaining. Mirrors Python's update\_skill\_data(result, data).
- [`Version`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/version) — Version returns the skill version, defaulting to "1.0.0".

## Source

[`pkg/skills/skill_base.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go)

Line 55.
