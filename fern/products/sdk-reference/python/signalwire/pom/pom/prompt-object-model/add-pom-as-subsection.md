---
slug: "/reference/python/signalwire/pom/pom/prompt-object-model/add-pom-as-subsection"
title: "add_pom_as_subsection"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.PromptObjectModel.add_pom_as_subsection"
  parent: "signalwire.pom.pom.PromptObjectModel"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `add_pom_as_subsection`

Add another PromptObjectModel as a subsection to a section with the given title or section object.

## Signature

```python
add_pom_as_subsection(
    target: Union[str, Section],
    pom_to_add: PromptObjectModel
)
```

## Parameters

| Name         | Type                  | Required | Default | Description                                                                                      |
| ------------ | --------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------ |
| `target`     | `Union[str, Section]` | yes      | —       | The title of the section or the Section object to which the POM should be added as a subsection. |
| `pom_to_add` | `PromptObjectModel`   | yes      | —       | The PromptObjectModel to add as a subsection.                                                    |

## Throws

- `ValueError` — If no section with the target title is found (when target is a string).

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 519.
