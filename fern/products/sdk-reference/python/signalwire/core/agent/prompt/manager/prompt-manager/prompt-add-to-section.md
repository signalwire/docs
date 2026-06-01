---
slug: "/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-add-to-section"
title: "prompt_add_to_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent.prompt.manager.PromptManager.prompt_add_to_section"
  parent: "signalwire.core.agent.prompt.manager.PromptManager"
  module: "signalwire.core.agent.prompt.manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py"
---
# `prompt_add_to_section`

Add content to an existing section (creating it if needed).

## Signature

```python
prompt_add_to_section(
    title: str,
    body: Optional[str] = None,
    bullet: Optional[str] = None,
    bullets: Optional[List[str]] = None
) -> None
```

## Parameters

| Name      | Type                  | Required | Default | Description                             |
| --------- | --------------------- | -------- | ------- | --------------------------------------- |
| `title`   | `str`                 | yes      | —       | Section title                           |
| `body`    | `Optional[str]`       | no       | `None`  | Optional text to append to section body |
| `bullet`  | `Optional[str]`       | no       | `None`  | Optional single bullet point to add     |
| `bullets` | `Optional[List[str]]` | no       | `None`  | Optional list of bullet points to add   |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/core/agent/prompt/manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py)

Line 179.
