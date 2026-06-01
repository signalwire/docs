---
slug: "/reference/python/signalwire/core/swml-builder/swml-builder/say"
title: "say"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_builder.SWMLBuilder.say"
  parent: "signalwire.core.swml_builder.SWMLBuilder"
  module: "signalwire.core.swml_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py"
---
# `say`

Add a 'play' verb with say: prefix for text-to-speech

## Signature

```python
say(
    text: str,
    voice: Optional[str] = None,
    language: Optional[str] = None,
    gender: Optional[str] = None,
    volume: Optional[float] = None
) -> Self
```

## Parameters

| Name       | Type              | Required | Default | Description                 |
| ---------- | ----------------- | -------- | ------- | --------------------------- |
| `text`     | `str`             | yes      | —       | Text to speak               |
| `voice`    | `Optional[str]`   | no       | `None`  | Voice for text-to-speech    |
| `language` | `Optional[str]`   | no       | `None`  | Language for text-to-speech |
| `gender`   | `Optional[str]`   | no       | `None`  | Gender for text-to-speech   |
| `volume`   | `Optional[float]` | no       | `None`  | Volume level (-40 to 40)    |

## Returns

`Self` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/swml_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py)

Line 178.
