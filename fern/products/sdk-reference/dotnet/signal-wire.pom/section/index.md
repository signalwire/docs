---
slug: "/reference/dotnet/signal-wire.pom/section"
title: "Section"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.POM.Section"
  parent: "SignalWire.POM"
  module: "SignalWire.POM"
  visibility: "public"
---
# `Section`

## Signature

```dotnet
public class Section
```

## Properties

| Name              | Type                                        | Required | Default | Description                                                                                                                                                                                                                                                       |
| ----------------- | ------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Body`            | `public string Body { get; set; }`          | yes      | —       | —                                                                                                                                                                                                                                                                 |
| `Bullets`         | `public List<string> Bullets { get; }`      | yes      | —       | —                                                                                                                                                                                                                                                                 |
| `Numbered`        | `public bool? Numbered { get; set; }`       | yes      | —       | Three-state numbering: null = inherit, true = force on, false = force off. (Python parity: `numbered` is `Optional[bool]`.) Sibling propagation: if any sibling at the same level has Numbered==true, all siblings get numbered unless they have Numbered==false. |
| `NumberedBullets` | `public bool NumberedBullets { get; set; }` | yes      | —       | —                                                                                                                                                                                                                                                                 |
| `Subsections`     | `public List<Section> Subsections { get; }` | yes      | —       | —                                                                                                                                                                                                                                                                 |
| `Title`           | `public string? Title { get; set; }`        | yes      | —       | Section title. Null for the (allowed) first untitled top-level section. (Python parity: `Section.title` is `Optional[str]`.)                                                                                                                                      |

## Methods

- [`AddBody(string)`](/reference/dotnet/signal-wire.pom/section/add-body-string) — Set or replace this section's body text. (Python parity: `Section.add_body`.)
- [`AddBullets(List<string>)`](/reference/dotnet/signal-wire.pom/section/add-bullets-list-string) — Append bullets to this section. (Python parity: `Section.add_bullets`.)
- [`AddSubsection(string?, string, List<string>?, bool?, bool)`](/reference/dotnet/signal-wire.pom/section/add-subsection-string-string-list-string-bool-bool) — Add a subsection under this section, returning the new Section. (Python parity: `Section.add_subsection`.)
- [`RenderMarkdown(int, List<int>?)`](/reference/dotnet/signal-wire.pom/section/render-markdown-int-list-int) — Render this section as a markdown fragment, indented at the given header level (default 2). Mirrors Python's `Section.render_markdown` exactly.
- [`RenderXml(int, List<int>?)`](/reference/dotnet/signal-wire.pom/section/render-xml-int-list-int)
- [`Section(string?, string, List<string>?, bool?, bool)`](/reference/dotnet/signal-wire.pom/section/section-string-string-list-string-bool-bool)
- [`ToDict()`](/reference/dotnet/signal-wire.pom/section/to-dict) — Serialize to a Dictionary suitable for JSON. Emits keys in this exact order: title, body, bullets, subsections, numbered, numberedBullets — and only when non-empty / non-null / non-default. Mirrors Python's `Section.to_dict`.
