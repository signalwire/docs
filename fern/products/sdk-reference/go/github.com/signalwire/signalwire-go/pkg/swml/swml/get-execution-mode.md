---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/get-execution-mode"
title: "GetExecutionMode"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.GetExecutionMode"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/execution_mode.go"
---
# `GetExecutionMode`

GetExecutionMode inspects the process environment and returns the detected runtime mode. The detection order matches the Python and TypeScript SDKs so that the same env vars resolve to the same mode across languages.

Detection order:

1. CGI (GATEWAY\_INTERFACE)
2. AWS Lambda (AWS\_LAMBDA\_FUNCTION\_NAME or LAMBDA\_TASK\_ROOT)
3. GCF (FUNCTION\_TARGET, K\_SERVICE, or GOOGLE\_CLOUD\_PROJECT)
4. Azure (AZURE\_FUNCTIONS\_ENVIRONMENT, FUNCTIONS\_WORKER\_RUNTIME, or AzureWebJobsStorage)
5. Server (default fallback)

## Signature

```go
func GetExecutionMode() ExecutionMode
```

## Returns

`ExecutionMode`

## Source

[`pkg/swml/execution_mode.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/execution_mode.go)

Line 40.
