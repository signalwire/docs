---
slug: "/reference/python/signalwire/core/function-result/function-result/tap"
title: "tap"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.tap"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `tap`

Start background call tap using SWML.

This is a virtual helper that generates SWML to start background call tapping.
Media is streamed over Websocket or RTP to customer controlled URI.

## Signature

```python
tap(
    uri: str,
    control_id: Optional[str] = None,
    direction: str = 'both',
    codec: str = 'PCMU',
    rtp_ptime: int = 20,
    status_url: Optional[str] = None
) -> FunctionResult
```

## Parameters

| Name         | Type            | Required | Default  | Description                                                                                                                        |
| ------------ | --------------- | -------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `uri`        | `str`           | yes      | —        | Destination of tap media stream (required) Formats: rtp://IP:port, ws://example.com, or wss://example.com                          |
| `control_id` | `Optional[str]` | no       | `None`   | Identifier for this tap to use with stop\_tap (optional) Default is generated and stored in tap\_control\_id variable              |
| `direction`  | `str`           | no       | `'both'` | Direction of audio to tap (default: "both") "speak" = what party says "hear" = what party hears "both" = what party hears and says |
| `codec`      | `str`           | no       | `'PCMU'` | Codec for tap media stream - "PCMU" or "PCMA" (default: "PCMU")                                                                    |
| `rtp_ptime`  | `int`           | no       | `20`     | Packetization time in milliseconds for RTP (default: 20)                                                                           |
| `status_url` | `Optional[str]` | no       | `None`   | URL for status change requests (optional)                                                                                          |

## Returns

`FunctionResult` — self for method chaining

## Throws

- `ValueError` — If direction or codec values are invalid

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1183.
