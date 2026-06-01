---
slug: "/reference/python/signalwire/pom/pom/section/add-subsection"
title: "add_subsection"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.Section.add_subsection"
  parent: "signalwire.pom.pom.Section"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `add_subsection`

Add a subsection to this section.

## Signature

```python
add_subsection(
    title: str,
    *,
    body: str = '',
    bullets: Optional[List[str]] = None,
    numbered: bool = False,
    numberedBullets: bool = False
) -> Section
```

## Parameters

| Name              | Type                  | Required | Default | Description                             |
| ----------------- | --------------------- | -------- | ------- | --------------------------------------- |
| `title`           | `str`                 | yes      | —       | The title of the subsection             |
| `body`            | `str`                 | no       | `''`    | Optional body text for the subsection   |
| `bullets`         | `Optional[List[str]]` | no       | `None`  | Optional list of bullet points          |
| `numbered`        | `bool`                | no       | `False` | Whether this section should be numbered |
| `numberedBullets` | `bool`                | no       | `False` | Whether bullets should be numbered      |

## Returns

`Section` — The newly created Section object

## Throws

- `ValueError` — If the title is None or if the section has neither a body nor bullets

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 51.
