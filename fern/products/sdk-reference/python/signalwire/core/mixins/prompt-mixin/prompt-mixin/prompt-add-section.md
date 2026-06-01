---
slug: "/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/prompt-add-section"
title: "prompt_add_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.prompt_mixin.PromptMixin.prompt_add_section"
  parent: "signalwire.core.mixins.prompt_mixin.PromptMixin"
  module: "signalwire.core.mixins.prompt_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/prompt_mixin.py"
---
# `prompt_add_section`

Add a section to the prompt

## Signature

```python
prompt_add_section(
    title: str,
    body: str = '',
    bullets: Optional[List[str]] = None,
    numbered: bool = False,
    numbered_bullets: bool = False,
    subsections: Optional[List[Dict[str, Any]]] = None
) -> AgentBase
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

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/prompt_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/prompt_mixin.py)

Line 228.
