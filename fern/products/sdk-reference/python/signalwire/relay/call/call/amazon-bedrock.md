---
slug: "/reference/python/signalwire/relay/call/call/amazon-bedrock"
title: "amazon_bedrock"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.amazon_bedrock"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `amazon_bedrock`

Connect to an Amazon Bedrock AI agent.

**Modifiers:** `async`

## Signature

```python
async amazon_bedrock(
    *,
    prompt: Optional[Any] = None,
    SWAIG: Optional[dict[str, Any]] = None,
    ai_params: Optional[dict[str, Any]] = None,
    global_data: Optional[dict[str, Any]] = None,
    post_prompt: Optional[dict[str, Any]] = None,
    post_prompt_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name              | Type                       | Required | Default | Description |
| ----------------- | -------------------------- | -------- | ------- | ----------- |
| `prompt`          | `Optional[Any]`            | no       | `None`  | —           |
| `SWAIG`           | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `ai_params`       | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `global_data`     | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `post_prompt`     | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `post_prompt_url` | `Optional[str]`            | no       | `None`  | —           |
| `...kwargs`       | `Any`                      | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1168.
