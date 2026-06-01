---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-namespace"
title: "CompatNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `CompatNamespace`

CompatNamespace provides the Twilio-compatible LAML API with AccountSid scoping.

## Signature

```go
type CompatNamespace struct
```

## Properties

| Name             | Type                                   | Required | Default | Description |
| ---------------- | -------------------------------------- | -------- | ------- | ----------- |
| `Accounts`       | `Accounts *CompatAccounts`             | yes      | —       | —           |
| `Applications`   | `Applications *CompatApplications`     | yes      | —       | —           |
| `Calls`          | `Calls *CompatCalls`                   | yes      | —       | —           |
| `Conferences`    | `Conferences *CompatConferences`       | yes      | —       | —           |
| `Faxes`          | `Faxes *CompatFaxes`                   | yes      | —       | —           |
| `LamlBins`       | `LamlBins *CompatLamlBins`             | yes      | —       | —           |
| `Messages`       | `Messages *CompatMessages`             | yes      | —       | —           |
| `PhoneNumbers`   | `PhoneNumbers *CompatPhoneNumbers`     | yes      | —       | —           |
| `Queues`         | `Queues *CompatQueues`                 | yes      | —       | —           |
| `Recordings`     | `Recordings *CompatRecordings`         | yes      | —       | —           |
| `Tokens`         | `Tokens *CompatTokens`                 | yes      | —       | —           |
| `Transcriptions` | `Transcriptions *CompatTranscriptions` | yes      | —       | —           |

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 378.
