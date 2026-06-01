---
slug: "/reference/python/signalwire/core/agent-base/agent-base/add-answer-verb"
title: "add_answer_verb"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.add_answer_verb"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `add_answer_verb`

Configure the answer verb.

The answer verb connects the call. Use this method to customize
answer behavior, such as setting max\_duration.

> \[!NOTE]
>
> # Set maximum call duration to 1 hour
>
> agent.add\_answer\_verb({"max\_duration": 3600})

## Signature

```python
add_answer_verb(config: Optional[Dict[str, Any]] = None) -> AgentBase
```

## Parameters

| Name     | Type                       | Required | Default | Description                                                        |
| -------- | -------------------------- | -------- | ------- | ------------------------------------------------------------------ |
| `config` | `Optional[Dict[str, Any]]` | no       | `None`  | Optional answer verb configuration (e.g., {"max\_duration": 3600}) |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 536.
