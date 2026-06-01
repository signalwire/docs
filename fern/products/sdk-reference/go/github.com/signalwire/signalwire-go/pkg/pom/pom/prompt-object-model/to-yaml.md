---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/to-yaml"
title: "ToYAML"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel.ToYAML"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `ToYAML`

ToYAML serializes the POM to a YAML string in the same shape as Python's yaml.dump(..., default\_flow\_style=False, sort\_keys=False). PyYAML uses block-sequence-with-indent-0 by default (the leading "-" of each list item aligns with the parent's mapping key, not after it); gopkg.in/yaml.v3 cannot be configured to do the same, so this renderer writes the YAML structure manually for byte-for-byte parity.

Python equivalent: PromptObjectModel.to\_yaml

## Signature

```go
func (*PromptObjectModel) ToYAML() string
```

## Returns

`string`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 500.
