---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/lambda/lambda/handler/handle-api-gateway-v2"
title: "HandleAPIGatewayV2"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/lambda.Handler.HandleAPIGatewayV2"
  parent: "github.com/signalwire/signalwire-go/pkg/lambda.Handler"
  module: "github.com.signalwire.signalwire-go.pkg.lambda"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/lambda/lambda.go"
---
# `HandleAPIGatewayV2`

HandleAPIGatewayV2 processes an API Gateway HTTP API v2 invocation. The payload shape is virtually identical to Function URLs, but the response type differs, so we provide a dedicated entry point.

## Signature

```go
func (*Handler) HandleAPIGatewayV2(ctx context.Context, req events.APIGatewayV2HTTPRequest) (events.APIGatewayV2HTTPResponse, error)
```

## Parameters

| Name  | Type                             | Required | Default | Description |
| ----- | -------------------------------- | -------- | ------- | ----------- |
| `ctx` | `context.Context`                | yes      | —       | —           |
| `req` | `events.APIGatewayV2HTTPRequest` | yes      | —       | —           |

## Returns

`(events.APIGatewayV2HTTPResponse, error)`

## Source

[`pkg/lambda/lambda.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/lambda/lambda.go)

Line 107.
