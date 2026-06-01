---
slug: "/reference/dotnet/signal-wire.prefabs/faq-bot-agent/search-faqs-dictionary-string-object-dictionary-string-object"
title: "SearchFaqs(Dictionary<string, object>, Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Prefabs.FAQBotAgent.SearchFaqs(System.Collections.Generic.Dictionary<string, object>, System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.Prefabs.FAQBotAgent"
  module: "SignalWire.Prefabs"
  visibility: "public"
---
# `SearchFaqs(Dictionary<string, object>, Dictionary<string, object?>)`

SWAIG tool handler that searches the configured FAQ
knowledge base for the best keyword-scored answer.
(Python parity: `FAQBotAgent.search_faqs(args, raw_data)`.)

## Signature

```dotnet
public FunctionResult SearchFaqs(Dictionary<string, object> args, Dictionary<string, object?> rawData)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `args`    | `Dictionary<string,object>` | yes      | —       | —           |
| `rawData` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`SignalWire.SWAIG.FunctionResult`
