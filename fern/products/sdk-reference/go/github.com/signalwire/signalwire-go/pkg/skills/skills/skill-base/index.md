---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base"
title: "SkillBase"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "interface"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillBase"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go"
---
# `SkillBase`

SkillBase defines the interface that all skills must implement.

## Signature

```go
type SkillBase interface { Name; Description; Version; RequiredEnvVars; SupportsMultipleInstances; Setup; RegisterTools; GetHints; GetGlobalData; GetPromptSections; Cleanup; GetInstanceKey; GetParameterSchema }
```

## Methods

- [`Cleanup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/cleanup) — Cleanup releases resources when the skill is unloaded.
- [`Description`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/description) — Description returns a human-readable description of the skill.
- [`GetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/get-global-data) — GetGlobalData returns data to add to the agent's global context.
- [`GetHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/get-hints) — GetHints returns speech recognition hints for this skill.
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/get-instance-key) — GetInstanceKey returns a unique key for tracking this skill instance.
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/get-parameter-schema) — GetParameterSchema returns metadata about all parameters the skill accepts.
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/get-prompt-sections) — GetPromptSections returns prompt sections to inject into the agent.
- [`Name`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/name) — Name returns the unique skill identifier.
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/register-tools) — RegisterTools returns tool registrations for this skill.
- [`RequiredEnvVars`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/required-env-vars) — RequiredEnvVars returns environment variable names that must be set.
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/setup) — Setup validates configuration and initializes the skill.
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/supports-multiple-instances) — SupportsMultipleInstances returns whether multiple instances are allowed.
- [`Version`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base/version) — Version returns the semantic version of the skill.

## Source

[`pkg/skills/skill_base.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go)

Line 12.
