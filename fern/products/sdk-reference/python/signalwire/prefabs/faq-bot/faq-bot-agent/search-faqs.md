---
slug: "/reference/python/signalwire/prefabs/faq-bot/faq-bot-agent/search-faqs"
title: "search_faqs"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.faq_bot.FAQBotAgent.search_faqs"
  parent: "signalwire.prefabs.faq_bot.FAQBotAgent"
  module: "signalwire.prefabs.faq_bot"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/faq_bot.py"
---
# `search_faqs`

Search for FAQs matching a specific query or category

This function helps find relevant FAQs based on a search query or category.
It returns matching FAQs in order of relevance.

**Decorators:** `@AgentBase.tool(Any, Any, Any)`

## Signature

```python
search_faqs(args, raw_data)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `args`     | —    | yes      | —       | —           |
| `raw_data` | —    | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/prefabs/faq_bot.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/faq_bot.py)

Line 216.
