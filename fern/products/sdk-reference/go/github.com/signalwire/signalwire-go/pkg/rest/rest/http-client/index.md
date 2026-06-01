---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client"
title: "HttpClient"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.HttpClient"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `HttpClient`

HttpClient is a thin wrapper around net/http that provides Basic Auth, JSON encoding/decoding, and standard headers for SignalWire API calls.

## Signature

```go
type HttpClient struct
```

## Methods

- [`BaseURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/base-url) — BaseURL returns the base URL used by this client.
- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/delete) — Delete performs an HTTP DELETE request. It returns the parsed response body (or an empty map for 204 No Content) and any error.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/get) — Get performs an HTTP GET request. params are added as query-string parameters.
- [`Patch`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/patch) — Patch performs an HTTP PATCH request with a JSON body.
- [`Post`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/post) — Post performs an HTTP POST request with a JSON body. Optional params are appended to the URL as query-string parameters.
- [`Put`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/put) — Put performs an HTTP PUT request with a JSON body.
- [`SetBaseURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/set-base-url) — SetBaseURL overrides the base URL used by this client. Useful for pointing the client at a non-default endpoint (audit fixtures, mock servers, etc.) without re-running the constructor with a synthetic space name.

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 60.
