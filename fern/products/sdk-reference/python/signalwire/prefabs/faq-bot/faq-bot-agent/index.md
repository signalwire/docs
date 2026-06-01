---
slug: "/reference/python/signalwire/prefabs/faq-bot/faq-bot-agent"
title: "FAQBotAgent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.prefabs.faq_bot.FAQBotAgent"
  parent: "signalwire.prefabs.faq_bot"
  module: "signalwire.prefabs.faq_bot"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/faq_bot.py"
---
# `FAQBotAgent`

A prefab agent designed to answer frequently asked questions based on
a provided list of question/answer pairs.

This agent will:

1. Match user questions against the FAQ database
2. Provide the most relevant answer
3. Suggest other relevant questions when appropriate

> \[!NOTE]
> agent = FAQBotAgent(
> faqs=\[
> {
> "question": "What is SignalWire?",
> "answer": "SignalWire is a developer-friendly cloud communications platform."
> },
> {
> "question": "How much does it cost?",
> "answer": "SignalWire offers pay-as-you-go pricing with no monthly fees."
> }
> ]
> )

## Signature

```python
class FAQBotAgent(AgentBase)
```

## Inheritance

**Extends:** [AgentBase](/reference/python/signalwire/core/agent-base/agent-base)

## Properties

| Name              | Type              | Required | Default | Description |
| ----------------- | ----------------- | -------- | ------- | ----------- |
| `faqs`            | `faqs`            | yes      | —       | —           |
| `persona`         | `persona`         | yes      | —       | —           |
| `suggest_related` | `suggest_related` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/prefabs/faq-bot/faq-bot-agent/init) — Initialize an FAQ bot agent
- [`on_summary`](/reference/python/signalwire/prefabs/faq-bot/faq-bot-agent/on-summary) — Process the interaction summary
- [`search_faqs`](/reference/python/signalwire/prefabs/faq-bot/faq-bot-agent/search-faqs) — Search for FAQs matching a specific query or category

## Source

[`/src/signalwire/signalwire/prefabs/faq_bot.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/faq_bot.py)

Line 22.
