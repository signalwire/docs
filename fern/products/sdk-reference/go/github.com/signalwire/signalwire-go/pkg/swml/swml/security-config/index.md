---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/security-config"
title: "SecurityConfig"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SecurityConfig"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `SecurityConfig`

SecurityConfig bundles configuration for all supported authentication methods: HTTP Basic Auth, Bearer token, and API key. Pass it to WithSecurityConfig to configure multiple auth methods in one call.

Fields default to the zero value (disabled). Set only the fields you need.

- BasicAuthUser / BasicAuthPassword — HTTP Basic Auth credentials.
- BearerToken — Expected value of the "Authorization: Bearer \<token>" header.
- APIKey — Expected API key value.
- APIKeyHeader — Header name to read the API key from (default "X-API-Key").

Mirrors Python's SecurityConfig dataclass.

## Signature

```go
type SecurityConfig struct
```

## Properties

| Name                | Type                       | Required | Default | Description                                |
| ------------------- | -------------------------- | -------- | ------- | ------------------------------------------ |
| `APIKey`            | `APIKey string`            | yes      | —       | —                                          |
| `APIKeyHeader`      | `APIKeyHeader string`      | yes      | —       | defaults to "X-API-Key" when APIKey is set |
| `BasicAuthPassword` | `BasicAuthPassword string` | yes      | —       | —                                          |
| `BasicAuthUser`     | `BasicAuthUser string`     | yes      | —       | —                                          |
| `BearerToken`       | `BearerToken string`       | yes      | —       | —                                          |

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 53.
