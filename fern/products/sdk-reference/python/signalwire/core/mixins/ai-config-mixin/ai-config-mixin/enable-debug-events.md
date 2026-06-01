---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/enable-debug-events"
title: "enable_debug_events"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.enable_debug_events"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `enable_debug_events`

Enable debug event webhook for this agent.

When enabled, the AI module will POST real-time debug events to a
/debug\_events endpoint on this agent during calls. Events are
automatically logged via the agent's structured logger, and can
optionally be handled with a custom callback via on\_debug\_event().

> \[!NOTE]
> agent = AgentBase("my\_agent")
> agent.enable\_debug\_events(level=1)
>
> @agent.on\_debug\_event
> def handle\_debug(event\_type, data):
> if event\_type == "llm\_error":
> alert\_ops\_team(data)

## Signature

```python
enable_debug_events(level: int = 1) -> AgentBase
```

## Parameters

| Name    | Type  | Required | Default | Description                                                                                                                                                                      |
| ------- | ----- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `level` | `int` | no       | `1`     | Debug event verbosity level. 1 = high-level events (barge, errors, session start/end, step changes) 2+ = adds high-volume events (every LLM request/response, conversation\_add) |

## Returns

`AgentBase` — Self for method chaining

## Examples

```python
@agent.on_debug_event
def handle_debug(event_type, data):
    if event_type == "llm_error":
        alert_ops_team(data)
```

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 472.
