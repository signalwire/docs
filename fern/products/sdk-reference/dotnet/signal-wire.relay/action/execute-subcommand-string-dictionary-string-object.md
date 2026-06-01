---
slug: "/reference/dotnet/signal-wire.relay/action/execute-subcommand-string-dictionary-string-object"
title: "ExecuteSubcommand(string, Dictionary<string, object?>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Action.ExecuteSubcommand(string, System.Collections.Generic.Dictionary<string, object?>?)"
  parent: "SignalWire.Relay.Action"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `ExecuteSubcommand(string, Dictionary<string, object?>?)`

Send a sub-command RPC through the client.
The payload always includes control\_id, call\_id, and node\_id.

## Signature

```dotnet
public void ExecuteSubcommand(string method, Dictionary<string, object?>? extraParams = null)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `method`      | `string`                    | yes      | —       | —           |
| `extraParams` | `Dictionary<string,object>` | no       | `null`  | —           |
