---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-rest-client"
title: "NewRestClient"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.NewRestClient"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/rest_client.go"
---
# `NewRestClient`

NewRestClient creates a new RestClient. If project, token, or space are empty strings the corresponding environment variables are used:

```
SIGNALWIRE_PROJECT_ID
SIGNALWIRE_API_TOKEN
SIGNALWIRE_SPACE
```

An error is returned when any of the three values is still empty after the environment lookup.

## Signature

```go
func NewRestClient(project string, token string, space string) (*RestClient, error)
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `project` | `string` | yes      | —       | —           |
| `token`   | `string` | yes      | —       | —           |
| `space`   | `string` | yes      | —       | —           |

## Returns

`(*RestClient, error)`

## Examples

**Example 1**

```go
SIGNALWIRE_PROJECT_ID
SIGNALWIRE_API_TOKEN
SIGNALWIRE_SPACE
```

**Example 2**

```go
SIGNALWIRE_PROJECT_ID
SIGNALWIRE_API_TOKEN
SIGNALWIRE_SPACE
```

## Source

[`pkg/rest/rest_client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/rest_client.go)

Line 99.
