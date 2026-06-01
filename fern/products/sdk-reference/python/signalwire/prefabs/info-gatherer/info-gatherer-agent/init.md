---
slug: "/reference/python/signalwire/prefabs/info-gatherer/info-gatherer-agent/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.info_gatherer.InfoGathererAgent.__init__"
  parent: "signalwire.prefabs.info_gatherer.InfoGathererAgent"
  module: "signalwire.prefabs.info_gatherer"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py"
---
# `__init__`

Initialize an information gathering agent

## Signature

```python
__init__(
    questions: Optional[List[Dict[str, str]]] = None,
    name: str = 'info_gatherer',
    route: str = '/info_gatherer',
    **kwargs = {}
)
```

## Parameters

| Name        | Type                             | Required | Default            | Description                                                                                                                                   |
| ----------- | -------------------------------- | -------- | ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `questions` | `Optional[List[Dict[str, str]]]` | no       | `None`             | Optional list of questions to ask. If None, questions will be determined dynamically via a callback function. Each question dict should have: |
| `name`      | `str`                            | no       | `'info_gatherer'`  | Agent name for the route                                                                                                                      |
| `route`     | `str`                            | no       | `'/info_gatherer'` | HTTP route for this agent                                                                                                                     |
| `...kwargs` | —                                | no       | `{}`               | —                                                                                                                                             |

## Source

[`/src/signalwire/signalwire/prefabs/info_gatherer.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py)

Line 43.
