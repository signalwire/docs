---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-language-params"
title: "SetLanguageParams"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.SetLanguageParams"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `SetLanguageParams`

SetLanguageParams sets (or replaces) the per-language params dict on an already-added language. Useful when language entries are built up via AddLanguage/AddLanguageTyped first and engine-specific tuning is added later (e.g., from a config loader).

Python equivalent: ai\_config\_mixin.AIConfigMixin.set\_language\_params Python signature: set\_language\_params(code, params)

Parameters:

- code: language code as previously passed to AddLanguage (e.g. "en-US")
- params: engine-specific params dict to attach. Empty/nil removes the key.

Returns the AgentBase for chaining. No-op if the code isn't found.

## Signature

```go
func (*AgentBase) SetLanguageParams(code string, params map[string]any) *AgentBase
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `code`   | `string`         | yes      | —       | —           |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1228.
