---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill"
title: "MCPGatewaySkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.MCPGatewaySkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/mcp_gateway.go"
---
# `MCPGatewaySkill`

MCPGatewaySkill connects to MCP gateway servers and registers their tools.

## Signature

```go
type MCPGatewaySkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill/get-global-data) — GetGlobalData returns MCP gateway state for DataMap variable expansion. Mirrors Python get\_global\_data: mcp\_gateway\_url, mcp\_session\_id, mcp\_services.
- [`GetHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill/get-hints)
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill/get-parameter-schema)
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill/get-prompt-sections)
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill/register-tools)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill/setup)

## Source

[`pkg/skills/builtin/mcp_gateway.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/mcp_gateway.go)

Line 17.
