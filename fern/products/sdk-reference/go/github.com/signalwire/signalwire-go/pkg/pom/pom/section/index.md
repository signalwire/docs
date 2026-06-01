---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section"
title: "Section"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.Section"
  parent: "github.com/signalwire/signalwire-go/pkg/pom"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `Section`

Section is one node in the POM tree.

Python equivalent: signalwire.pom.pom.Section. The exported field names match the JSON / YAML schema:

```
{"title": "...", "body": "...", "bullets": [...],
 "subsections": [...], "numbered": true, "numberedBullets": true}
```

Title is a \*string (not string) to faithfully model Python's "title may be None" semantics for the optional first top-level section. All other fields use zero values to mean "absent".

## Signature

```go
type Section struct
```

## Examples

**Example 1**

```go
{"title": "...", "body": "...", "bullets": [...],
 "subsections": [...], "numbered": true, "numberedBullets": true}
```

**Example 2**

```go
{"title": "...", "body": "...", "bullets": [...],
 "subsections": [...], "numbered": true, "numberedBullets": true}
```

## Properties

| Name              | Type                     | Required | Default | Description                                                                                                                           |
| ----------------- | ------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `Body`            | `Body string`            | yes      | —       | Body is a paragraph of free text (rendered before any bullets).                                                                       |
| `Bullets`         | `Bullets []string`       | yes      | —       | Bullets is the list of bullet points.  Empty means no bullet list.                                                                    |
| `Numbered`        | `Numbered *bool`         | yes      | —       | Numbered, when non-nil, opts the section into (or out of) numeric section numbering.  nil means "default" (inherit sibling behavior). |
| `NumberedBullets` | `NumberedBullets bool`   | yes      | —       | NumberedBullets renders bullets as "1." "2." instead of "-".                                                                          |
| `Subsections`     | `Subsections []*Section` | yes      | —       | Subsections is the list of nested child sections.                                                                                     |
| `Title`           | `Title *string`          | yes      | —       | Title is the section heading.  nil means untitled (only legal for the first top-level section in a PromptObjectModel).                |

## Methods

- [`AddBody`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/add-body) — AddBody sets (or replaces) the section body text.
- [`AddBullets`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/add-bullets) — AddBullets appends bullet points to the section.
- [`AddSubsection`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/add-subsection) — AddSubsection creates and appends a subsection under this section. title must be non-empty (subsections always require a title). Returns the new \*Section so callers can keep building.
- [`RenderMarkdown`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/render-markdown) — RenderMarkdown returns this section (and its subsections) as a Markdown string. level controls the starting heading level (default 2 == "##"); sectionNumber is the optional dotted prefix the section inherits when its parent is numbered.
- [`RenderXML`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/render-xml) — RenderXML returns this section (and its subsections) as a chunk of XML. indent is the starting indent level (each level == 2 spaces).
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/to-map) — ToMap returns the section as a map\[string]any with keys in canonical order (title, body, bullets, subsections, numbered, numberedBullets). Empty-or-zero fields are omitted to match Python's to\_dict behavior.

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 47.
