---
slug: "/reference/python/signalwire/prefabs/info-gatherer/info-gatherer-agent/set-question-callback"
title: "set_question_callback"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.info_gatherer.InfoGathererAgent.set_question_callback"
  parent: "signalwire.prefabs.info_gatherer.InfoGathererAgent"
  module: "signalwire.prefabs.info_gatherer"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py"
---
# `set_question_callback`

Set a callback function for dynamic question configuration

> \[!NOTE]
> def my\_question\_callback(query\_params, body\_params, headers):
> question\_set = query\_params.get('set', 'default')
> if question\_set == 'support':
> return \[
> {"key\_name": "name", "question\_text": "What is your name?"},
> {"key\_name": "issue", "question\_text": "What's the issue?"}
> ]
> else:
> return \[{"key\_name": "name", "question\_text": "What is your name?"}]
>
> agent.set\_question\_callback(my\_question\_callback)

## Signature

```python
set_question_callback(
    callback: Callable[dict, dict, dict, List[Dict[str, str]]]
)
```

## Parameters

| Name       | Type                                               | Required | Default | Description                                                                                                                                                                                                                                                                                                             |
| ---------- | -------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `callback` | `Callable[dict, dict, dict, List[Dict[str, str]]]` | yes      | —       | Function that takes (query\_params, body\_params, headers) and returns a list of question dictionaries. Each question dict should have: - key\_name: Identifier for storing the answer - question\_text: The actual question to ask the user - confirm: (Optional) If True, agent will confirm answer before submitting |

## Examples

```python
agent.set_question_callback(my_question_callback)
```

## Source

[`/src/signalwire/signalwire/prefabs/info_gatherer.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py)

Line 93.
