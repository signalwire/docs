---
slug: "/reference/python/signalwire/pom/pom/prompt-object-model/add-section"
title: "add_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.PromptObjectModel.add_section"
  parent: "signalwire.pom.pom.PromptObjectModel"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `add_section`

Add a top-level section to the model.

## Signature

```python
add_section(
    title: Optional[str] = None,
    *,
    body: str = '',
    bullets: Optional[Union[List[str], str]] = None,
    numbered: Optional[bool] = None,
    numberedBullets: bool = False
) -> Section
```

## Parameters

| Name              | Type                              | Required | Default | Description                                       |
| ----------------- | --------------------------------- | -------- | ------- | ------------------------------------------------- |
| `title`           | `Optional[str]`                   | no       | `None`  | The title of the section                          |
| `body`            | `str`                             | no       | `''`    | Optional body text for the section                |
| `bullets`         | `Optional[Union[List[str], str]]` | no       | `None`  | Optional list of bullet points or a single string |
| `numbered`        | `Optional[bool]`                  | no       | `None`  | Whether this section should be numbered           |
| `numberedBullets` | `bool`                            | no       | `False` | Whether bullets should be numbered                |

## Returns

`Section` — The newly created Section object

## Throws

- `ValueError` — If a section without a title is added after the first section

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 363.
