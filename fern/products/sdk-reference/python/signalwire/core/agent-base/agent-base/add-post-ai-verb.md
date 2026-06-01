---
slug: "/reference/python/signalwire/core/agent-base/agent-base/add-post-ai-verb"
title: "add_post_ai_verb"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.add_post_ai_verb"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `add_post_ai_verb`

Add a verb to run after the AI conversation ends.

Post-AI verbs run when the AI completes its conversation. Common uses
include clean disconnects, transfers, and logging.

> \[!NOTE]
>
> # Log call completion and hang up
>
> agent.add\_post\_ai\_verb("request", {
> "url": "https://api.example.com/call-complete",
> "method": "POST"
> })
> agent.add\_post\_ai\_verb("hangup", {})

## Signature

```python
add_post_ai_verb(verb_name: str, config: Dict[str, Any]) -> AgentBase
```

## Parameters

| Name        | Type             | Required | Default | Description                                                |
| ----------- | ---------------- | -------- | ------- | ---------------------------------------------------------- |
| `verb_name` | `str`            | yes      | —       | The SWML verb name (e.g., "hangup", "transfer", "request") |
| `config`    | `Dict[str, Any]` | yes      | —       | Verb configuration dictionary                              |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 581.
