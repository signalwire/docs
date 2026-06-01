---
slug: "/reference/python/signalwire/relay/call/call/ai"
title: "ai"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.ai"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `ai`

Start an AI agent session on the call. Returns an AIAction.

**Modifiers:** `async`

## Signature

```python
async ai(
    *,
    control_id: Optional[str] = None,
    agent: Optional[str] = None,
    prompt: Optional[dict[str, Any]] = None,
    post_prompt: Optional[dict[str, Any]] = None,
    post_prompt_url: Optional[str] = None,
    post_prompt_auth_user: Optional[str] = None,
    post_prompt_auth_password: Optional[str] = None,
    global_data: Optional[dict[str, Any]] = None,
    pronounce: Optional[list[dict[str, Any]]] = None,
    hints: Optional[list[str]] = None,
    languages: Optional[list[dict[str, Any]]] = None,
    SWAIG: Optional[dict[str, Any]] = None,
    ai_params: Optional[dict[str, Any]] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> AIAction
```

## Parameters

| Name                        | Type                                  | Required | Default | Description |
| --------------------------- | ------------------------------------- | -------- | ------- | ----------- |
| `control_id`                | `Optional[str]`                       | no       | `None`  | —           |
| `agent`                     | `Optional[str]`                       | no       | `None`  | —           |
| `prompt`                    | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `post_prompt`               | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `post_prompt_url`           | `Optional[str]`                       | no       | `None`  | —           |
| `post_prompt_auth_user`     | `Optional[str]`                       | no       | `None`  | —           |
| `post_prompt_auth_password` | `Optional[str]`                       | no       | `None`  | —           |
| `global_data`               | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `pronounce`                 | `Optional[list[dict[str, Any]]]`      | no       | `None`  | —           |
| `hints`                     | `Optional[list[str]]`                 | no       | `None`  | —           |
| `languages`                 | `Optional[list[dict[str, Any]]]`      | no       | `None`  | —           |
| `SWAIG`                     | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `ai_params`                 | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `on_completed`              | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`                 | `Any`                                 | no       | `{}`    | —           |

## Returns

`AIAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1118.
