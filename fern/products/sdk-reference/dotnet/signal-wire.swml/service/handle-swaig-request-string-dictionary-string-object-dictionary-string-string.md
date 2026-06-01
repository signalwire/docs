---
slug: "/reference/dotnet/signal-wire.swml/service/handle-swaig-request-string-dictionary-string-object-dictionary-string-string"
title: "HandleSwaigRequest(string, Dictionary<string, object?>?, Dictionary<string, string>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.HandleSwaigRequest(string, System.Collections.Generic.Dictionary<string, object?>?, System.Collections.Generic.Dictionary<string, string>)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "protected"
---
# `HandleSwaigRequest(string, Dictionary<string, object?>?, Dictionary<string, string>)`

Handle SWAIG function dispatch.

GET: returns the rendered SWML document (parallel to root /).
POST: parses {function, argument, call\_id}, validates, runs the
SwaigPreDispatch hook, calls OnFunctionCall on the chosen target.

Lifted from AgentBase so non-agent SWMLServices (e.g. ai\_sidecar
host) can serve /swaig without subclassing AgentBase.

**Modifiers:** `virtual`

## Signature

```dotnet
protected virtual (int, Dictionary<string, string>, string) HandleSwaigRequest(string method, Dictionary<string, object?>? requestData, Dictionary<string, string> headers)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `method`      | `string`                    | yes      | —       | —           |
| `requestData` | `Dictionary<string,object>` | yes      | —       | —           |
| `headers`     | `Dictionary<string,string>` | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
