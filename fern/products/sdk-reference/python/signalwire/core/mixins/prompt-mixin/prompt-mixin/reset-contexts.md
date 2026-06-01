---
slug: "/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/reset-contexts"
title: "reset_contexts"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.prompt_mixin.PromptMixin.reset_contexts"
  parent: "signalwire.core.mixins.prompt_mixin.PromptMixin"
  module: "signalwire.core.mixins.prompt_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/prompt_mixin.py"
---
# `reset_contexts`

Remove all contexts, returning the agent to a no-contexts state.

This is a convenience wrapper around `define_contexts().reset()`.
Use it in a dynamic config callback when you need to rebuild
contexts from scratch for a specific request.

Example::

```
def on_dynamic_config(query, body, headers, agent):
    if query.get("transfer"):
        agent.reset_contexts()
        ctx = agent.define_contexts().add_context("default")
        ctx.add_step("route").set_text("Route the caller.")
```

## Signature

```python
reset_contexts() -> AgentBase
```

## Returns

`AgentBase` — Self for method chaining.

## Examples

```python
def on_dynamic_config(query, body, headers, agent):
    if query.get("transfer"):
        agent.reset_contexts()
        ctx = agent.define_contexts().add_context("default")
        ctx.add_step("route").set_text("Route the caller.")
```

## Source

[`/src/signalwire/signalwire/core/mixins/prompt_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/prompt_mixin.py)

Line 157.
