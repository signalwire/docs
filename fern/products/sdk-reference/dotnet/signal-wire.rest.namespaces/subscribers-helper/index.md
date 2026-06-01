---
slug: "/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper"
title: "SubscribersHelper"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.SubscribersHelper"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `SubscribersHelper`

Subscribers helper exposing per-subscriber SIP-endpoint operations.

Mirrors Python's `SubscribersResource` SIP endpoint methods.

## Signature

```dotnet
public class SubscribersHelper
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`CreateSipEndpointAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/create-sip-endpoint-async-string-dictionary-string-object)
- [`DeleteSipEndpointAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/delete-sip-endpoint-async-string-string)
- [`GetSipEndpointAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/get-sip-endpoint-async-string-string)
- [`ListSipEndpointsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/list-sip-endpoints-async-string-dictionary-string-string)
- [`SubscribersHelper(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/subscribers-helper-http-client-string)
- [`UpdateSipEndpointAsync(string, string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/update-sip-endpoint-async-string-string-dictionary-string-object)
