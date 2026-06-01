---
slug: "/reference/dotnet/signal-wire.pom/prompt-object-model/add-pom-as-subsection"
title: "AddPomAsSubsection"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PromptObjectModel.AddPomAsSubsection(string, SignalWire.POM.PromptObjectModel)"
  parent: "SignalWire.POM.PromptObjectModel"
  module: "SignalWire.POM"
  visibility: "public"
---
# `AddPomAsSubsection`

Add a PromptObjectModel as a subsection of an existing
section in this model, identified by title.
(Python parity: `PromptObjectModel.add_pom_as_subsection`.)

## Signature

**Overload 1**

```dotnet
public void AddPomAsSubsection(string targetTitle, PromptObjectModel pomToAdd)
```

**Overload 2**

```dotnet
public void AddPomAsSubsection(Section target, PromptObjectModel pomToAdd)
```

## Parameters (Overload 1)

| Name          | Type                               | Required | Default | Description |
| ------------- | ---------------------------------- | -------- | ------- | ----------- |
| `targetTitle` | `string`                           | yes      | —       | —           |
| `pomToAdd`    | `SignalWire.POM.PromptObjectModel` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type                               | Required | Default | Description |
| ---------- | ---------------------------------- | -------- | ------- | ----------- |
| `target`   | `SignalWire.POM.Section`           | yes      | —       | —           |
| `pomToAdd` | `SignalWire.POM.PromptObjectModel` | yes      | —       | —           |
