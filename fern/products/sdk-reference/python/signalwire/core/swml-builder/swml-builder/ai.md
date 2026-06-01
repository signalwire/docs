---
slug: "/reference/python/signalwire/core/swml-builder/swml-builder/ai"
title: "ai"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_builder.SWMLBuilder.ai"
  parent: "signalwire.core.swml_builder.SWMLBuilder"
  module: "signalwire.core.swml_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py"
---
# `ai`

Add an 'ai' verb to the main section

## Signature

```python
ai(
    prompt_text: Optional[str] = None,
    prompt_pom: Optional[List[Dict[str, Any]]] = None,
    post_prompt: Optional[str] = None,
    post_prompt_url: Optional[str] = None,
    swaig: Optional[Dict[str, Any]] = None,
    **kwargs = {}
) -> Self
```

## Parameters

| Name              | Type                             | Required | Default | Description                                                            |
| ----------------- | -------------------------------- | -------- | ------- | ---------------------------------------------------------------------- |
| `prompt_text`     | `Optional[str]`                  | no       | `None`  | Text prompt for the AI (mutually exclusive with prompt\_pom)           |
| `prompt_pom`      | `Optional[List[Dict[str, Any]]]` | no       | `None`  | POM structure for the AI prompt (mutually exclusive with prompt\_text) |
| `post_prompt`     | `Optional[str]`                  | no       | `None`  | Optional post-prompt text                                              |
| `post_prompt_url` | `Optional[str]`                  | no       | `None`  | Optional URL for post-prompt processing                                |
| `swaig`           | `Optional[Dict[str, Any]]`       | no       | `None`  | Optional SWAIG configuration                                           |
| `...kwargs`       | —                                | no       | `{}`    | —                                                                      |

## Returns

`Self` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/swml_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_builder.py)

Line 89.
