---
slug: "/reference/python/signalwire/core/swml-renderer/swml-renderer/render-swml"
title: "render_swml"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_renderer.SwmlRenderer.render_swml"
  parent: "signalwire.core.swml_renderer.SwmlRenderer"
  module: "signalwire.core.swml_renderer"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_renderer.py"
---
# `render_swml`

Generate a complete SWML document with AI configuration

**Modifiers:** `static`

## Signature

```python
@staticmethod
render_swml(
    prompt: Union[str, List[Dict[str, Any]]],
    service: SWMLService,
    post_prompt: Optional[str] = None,
    post_prompt_url: Optional[str] = None,
    swaig_functions: Optional[List[Dict[str, Any]]] = None,
    startup_hook_url: Optional[str] = None,
    hangup_hook_url: Optional[str] = None,
    prompt_is_pom: bool = False,
    params: Optional[Dict[str, Any]] = None,
    add_answer: bool = False,
    record_call: bool = False,
    record_format: str = 'mp4',
    record_stereo: bool = True,
    format: str = 'json',
    default_webhook_url: Optional[str] = None
) -> str
```

## Parameters

| Name                  | Type                               | Required | Default  | Description                                       |
| --------------------- | ---------------------------------- | -------- | -------- | ------------------------------------------------- |
| `prompt`              | `Union[str, List[Dict[str, Any]]]` | yes      | —        | AI prompt text or POM structure                   |
| `service`             | `SWMLService`                      | yes      | —        | SWMLService instance to use for document building |
| `post_prompt`         | `Optional[str]`                    | no       | `None`   | Optional post-prompt text                         |
| `post_prompt_url`     | `Optional[str]`                    | no       | `None`   | Optional post-prompt URL                          |
| `swaig_functions`     | `Optional[List[Dict[str, Any]]]`   | no       | `None`   | List of SWAIG function definitions                |
| `startup_hook_url`    | `Optional[str]`                    | no       | `None`   | Optional startup hook URL                         |
| `hangup_hook_url`     | `Optional[str]`                    | no       | `None`   | Optional hangup hook URL                          |
| `prompt_is_pom`       | `bool`                             | no       | `False`  | Whether prompt is POM format                      |
| `params`              | `Optional[Dict[str, Any]]`         | no       | `None`   | Additional AI verb parameters                     |
| `add_answer`          | `bool`                             | no       | `False`  | Whether to add answer verb                        |
| `record_call`         | `bool`                             | no       | `False`  | Whether to add record\_call verb                  |
| `record_format`       | `str`                              | no       | `'mp4'`  | Recording format                                  |
| `record_stereo`       | `bool`                             | no       | `True`   | Whether to record in stereo                       |
| `format`              | `str`                              | no       | `'json'` | Output format (json or yaml)                      |
| `default_webhook_url` | `Optional[str]`                    | no       | `None`   | Default webhook URL for SWAIG functions           |

## Returns

`str` — SWML document as a string

## Source

[`/src/signalwire/signalwire/core/swml_renderer.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_renderer.py)

Line 28.
