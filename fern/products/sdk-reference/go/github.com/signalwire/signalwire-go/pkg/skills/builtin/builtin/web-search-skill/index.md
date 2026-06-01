---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill"
title: "WebSearchSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.WebSearchSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/web_search.go"
---
# `WebSearchSkill`

WebSearchSkill searches the web using Google Custom Search API.

## Signature

```go
type WebSearchSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/get-global-data) — GetGlobalData returns global context data signalling that quality-filtered web search is available. Mirrors Python's get\_global\_data return value.
- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/get-instance-key) — GetInstanceKey returns a unique key incorporating both searchEngineID and toolName, matching Python's f"{SKILL\_NAME}_{search\_engine\_id}_{tool\_name}" pattern.
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/get-parameter-schema)
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/get-prompt-sections)
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/register-tools)
- [`RequiredEnvVars`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/required-env-vars)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/setup)
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/supports-multiple-instances)

## Source

[`pkg/skills/builtin/web_search.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/web_search.go)

Line 22.
