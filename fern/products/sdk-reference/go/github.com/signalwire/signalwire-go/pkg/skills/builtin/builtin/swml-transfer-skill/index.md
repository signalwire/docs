---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill"
title: "SWMLTransferSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.SWMLTransferSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/swml_transfer.go"
---
# `SWMLTransferSkill`

SWMLTransferSkill transfers calls between agents using DataMap pattern matching.

## Signature

```go
type SWMLTransferSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/get-hints)
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/get-instance-key)
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/get-parameter-schema)
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/get-prompt-sections)
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/register-tools)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/setup)
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill/supports-multiple-instances)

## Source

[`pkg/skills/builtin/swml_transfer.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/swml_transfer.go)

Line 12.
