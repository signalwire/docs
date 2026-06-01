---
slug: "/reference/dotnet/signal-wire.prefabs/survey-agent"
title: "SurveyAgent"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Prefabs.SurveyAgent"
  parent: "SignalWire.Prefabs"
  module: "SignalWire.Prefabs"
  visibility: "public"
---
# `SurveyAgent`

Prefab agent that conducts surveys with typed question validation.
Registers <code>validate\_response</code> and <code>log\_response</code> tools.

## Signature

```dotnet
public class SurveyAgent : AgentBase
```

## Inheritance

**Extends:** [SignalWire.SWML.Service](/reference/dotnet/signal-wire.swml/service)

## Methods

- [`GetSurveyName()`](/reference/dotnet/signal-wire.prefabs/survey-agent/get-survey-name)
- [`GetSurveyQuestions()`](/reference/dotnet/signal-wire.prefabs/survey-agent/get-survey-questions)
- [`LogResponse(Dictionary<string, object>, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.prefabs/survey-agent/log-response-dictionary-string-object-dictionary-string-object) — SWAIG tool handler for the `log_response` tool. (Python parity: `SurveyAgent.log_response`.)
- [`SurveyAgent(string, List<Dictionary<string, object>>, Dictionary<string, object>?)`](/reference/dotnet/signal-wire.prefabs/survey-agent/survey-agent-string-list-dictionary-string-object-dictionary-string-object)
- [`ValidateResponse(Dictionary<string, object>, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.prefabs/survey-agent/validate-response-dictionary-string-object-dictionary-string-object) — SWAIG tool handler for the `validate_response` tool. (Python parity: `SurveyAgent.validate_response`.)
