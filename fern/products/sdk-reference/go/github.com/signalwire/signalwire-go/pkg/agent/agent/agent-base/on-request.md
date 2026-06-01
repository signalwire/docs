---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-request"
title: "OnRequest"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.OnRequest"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `OnRequest`

OnRequest is called on every SWML request before rendering. Subclasses can override this method to inspect or transform the request data. It delegates to OnSwmlRequest.

Python equivalent: web\_mixin.WebMixin.on\_request (web\_mixin.py line 1266) Python signature: on\_request(request\_data, callback\_path) -> Optional\[dict]

Returns nil to proceed with default rendering, or a non-nil map containing SWML document overrides.

## Signature

```go
func (*AgentBase) OnRequest(requestData map[string]any, callbackPath string) map[string]any
```

## Parameters

| Name           | Type             | Required | Default | Description |
| -------------- | ---------------- | -------- | ------- | ----------- |
| `requestData`  | `map[string]any` | yes      | —       | —           |
| `callbackPath` | `string`         | yes      | —       | —           |

## Returns

`map[string]any`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1699.
