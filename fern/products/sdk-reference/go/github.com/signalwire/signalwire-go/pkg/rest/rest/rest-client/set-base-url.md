---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/rest-client/set-base-url"
title: "SetBaseURL"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.RestClient.SetBaseURL"
  parent: "github.com/signalwire/signalwire-go/pkg/rest.RestClient"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/rest_client.go"
---
# `SetBaseURL`

SetBaseURL overrides the base URL used by the underlying HttpClient. Useful for pointing the client at a non-default endpoint such as the audit\_rest\_transport.py harness fixture, a recorded-cassette mock server, or a regional endpoint without re-running the constructor.

## Signature

```go
func (*RestClient) SetBaseURL(url string)
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `url` | `string` | yes      | —       | —           |

## Source

[`pkg/rest/rest_client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/rest_client.go)

Line 78.
