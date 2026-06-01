---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel"
  parent: "github.com/signalwire/signalwire-go/pkg/pom"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `PromptObjectModel`

PromptObjectModel is the root container — a list of top-level Sections plus serialization / rendering helpers. Use NewPromptObjectModel() to construct one, or FromJSON / FromYAML to parse one.

Python equivalent: signalwire.pom.pom.PromptObjectModel

## Signature

```go
type PromptObjectModel struct
```

## Properties

| Name       | Type                  | Required | Default | Description                                                                                        |
| ---------- | --------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------- |
| `Debug`    | `Debug bool`          | yes      | —       | Debug, when true, prints rendering decisions to stderr (matches the Python flag).  Off by default. |
| `Sections` | `Sections []*Section` | yes      | —       | Sections is the ordered list of top-level sections.  Only the first section may have a nil Title.  |

## Methods

- [`AddPomAsSubsection`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/add-pom-as-subsection) — AddPomAsSubsection attaches every top-level section of pomToAdd underneath the section identified by target — either the title of an existing section in this POM, or a \*Section pointer.
- [`AddSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/add-section) — AddSection appends a top-level section. title may be empty only for the first section (Python contract: "Only the first section can have no title"). The returned \*Section can be configured further (for example, by calling AddSubsection on it).
- [`Clone`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/clone) — Clone returns a deep copy of the POM. Useful when an agent wants to hand callers a snapshot without exposing internal mutable state.
- [`FindSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/find-section) — FindSection performs a recursive depth-first search for a section whose Title matches. Returns nil if no match is found.
- [`RenderMarkdown`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/render-markdown) — RenderMarkdown renders the entire POM as a Markdown document.
- [`RenderXML`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/render-xml) — RenderXML renders the entire POM as an XML document with the canonical “<?xml ...?>\<prompt> ... </prompt>“ envelope.
- [`ToJSON`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/to-json) — ToJSON serializes the POM to a JSON string. Matches Python's json.dumps(..., indent=2) byte-for-byte for the canonical fixtures.
- [`ToList`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/to-list) — ToList returns the POM as \[]map\[string]any (one entry per top-level section), matching Python's to\_dict.
- [`ToYAML`](/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/to-yaml) — ToYAML serializes the POM to a YAML string in the same shape as Python's yaml.dump(..., default\_flow\_style=False, sort\_keys=False). PyYAML uses block-sequence-with-indent-0 by default (the leading "-" of each list item aligns with the parent's mapping key, not after it); gopkg.in/yaml.v3 cannot be configured to do the same, so this renderer writes the YAML structure manually for byte-for-byte parity.

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 329.
