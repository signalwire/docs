---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill/get-global-data"
title: "GetGlobalData"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.WebSearchSkill.GetGlobalData"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin.WebSearchSkill"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/web_search.go"
---
# `GetGlobalData`

GetGlobalData returns global context data signalling that quality-filtered web search is available. Mirrors Python's get\_global\_data return value.

## Signature

```go
func (*WebSearchSkill) GetGlobalData() map[string]any
```

## Returns

`map[string]any`

## Source

[`pkg/skills/builtin/web_search.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/web_search.go)

Line 731.
