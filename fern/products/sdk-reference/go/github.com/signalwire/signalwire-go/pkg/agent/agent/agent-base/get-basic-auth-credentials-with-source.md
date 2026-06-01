---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-basic-auth-credentials-with-source"
title: "GetBasicAuthCredentialsWithSource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.GetBasicAuthCredentialsWithSource"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `GetBasicAuthCredentialsWithSource`

GetBasicAuthCredentialsWithSource returns the basic-auth credentials plus a string indicating their SOURCE — one of "provided", "environment", or "generated". Mirrors Python's “auth\_mixin.AuthMixin.get\_basic\_auth\_credentials(include\_source=True)“ (auth\_mixin.py line 42-73).

## Signature

```go
func (*AgentBase) GetBasicAuthCredentialsWithSource() (user string, pass string, source string)
```

## Returns

`(string, string, string)`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1801.
