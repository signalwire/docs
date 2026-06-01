---
slug: "/reference/dotnet/signal-wire.swml/service/register-routing-callback-string-func-dictionary-string-object-dictionary-string-string-object"
title: "RegisterRoutingCallback(string, Func<Dictionary<string, object?>?, Dictionary<string, string>, object>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.RegisterRoutingCallback(string, System.Func<System.Collections.Generic.Dictionary<string, object?>?, System.Collections.Generic.Dictionary<string, string>, object>)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `RegisterRoutingCallback(string, Func<Dictionary<string, object?>?, Dictionary<string, string>, object>)`

Register a callback for a sub-path under the service route.

## Signature

```dotnet
public void RegisterRoutingCallback(string path, Func<Dictionary<string, object?>?, Dictionary<string, string>, object> callback)
```

## Parameters

| Name       | Type                                                                      | Required | Default | Description |
| ---------- | ------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `path`     | `string`                                                                  | yes      | —       | —           |
| `callback` | `System.Func<Dictionary<string,object>,Dictionary<string,string>,object>` | yes      | —       | —           |
