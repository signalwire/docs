---
slug: "/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-add-section"
title: "prompt_add_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent.prompt.manager.PromptManager.prompt_add_section"
  parent: "signalwire.core.agent.prompt.manager.PromptManager"
  module: "signalwire.core.agent.prompt.manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py"
---
# `prompt_add_section`

Add a section to the prompt.

## Signature

```python
prompt_add_section(
    title: str,
    body: str = '',
    bullets: Optional[List[str]] = None,
    numbered: bool = False,
    numbered_bullets: bool = False,
    subsections: Optional[List[Dict[str, Any]]] = None
) -> None
```

## Parameters

| Name               | Type                             | Required | Default | Description                             |
| ------------------ | -------------------------------- | -------- | ------- | --------------------------------------- |
| `title`            | `str`                            | yes      | —       | Section title                           |
| `body`             | `str`                            | no       | `''`    | Optional section body text              |
| `bullets`          | `Optional[List[str]]`            | no       | `None`  | Optional list of bullet points          |
| `numbered`         | `bool`                           | no       | `False` | Whether this section should be numbered |
| `numbered_bullets` | `bool`                           | no       | `False` | Whether bullets should be numbered      |
| `subsections`      | `Optional[List[Dict[str, Any]]]` | no       | `None`  | Optional list of subsection objects     |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/core/agent/prompt/manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py)

Line 127.
