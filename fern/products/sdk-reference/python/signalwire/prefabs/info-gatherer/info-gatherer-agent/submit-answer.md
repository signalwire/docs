---
slug: "/reference/python/signalwire/prefabs/info-gatherer/info-gatherer-agent/submit-answer"
title: "submit_answer"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.info_gatherer.InfoGathererAgent.submit_answer"
  parent: "signalwire.prefabs.info_gatherer.InfoGathererAgent"
  module: "signalwire.prefabs.info_gatherer"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py"
---
# `submit_answer`

Submit an answer to the current question and move to the next one

This function:

1. Stores the answer in global\_data
2. Increments the question index
3. Returns the next question or completion message

**Decorators:** `@AgentBase.tool(Any, Any, Any)`

## Signature

```python
submit_answer(args, raw_data)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `args`     | —    | yes      | —       | —           |
| `raw_data` | —    | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/prefabs/info_gatherer.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py)

Line 296.
