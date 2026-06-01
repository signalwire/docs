---
slug: "/reference/dotnet/signal-wire.pom/pom-builder"
title: "PomBuilder"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PomBuilder"
  parent: "SignalWire.POM"
  module: "SignalWire.POM"
  visibility: "public"
---
# `PomBuilder`

## Signature

```dotnet
public class PomBuilder
```

## Properties

| Name  | Type                                    | Required | Default | Description |
| ----- | --------------------------------------- | -------- | ------- | ----------- |
| `Pom` | `public PromptObjectModel Pom { get; }` | yes      | —       | —           |

## Methods

- [`AddSection(string, string, List<string>?, bool, bool, List<Dictionary<string, object>>?)`](/reference/dotnet/signal-wire.pom/pom-builder/add-section-string-string-list-string-bool-bool-list-dictionary-string-object) — Add a new section. (Python parity: `PomBuilder.add_section`.)
- [`AddSubsection(string, string, string, List<string>?)`](/reference/dotnet/signal-wire.pom/pom-builder/add-subsection-string-string-string-list-string) — Add a subsection under an existing section (auto-vivifies parent if missing). (Python parity: `PomBuilder.add_subsection`.)
- [`AddToSection(string, string?, string?, List<string>?)`](/reference/dotnet/signal-wire.pom/pom-builder/add-to-section-string-string-string-list-string) — Add content to an existing section (auto-vivifies if missing). (Python parity: `PomBuilder.add_to_section`.)
- [`FromSections(List<Dictionary<string, object>>)`](/reference/dotnet/signal-wire.pom/pom-builder/from-sections-list-dictionary-string-object) — Build a PomBuilder from a list of section dicts. (Python parity: `PomBuilder.from_sections` classmethod.)
- [`GetSection(string)`](/reference/dotnet/signal-wire.pom/pom-builder/get-section-string) — Get a section by title, or null if absent. (Python parity: `PomBuilder.get_section`.)
- [`HasSection(string)`](/reference/dotnet/signal-wire.pom/pom-builder/has-section-string) — Check if a section with the given title exists. (Python parity: `PomBuilder.has_section`.)
- [`PomBuilder()`](/reference/dotnet/signal-wire.pom/pom-builder/pom-builder)
- [`RenderMarkdown()`](/reference/dotnet/signal-wire.pom/pom-builder/render-markdown) — Render the POM as markdown.
- [`RenderXml()`](/reference/dotnet/signal-wire.pom/pom-builder/render-xml) — Render the POM as XML.
- [`ToDict()`](/reference/dotnet/signal-wire.pom/pom-builder/to-dict) — Serialize the POM to a list of section dicts.
- [`ToJson()`](/reference/dotnet/signal-wire.pom/pom-builder/to-json) — Serialize the POM to a JSON string.
