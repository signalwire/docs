---
slug: "/reference/python/signalwire/core/swml-service/swml-service/add-section"
title: "add_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService.add_section"
  parent: "signalwire.core.swml_service.SWMLService"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
---
# `add_section`

Add a new section to the document

## Signature

```python
add_section(section_name: str) -> bool
```

## Parameters

| Name           | Type  | Required | Default | Description                |
| -------------- | ----- | -------- | ------- | -------------------------- |
| `section_name` | `str` | yes      | —       | Name of the section to add |

## Returns

`bool` — True if the section was added, False if it already exists

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 473.
