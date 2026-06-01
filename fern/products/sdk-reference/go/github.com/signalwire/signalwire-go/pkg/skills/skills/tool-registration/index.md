---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/tool-registration"
title: "ToolRegistration"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.ToolRegistration"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go"
---
# `ToolRegistration`

ToolRegistration describes a tool that a skill wants to register with the agent.

## Signature

```go
type ToolRegistration struct
```

## Properties

| Name          | Type                          | Required | Default | Description |
| ------------- | ----------------------------- | -------- | ------- | ----------- |
| `Description` | `Description string`          | yes      | —       | —           |
| `Fillers`     | `Fillers map[string][]string` | yes      | —       | —           |
| `Handler`     | `Handler swaig.ToolHandler`   | yes      | —       | —           |
| `Name`        | `Name string`                 | yes      | —       | —           |
| `Parameters`  | `Parameters map[string]any`   | yes      | —       | —           |
| `Secure`      | `Secure bool`                 | yes      | —       | —           |
| `SwaigFields` | `SwaigFields map[string]any`  | yes      | —       | —           |

## Source

[`pkg/skills/skill_base.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go)

Line 43.
