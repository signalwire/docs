---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flows-resource"
title: "CallFlowsResource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallFlowsResource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `CallFlowsResource`

CallFlowsResource extends CrudResource with version management and a singular sub-resource path convention.

## Signature

```go
type CallFlowsResource struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`DeployVersion`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flows-resource/deploy-version) — DeployVersion deploys a new version of a call flow.
- [`ListAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flows-resource/list-addresses) — ListAddresses lists addresses for a call flow (uses singular "call\_flow" path).
- [`ListVersions`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flows-resource/list-versions) — ListVersions lists versions of a call flow.

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 77.
