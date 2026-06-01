---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill/register-tools"
title: "RegisterTools"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.DataSphereServerlessSkill.RegisterTools"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin.DataSphereServerlessSkill"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/datasphere_serverless.go"
---
# `RegisterTools`

RegisterTools returns DataMap-style tool registration for serverless execution. The actual tool is registered as a DataMap function that runs on SignalWire servers.

## Signature

```go
func (*DataSphereServerlessSkill) RegisterTools() []skills.ToolRegistration
```

## Returns

`[]skills.ToolRegistration`

## Source

[`pkg/skills/builtin/datasphere_serverless.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/datasphere_serverless.go)

Line 100.
