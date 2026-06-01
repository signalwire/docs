---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client"
title: "HTTPClient"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "interface"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.HTTPClient"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `HTTPClient`

HTTPClient is the interface that namespace implementations use to make HTTP requests. It is satisfied by the httpAdapter in the parent rest package, which prevents an import cycle.

## Signature

```go
type HTTPClient interface { Get; Post; Put; Patch; Delete }
```

## Methods

- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client/delete)
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client/get)
- [`Patch`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client/patch)
- [`Post`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client/post)
- [`Put`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client/put)

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 17.
