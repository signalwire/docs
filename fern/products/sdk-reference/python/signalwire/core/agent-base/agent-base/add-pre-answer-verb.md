---
slug: "/reference/python/signalwire/core/agent-base/agent-base/add-pre-answer-verb"
title: "add_pre_answer_verb"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.add_pre_answer_verb"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `add_pre_answer_verb`

Add a verb to run before the call is answered.

Pre-answer verbs execute while the call is still ringing. Only certain
verbs are safe to use before answering:

> \[!NOTE]
> cond, if, eval, set, unset, hangup, send\_sms, sleep,
> stop\_record\_call, stop\_denoise, stop\_tap

Verbs with auto\_answer option (play, connect): Must include
"auto\_answer": False in config to prevent automatic answering.

> \[!NOTE]
>
> # Play ringback tone before answering
>
> agent.add\_pre\_answer\_verb("play", {
> "urls": \["ring:us"],
> "auto\_answer": False
> })

## Signature

```python
add_pre_answer_verb(verb_name: str, config: Dict[str, Any]) -> AgentBase
```

## Parameters

| Name        | Type             | Required | Default | Description                                           |
| ----------- | ---------------- | -------- | ------- | ----------------------------------------------------- |
| `verb_name` | `str`            | yes      | —       | The SWML verb name (e.g., "play", "sleep", "request") |
| `config`    | `Dict[str, Any]` | yes      | —       | Verb configuration dictionary                         |

## Returns

`AgentBase` — Self for method chaining

## Throws

- `ValueError` — If verb is not safe for pre-answer use

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 488.
