---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill"
title: "ClaudeSkillsSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.ClaudeSkillsSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/claude_skills.go"
---
# `ClaudeSkillsSkill`

ClaudeSkillsSkill loads Claude-style SKILL.md files as SignalWire agent tools.

Each directory under skills\_path that contains a SKILL.md becomes a SWAIG tool. The SKILL.md frontmatter provides the tool name and description; the body becomes the tool's response content when invoked.

## Signature

```go
type ClaudeSkillsSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/get-hints) — GetHints returns speech recognition hints derived from loaded skill names.
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/get-instance-key) — GetInstanceKey returns a unique key based on skills\_path for multi-instance support.
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/get-parameter-schema) — GetParameterSchema returns the full parameter schema for the SKILL.md loader.
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/get-prompt-sections) — GetPromptSections returns one prompt section per loaded skill (excluding skipped ones).
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/register-tools) — RegisterTools returns one ToolRegistration per discovered SKILL.md that is not flagged to skip.
- [`RequiredEnvVars`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/required-env-vars) — RequiredEnvVars returns nil — no env vars required (skills\_path is a param).
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/setup) — Setup validates configuration and discovers SKILL.md files.
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/supports-multiple-instances) — SupportsMultipleInstances returns true — different skills\_path values create distinct instances.

## Source

[`pkg/skills/builtin/claude_skills.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/claude_skills.go)

Line 82.
