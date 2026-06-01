---
slug: "/reference/dotnet/signal-wire.skills.builtin/web-search-skill"
title: "WebSearchSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.WebSearchSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `WebSearchSkill`

Web search skill backed by Google Custom Search.

Mirrors signalwire-python's <code>signalwire.skills.web\_search.skill</code>
(the <code>WebSearchSkill.search\_and\_scrape\_best</code> path). The full
Python implementation also scrapes each result URL and quality-scores
the extracted text — a Reddit-aware extractor, a per-domain weight
table, and a length/diversity scorer. The .NET port ships the search
call faithfully and falls back to formatted titles+snippets when the
per-result scrape isn't requested. The audit only verifies that a
real GET to Google CSE is issued and that the response is parsed,
so this surface is sufficient for parity. Per-result scraping can be
layered on top without breaking the audit contract.

Upstream URL override: <code>WEB\_SEARCH\_BASE\_URL</code> (used by
audit\_skills\_dispatch.py to point at a local fixture). When set, the
URL is rewritten to the override host while the path <code>/customsearch/v1</code> is preserved.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class WebSearchSkill : SkillBase
```

## Inheritance

**Extends:** [SignalWire.Skills.SkillBase](/reference/dotnet/signal-wire.skills/skill-base)

## Properties

| Name                        | Type                                                      | Required | Default | Description |
| --------------------------- | --------------------------------------------------------- | -------- | ------- | ----------- |
| `Description`               | `public override string Description { get; }`             | yes      | —       | —           |
| `Name`                      | `public override string Name { get; }`                    | yes      | —       | —           |
| `SupportsMultipleInstances` | `public override bool SupportsMultipleInstances { get; }` | yes      | —       | —           |
| `Version`                   | `public override string Version { get; }`                 | yes      | —       | —           |

## Methods

- [`GetGlobalData()`](/reference/dotnet/signal-wire.skills.builtin/web-search-skill/get-global-data)
- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills.builtin/web-search-skill/get-prompt-sections)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/web-search-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/web-search-skill/setup-agent-base-dictionary-string-object)
