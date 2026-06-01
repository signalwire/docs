---
slug: "/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-add-subsection"
title: "prompt_add_subsection"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent.prompt.manager.PromptManager.prompt_add_subsection"
  parent: "signalwire.core.agent.prompt.manager.PromptManager"
  module: "signalwire.core.agent.prompt.manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py"
---
# `prompt_add_subsection`

Add a subsection to an existing section (creating parent if needed).

## Signature

```python
prompt_add_subsection(
    parent_title: str,
    title: str,
    body: str = '',
    bullets: Optional[List[str]] = None
) -> None
```

## Parameters

| Name           | Type                  | Required | Default | Description                    |
| -------------- | --------------------- | -------- | ------- | ------------------------------ |
| `parent_title` | `str`                 | yes      | —       | Parent section title           |
| `title`        | `str`                 | yes      | —       | Subsection title               |
| `body`         | `str`                 | no       | `''`    | Optional subsection body text  |
| `bullets`      | `Optional[List[str]]` | no       | `None`  | Optional list of bullet points |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/core/agent/prompt/manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py)

Line 220.
