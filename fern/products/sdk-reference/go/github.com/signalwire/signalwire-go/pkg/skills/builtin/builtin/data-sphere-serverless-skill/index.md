---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill"
title: "DataSphereServerlessSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.DataSphereServerlessSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/datasphere_serverless.go"
---
# `DataSphereServerlessSkill`

DataSphereServerlessSkill provides DataSphere search using DataMap (serverless execution).

## Signature

```go
type DataSphereServerlessSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/get-global-data) — GetGlobalData returns global data for agent context.
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/get-instance-key)
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/get-parameter-schema)
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/get-prompt-sections)
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/register-tools) — RegisterTools returns DataMap-style tool registration for serverless execution. The actual tool is registered as a DataMap function that runs on SignalWire servers.
- [`RequiredEnvVars`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/required-env-vars)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/setup)
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/supports-multiple-instances)

## Source

[`pkg/skills/builtin/datasphere_serverless.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/datasphere_serverless.go)

Line 14.
