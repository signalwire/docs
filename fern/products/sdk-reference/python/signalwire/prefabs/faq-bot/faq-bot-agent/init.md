---
slug: "/reference/python/signalwire/prefabs/faq-bot/faq-bot-agent/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.faq_bot.FAQBotAgent.__init__"
  parent: "signalwire.prefabs.faq_bot.FAQBotAgent"
  module: "signalwire.prefabs.faq_bot"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/faq_bot.py"
---
# `__init__`

Initialize an FAQ bot agent

## Signature

```python
__init__(
    faqs: List[Dict[str, str]],
    suggest_related: bool = True,
    persona: Optional[str] = None,
    name: str = 'faq_bot',
    route: str = '/faq',
    **kwargs = {}
)
```

## Parameters

| Name              | Type                   | Required | Default     | Description                             |
| ----------------- | ---------------------- | -------- | ----------- | --------------------------------------- |
| `faqs`            | `List[Dict[str, str]]` | yes      | —           | List of FAQ items, each with:           |
| `suggest_related` | `bool`                 | no       | `True`      | Whether to suggest related questions    |
| `persona`         | `Optional[str]`        | no       | `None`      | Optional custom personality description |
| `name`            | `str`                  | no       | `'faq_bot'` | Agent name for the route                |
| `route`           | `str`                  | no       | `'/faq'`    | HTTP route for this agent               |
| `...kwargs`       | —                      | no       | `{}`        | —                                       |

## Source

[`/src/signalwire/signalwire/prefabs/faq_bot.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/faq_bot.py)

Line 47.
