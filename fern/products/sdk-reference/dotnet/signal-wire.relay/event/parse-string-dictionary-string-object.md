---
slug: "/reference/dotnet/signal-wire.relay/event/parse-string-dictionary-string-object"
title: "Parse(string, Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Event.Parse(string, System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.Relay.Event"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Parse(string, Dictionary<string, object?>)`

Factory: parse an event from its type and params.

**Modifiers:** `static`

## Signature

```dotnet
public static Event Parse(string eventType, Dictionary<string, object?> params_)
```

## Parameters

| Name        | Type                        | Required | Default | Description |
| ----------- | --------------------------- | -------- | ------- | ----------- |
| `eventType` | `string`                    | yes      | —       | —           |
| `params_`   | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`SignalWire.Relay.Event`
