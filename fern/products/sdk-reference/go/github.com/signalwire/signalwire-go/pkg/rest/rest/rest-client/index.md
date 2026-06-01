---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/rest-client"
title: "RestClient"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.RestClient"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/rest_client.go"
---
# `RestClient`

RestClient is the top-level REST client for the SignalWire platform. It provides namespaced access to all SignalWire API domains.

Usage:

```
client, err := rest.NewRestClient("project-id", "api-token", "your-space.signalwire.com")
// or use environment variables SIGNALWIRE_PROJECT_ID, SIGNALWIRE_API_TOKEN, SIGNALWIRE_SPACE
client, err := rest.NewRestClient("", "", "")

agents, err := client.Fabric.AIAgents.List(nil)
client.Calling.Play("call-id", map[string]any{"play": [...]})
```

## Signature

```go
type RestClient struct
```

## Examples

**Example 1**

```go
client, err := rest.NewRestClient("project-id", "api-token", "your-space.signalwire.com")
// or use environment variables SIGNALWIRE_PROJECT_ID, SIGNALWIRE_API_TOKEN, SIGNALWIRE_SPACE
client, err := rest.NewRestClient("", "", "")

agents, err := client.Fabric.AIAgents.List(nil)
client.Calling.Play("call-id", map[string]any{"play": [...]})
```

**Example 2**

```go
client, err := rest.NewRestClient("project-id", "api-token", "your-space.signalwire.com")
// or use environment variables SIGNALWIRE_PROJECT_ID, SIGNALWIRE_API_TOKEN, SIGNALWIRE_SPACE
client, err := rest.NewRestClient("", "", "")

agents, err := client.Fabric.AIAgents.List(nil)
client.Calling.Play("call-id", map[string]any{"play": [...]})
```

## Properties

| Name              | Type                                                   | Required | Default | Description                                |
| ----------------- | ------------------------------------------------------ | -------- | ------- | ------------------------------------------ |
| `Addresses`       | `Addresses *namespaces.AddressesNamespace`             | yes      | —       | —                                          |
| `Calling`         | `Calling *namespaces.CallingNamespace`                 | yes      | —       | Calling API (REST-based call control)      |
| `Chat`            | `Chat *namespaces.ChatNamespace`                       | yes      | —       | —                                          |
| `Compat`          | `Compat *namespaces.CompatNamespace`                   | yes      | —       | Compatibility (Twilio-compatible) LAML API |
| `Datasphere`      | `Datasphere *namespaces.DatasphereNamespace`           | yes      | —       | Datasphere API                             |
| `Fabric`          | `Fabric *namespaces.FabricNamespace`                   | yes      | —       | Fabric API                                 |
| `ImportedNumbers` | `ImportedNumbers *namespaces.ImportedNumbersNamespace` | yes      | —       | —                                          |
| `Logs`            | `Logs *namespaces.LogsNamespace`                       | yes      | —       | Logs                                       |
| `Lookup`          | `Lookup *namespaces.LookupNamespace`                   | yes      | —       | —                                          |
| `MFA`             | `MFA *namespaces.MFANamespace`                         | yes      | —       | —                                          |
| `NumberGroups`    | `NumberGroups *namespaces.NumberGroupsNamespace`       | yes      | —       | —                                          |
| `PhoneNumbers`    | `PhoneNumbers *namespaces.PhoneNumbersNamespace`       | yes      | —       | Relay REST resources                       |
| `Project`         | `Project *namespaces.ProjectNamespace`                 | yes      | —       | Project management                         |
| `PubSub`          | `PubSub *namespaces.PubSubNamespace`                   | yes      | —       | PubSub & Chat                              |
| `Queues`          | `Queues *namespaces.QueuesNamespace`                   | yes      | —       | —                                          |
| `Recordings`      | `Recordings *namespaces.RecordingsNamespace`           | yes      | —       | —                                          |
| `Registry`        | `Registry *namespaces.RegistryNamespace`               | yes      | —       | 10DLC Campaign Registry                    |
| `ShortCodes`      | `ShortCodes *namespaces.ShortCodesNamespace`           | yes      | —       | —                                          |
| `SipProfile`      | `SipProfile *namespaces.SipProfileNamespace`           | yes      | —       | —                                          |
| `VerifiedCallers` | `VerifiedCallers *namespaces.VerifiedCallersNamespace` | yes      | —       | —                                          |
| `Video`           | `Video *namespaces.VideoNamespace`                     | yes      | —       | Video API                                  |

## Methods

- [`HttpClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/rest-client/http-client) — HttpClient exposes the underlying HTTP transport. It is the public form of Python's “signalwire\_client.\_http“ and is the entry point used by helpers like PaginatedIterator that need raw GET access without going through a namespace resource.
- [`SetBaseURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/rest-client/set-base-url) — SetBaseURL overrides the base URL used by the underlying HttpClient. Useful for pointing the client at a non-default endpoint such as the audit\_rest\_transport.py harness fixture, a recorded-cassette mock server, or a regional endpoint without re-running the constructor.

## Source

[`pkg/rest/rest_client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/rest_client.go)

Line 28.
