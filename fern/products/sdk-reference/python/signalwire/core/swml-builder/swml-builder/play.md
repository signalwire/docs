---
slug: "/reference/python/signalwire/core/swml-builder/swml-builder/play"
title: "play"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_builder.SWMLBuilder.play"
  parent: "signalwire.core.swml_builder.SWMLBuilder"
  module: "signalwire.core.swml_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py"
---
# `play`

Add a 'play' verb to the main section

## Signature

```python
play(
    url: Optional[str] = None,
    urls: Optional[List[str]] = None,
    volume: Optional[float] = None,
    say_voice: Optional[str] = None,
    say_language: Optional[str] = None,
    say_gender: Optional[str] = None,
    auto_answer: Optional[bool] = None
) -> Self
```

## Parameters

| Name           | Type                  | Required | Default | Description                                        |
| -------------- | --------------------- | -------- | ------- | -------------------------------------------------- |
| `url`          | `Optional[str]`       | no       | `None`  | Single URL to play (mutually exclusive with urls)  |
| `urls`         | `Optional[List[str]]` | no       | `None`  | List of URLs to play (mutually exclusive with url) |
| `volume`       | `Optional[float]`     | no       | `None`  | Volume level (-40 to 40)                           |
| `say_voice`    | `Optional[str]`       | no       | `None`  | Voice for text-to-speech                           |
| `say_language` | `Optional[str]`       | no       | `None`  | Language for text-to-speech                        |
| `say_gender`   | `Optional[str]`       | no       | `None`  | Gender for text-to-speech                          |
| `auto_answer`  | `Optional[bool]`      | no       | `None`  | Whether to auto-answer the call                    |

## Returns

`Self` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/swml_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py)

Line 132.
