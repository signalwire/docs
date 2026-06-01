---
slug: "/reference/python/signalwire/core/swml-handler/ai-verb-handler/build-config"
title: "build_config"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_handler.AIVerbHandler.build_config"
  parent: "signalwire.core.swml_handler.AIVerbHandler"
  module: "signalwire.core.swml_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py"
---
# `build_config`

Build a configuration for the AI verb

## Signature

```python
build_config(
    prompt_text: Optional[str] = None,
    prompt_pom: Optional[List[Dict[str, Any]]] = None,
    contexts: Optional[Dict[str, Any]] = None,
    post_prompt: Optional[str] = None,
    post_prompt_url: Optional[str] = None,
    swaig: Optional[Dict[str, Any]] = None,
    **kwargs = {}
) -> Dict[str, Any]
```

## Parameters

| Name              | Type                             | Required | Default | Description                                                                  |
| ----------------- | -------------------------------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `prompt_text`     | `Optional[str]`                  | no       | `None`  | Text prompt for the AI (mutually exclusive with prompt\_pom)                 |
| `prompt_pom`      | `Optional[List[Dict[str, Any]]]` | no       | `None`  | POM structure for the AI prompt (mutually exclusive with prompt\_text)       |
| `contexts`        | `Optional[Dict[str, Any]]`       | no       | `None`  | Optional contexts and steps configuration (can be combined with text or pom) |
| `post_prompt`     | `Optional[str]`                  | no       | `None`  | Optional post-prompt text                                                    |
| `post_prompt_url` | `Optional[str]`                  | no       | `None`  | Optional URL for post-prompt processing                                      |
| `swaig`           | `Optional[Dict[str, Any]]`       | no       | `None`  | Optional SWAIG configuration                                                 |
| `...kwargs`       | —                                | no       | `{}`    | —                                                                            |

## Returns

`Dict[str, Any]` — AI verb configuration dictionary

## Source

[`/src/signalwire/signalwire/core/swml_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py)

Line 132.
