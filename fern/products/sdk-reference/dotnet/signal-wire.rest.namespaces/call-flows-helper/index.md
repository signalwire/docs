---
slug: "/reference/dotnet/signal-wire.rest.namespaces/call-flows-helper"
title: "CallFlowsHelper"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.CallFlowsHelper"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `CallFlowsHelper`

CallFlows helper providing the singular-path variants
(`/api/fabric/resources/call_flow/{id}/{addresses,versions}`).

## Signature

```dotnet
public class CallFlowsHelper
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`CallFlowsHelper(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/call-flows-helper/call-flows-helper-http-client-string)
- [`DeployVersionAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/call-flows-helper/deploy-version-async-string-dictionary-string-object)
- [`ListAddressesAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/call-flows-helper/list-addresses-async-string-dictionary-string-string)
- [`ListVersionsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/call-flows-helper/list-versions-async-string-dictionary-string-string)
