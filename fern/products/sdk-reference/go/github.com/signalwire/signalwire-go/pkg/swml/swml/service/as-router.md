---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/as-router"
title: "AsRouter"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.AsRouter"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `AsRouter`

AsRouter returns an http.Handler that serves this service's endpoints. Use this to embed the service in a custom HTTP mux or router. Mirrors Python's as\_router() -> APIRouter method on SWMLService.

## Signature

```go
func (*Service) AsRouter() http.Handler
```

## Returns

`http.Handler`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 572.
