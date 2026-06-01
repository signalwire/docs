---
slug: "/reference/dotnet/signal-wire.pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PromptObjectModel"
  parent: "SignalWire.POM"
  module: "SignalWire.POM"
  visibility: "public"
---
# `PromptObjectModel`

## Signature

```dotnet
public class PromptObjectModel
```

## Properties

| Name       | Type                                              | Required | Default | Description |
| ---------- | ------------------------------------------------- | -------- | ------- | ----------- |
| `Debug`    | `public bool Debug { get; set; }`                 | yes      | —       | —           |
| `Sections` | `public IReadOnlyList<Section> Sections { get; }` | yes      | —       | —           |

## Methods

- [`AddPomAsSubsection`](/reference/dotnet/signal-wire.pom/prompt-object-model/add-pom-as-subsection) — Add a PromptObjectModel as a subsection of an existing section in this model, identified by title. (Python parity: `PromptObjectModel.add_pom_as_subsection`.)
- [`AddSection(string?, string, List<string>?, bool?, bool)`](/reference/dotnet/signal-wire.pom/prompt-object-model/add-section-string-string-list-string-bool-bool) — Add a top-level section to the model, returning the new Section. Only the first added section may have a null title. (Python parity: `PromptObjectModel.add_section`.)
- [`FindSection(string)`](/reference/dotnet/signal-wire.pom/prompt-object-model/find-section-string) — Recursively find a section by title. Returns null if not found. (Python parity: `PromptObjectModel.find_section`.)
- [`FromJson(string)`](/reference/dotnet/signal-wire.pom/prompt-object-model/from-json-string) — Construct a PromptObjectModel from JSON. (Python parity: `PromptObjectModel.from_json`.)
- [`FromYaml(string)`](/reference/dotnet/signal-wire.pom/prompt-object-model/from-yaml-string) — Construct a PromptObjectModel from YAML string. (Python parity: `PromptObjectModel.from_yaml`.)
- [`PromptObjectModel(bool)`](/reference/dotnet/signal-wire.pom/prompt-object-model/prompt-object-model-bool)
- [`RenderMarkdown()`](/reference/dotnet/signal-wire.pom/prompt-object-model/render-markdown) — Render the model as markdown. Mirrors Python's `PromptObjectModel.render_markdown` exactly.
- [`RenderXml()`](/reference/dotnet/signal-wire.pom/prompt-object-model/render-xml)
- [`ToDict()`](/reference/dotnet/signal-wire.pom/prompt-object-model/to-dict) — Serialize to a list of dicts (matches Python's to\_dict which returns a List rather than a Dict).
- [`ToJson()`](/reference/dotnet/signal-wire.pom/prompt-object-model/to-json) — Serialize to JSON string with 2-space indent and Python dict-style formatting. Empty model emits `"[]"`.
- [`ToYaml()`](/reference/dotnet/signal-wire.pom/prompt-object-model/to-yaml) — Serialize to YAML string. Matches PyYAML's `yaml.dump(data, default_flow_style=False, sort_keys=False)` exactly. Empty model emits `"[]\n"`.
