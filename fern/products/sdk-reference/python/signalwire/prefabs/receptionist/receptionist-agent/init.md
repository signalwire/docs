---
slug: "/reference/python/signalwire/prefabs/receptionist/receptionist-agent/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.receptionist.ReceptionistAgent.__init__"
  parent: "signalwire.prefabs.receptionist.ReceptionistAgent"
  module: "signalwire.prefabs.receptionist"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/receptionist.py"
---
# `__init__`

Initialize a receptionist agent

## Signature

```python
__init__(
    departments: List[Dict[str, str]],
    name: str = 'receptionist',
    route: str = '/receptionist',
    greeting: str = 'Thank you for calling. How can I help you today?',
    voice: str = 'rime.spore',
    **kwargs = {}
)
```

## Parameters

| Name          | Type                   | Required | Default                                              | Description                                    |
| ------------- | ---------------------- | -------- | ---------------------------------------------------- | ---------------------------------------------- |
| `departments` | `List[Dict[str, str]]` | yes      | —                                                    | List of departments to transfer to, each with: |
| `name`        | `str`                  | no       | `'receptionist'`                                     | Agent name for the route                       |
| `route`       | `str`                  | no       | `'/receptionist'`                                    | HTTP route for this agent                      |
| `greeting`    | `str`                  | no       | `'Thank you for calling. How can I help you today?'` | Initial greeting message                       |
| `voice`       | `str`                  | no       | `'rime.spore'`                                       | Voice ID to use                                |
| `...kwargs`   | —                      | no       | `{}`                                                 | —                                              |

## Source

[`/src/signalwire/signalwire/prefabs/receptionist.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/receptionist.py)

Line 37.
