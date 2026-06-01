---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill"
title: "SpiderSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.SpiderSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/spider.go"
---
# `SpiderSkill`

SpiderSkill fetches and extracts text content from URLs.

## Signature

```go
type SpiderSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`Cleanup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/cleanup) — Cleanup releases resources when the skill is unloaded.
- [`GetHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/get-hints)
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/get-instance-key)
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/get-parameter-schema) — GetParameterSchema returns the full parameter schema extending the base schema.
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/register-tools)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/setup)
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill/supports-multiple-instances)

## Source

[`pkg/skills/builtin/spider.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/spider.go)

Line 47.
