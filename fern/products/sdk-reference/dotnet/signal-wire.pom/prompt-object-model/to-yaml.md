---
slug: "/reference/dotnet/signal-wire.pom/prompt-object-model/to-yaml"
title: "ToYaml()"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PromptObjectModel.ToYaml()"
  parent: "SignalWire.POM.PromptObjectModel"
  module: "SignalWire.POM"
  visibility: "public"
---
# `ToYaml()`

Serialize to YAML string. Matches PyYAML's
`yaml.dump(data, default_flow_style=False, sort_keys=False)`
exactly. Empty model emits `"[]\n"`.

## Signature

```dotnet
public string ToYaml()
```

## Returns

`string`
