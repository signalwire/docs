---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill"
title: "InfoGathererSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.InfoGathererSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/info_gatherer.go"
---
# `InfoGathererSkill`

InfoGathererSkill guides an AI agent through a series of questions, collecting and storing answers in global\_data.

## Signature

```go
type InfoGathererSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/get-global-data)
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/get-instance-key)
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/get-parameter-schema)
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/get-prompt-sections)
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/register-tools)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/setup)
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill/supports-multiple-instances)

## Source

[`pkg/skills/builtin/info_gatherer.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/info_gatherer.go)

Line 12.
