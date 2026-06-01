---
slug: "/reference/dotnet/signal-wire.prefabs"
title: "SignalWire.Prefabs"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.Prefabs"
---
# `SignalWire.Prefabs`

## Classes

- [`ConciergeAgent`](/reference/dotnet/signal-wire.prefabs/concierge-agent) — Prefab concierge agent for venue/hotel style interactions. Registers <code>check\_availability</code> and <code>get\_directions</code> tools.
- [`FAQBotAgent`](/reference/dotnet/signal-wire.prefabs/faq-bot-agent) — Prefab FAQ bot agent with keyword-scored search. Registers a <code>search\_faqs</code> tool.
- [`InfoGathererAgent`](/reference/dotnet/signal-wire.prefabs/info-gatherer-agent) — Prefab agent that gathers information by asking a series of questions. Registers <code>start\_questions</code> and <code>submit\_answer</code> tools.
- [`ReceptionistAgent`](/reference/dotnet/signal-wire.prefabs/receptionist-agent) — Prefab agent that greets callers and transfers them to departments. Registers <code>collect\_caller\_info</code> and <code>transfer\_call</code> tools.
- [`SurveyAgent`](/reference/dotnet/signal-wire.prefabs/survey-agent) — Prefab agent that conducts surveys with typed question validation. Registers <code>validate\_response</code> and <code>log\_response</code> tools.
