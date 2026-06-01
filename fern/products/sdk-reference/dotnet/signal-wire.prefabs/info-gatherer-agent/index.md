---
slug: "/reference/dotnet/signal-wire.prefabs/info-gatherer-agent"
title: "InfoGathererAgent"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Prefabs.InfoGathererAgent"
  parent: "SignalWire.Prefabs"
  module: "SignalWire.Prefabs"
  visibility: "public"
---
# `InfoGathererAgent`

Prefab agent that gathers information by asking a series of questions.
Registers <code>start\_questions</code> and <code>submit\_answer</code> tools.

## Signature

```dotnet
public class InfoGathererAgent : AgentBase
```

## Inheritance

**Extends:** [SignalWire.SWML.Service](/reference/dotnet/signal-wire.swml/service)

## Methods

- [`GetQuestions()`](/reference/dotnet/signal-wire.prefabs/info-gatherer-agent/get-questions)
- [`InfoGathererAgent(string, List<Dictionary<string, object>>, AgentOptions?)`](/reference/dotnet/signal-wire.prefabs/info-gatherer-agent/info-gatherer-agent-string-list-dictionary-string-object-agent-options)
- [`StartQuestions(Dictionary<string, object>, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.prefabs/info-gatherer-agent/start-questions-dictionary-string-object-dictionary-string-object) — SWAIG tool handler for the `start_questions` tool. (Python parity: `InfoGathererAgent.start_questions`.)
- [`SubmitAnswer(Dictionary<string, object>, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.prefabs/info-gatherer-agent/submit-answer-dictionary-string-object-dictionary-string-object) — SWAIG tool handler for the `submit_answer` tool. (Python parity: `InfoGathererAgent.submit_answer`.)
