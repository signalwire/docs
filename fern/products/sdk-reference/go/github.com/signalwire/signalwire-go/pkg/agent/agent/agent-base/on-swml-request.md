---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-swml-request"
title: "OnSwmlRequest"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.OnSwmlRequest"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `OnSwmlRequest`

OnSwmlRequest is the primary customization point for the user to modify the SWML document based on request data. If a hook has been registered via SetOnSwmlRequestHook the hook is invoked; otherwise this returns nil (no modification).

Python equivalent: web\_mixin.WebMixin.on\_swml\_request (web\_mixin.py line 1287) Python signature: on\_swml\_request(request\_data, callback\_path, request) -> Optional\[dict]

Go has no method overriding via embedded structs alone — the hook field is the idiomatic Go equivalent of Python's overridable on\_swml\_request. The third \*http.Request argument is preserved on the Go-native signature (the cross-language audit projects only the first two args). Returning a non-nil map applies modifications to the rendered SWML; returning nil uses the default rendering unchanged.

## Signature

```go
func (*AgentBase) OnSwmlRequest(requestData map[string]any, callbackPath string, r *http.Request) map[string]any
```

## Parameters

| Name           | Type             | Required | Default | Description |
| -------------- | ---------------- | -------- | ------- | ----------- |
| `requestData`  | `map[string]any` | yes      | —       | —           |
| `callbackPath` | `string`         | yes      | —       | —           |
| `r`            | `*http.Request`  | yes      | —       | —           |

## Returns

`map[string]any`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1717.
