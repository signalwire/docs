---
slug: "/reference/python/signalwire/core/agent-base/agent-base/add-post-answer-verb"
title: "add_post_answer_verb"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.add_post_answer_verb"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `add_post_answer_verb`

Add a verb to run after the call is answered but before the AI starts.

Post-answer verbs run after the call is connected. Common uses include
welcome messages, legal disclaimers, and hold music.

> \[!NOTE]
>
> # Play welcome message
>
> agent.add\_post\_answer\_verb("play", {
> "url": "say:Welcome to Acme Corporation."
> })
>
> # Brief pause
>
> agent.add\_post\_answer\_verb("sleep", {"time": 500})

## Signature

```python
add_post_answer_verb(verb_name: str, config: Dict[str, Any]) -> AgentBase
```

## Parameters

| Name        | Type             | Required | Default | Description                                |
| ----------- | ---------------- | -------- | ------- | ------------------------------------------ |
| `verb_name` | `str`            | yes      | —       | The SWML verb name (e.g., "play", "sleep") |
| `config`    | `Dict[str, Any]` | yes      | —       | Verb configuration dictionary              |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 556.
