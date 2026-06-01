---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/lambda/lambda/handler/handle-function-url"
title: "HandleFunctionURL"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/lambda.Handler.HandleFunctionURL"
  parent: "github.com/signalwire/signalwire-go/pkg/lambda.Handler"
  module: "github.com.signalwire.signalwire-go.pkg.lambda"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/lambda/lambda.go"
---
# `HandleFunctionURL`

HandleFunctionURL processes a Lambda Function URL invocation. It is intended to be passed to github.com/aws/aws-lambda-go/lambda.Start.

## Signature

```go
func (*Handler) HandleFunctionURL(ctx context.Context, req events.LambdaFunctionURLRequest) (events.LambdaFunctionURLResponse, error)
```

## Parameters

| Name  | Type                              | Required | Default | Description |
| ----- | --------------------------------- | -------- | ------- | ----------- |
| `ctx` | `context.Context`                 | yes      | —       | —           |
| `req` | `events.LambdaFunctionURLRequest` | yes      | —       | —           |

## Returns

`(events.LambdaFunctionURLResponse, error)`

## Source

[`pkg/lambda/lambda.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/lambda/lambda.go)

Line 84.
