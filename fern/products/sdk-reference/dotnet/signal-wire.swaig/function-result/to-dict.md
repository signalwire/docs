---
slug: "/reference/dotnet/signal-wire.swaig/function-result/to-dict"
title: "ToDict()"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWAIG.FunctionResult.ToDict()"
  parent: "SignalWire.SWAIG.FunctionResult"
  module: "SignalWire.SWAIG"
  visibility: "public"
---
# `ToDict()`

Serialize to a dictionary. <code>response</code> is always present; <code>action</code> only if
non-empty; <code>post\_process</code> only if true.

## Signature

```dotnet
public Dictionary<string, object> ToDict()
```

## Returns

`Dictionary<string,object>`
