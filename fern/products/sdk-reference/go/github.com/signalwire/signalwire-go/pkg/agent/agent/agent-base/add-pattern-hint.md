---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-pattern-hint"
title: "AddPatternHint"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.AddPatternHint"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AddPatternHint`

AddPatternHint adds a pattern-based speech-recognition hint with regex replacement semantics.

Python equivalent: ai\_config\_mixin.AIConfigMixin.add\_pattern\_hint Python signature: add\_pattern\_hint(hint, pattern, replace, ignore\_case=False)

The Python implementation appends to self.\_hints (not a separate patternHints list) as a dict with keys "hint", "pattern", "replace", "ignore\_case". The Go implementation stores in patternHints and merges into the rendered "hints" array at render time.

Parameters:

- hint: the hint text the model receives
- pattern: regex pattern for the spoken word/phrase
- replace: replacement string for the matched pattern
- ignoreCase: when true, matching is case-insensitive

## Signature

```go
func (*AgentBase) AddPatternHint(hint string, pattern string, replace string, ignoreCase ...bool) *AgentBase
```

## Parameters

| Name            | Type     | Required | Default | Description |
| --------------- | -------- | -------- | ------- | ----------- |
| `hint`          | `string` | yes      | —       | —           |
| `pattern`       | `string` | yes      | —       | —           |
| `replace`       | `string` | yes      | —       | —           |
| `...ignoreCase` | `bool`   | no       | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1113.
