---
slug: "/reference/python/signalwire/prefabs/concierge/concierge-agent/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.concierge.ConciergeAgent.__init__"
  parent: "signalwire.prefabs.concierge.ConciergeAgent"
  module: "signalwire.prefabs.concierge"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/concierge.py"
---
# `__init__`

Initialize a concierge agent

## Signature

```python
__init__(
    venue_name: str,
    services: List[str],
    amenities: Dict[str, Dict[str, str]],
    hours_of_operation: Optional[Dict[str, str]] = None,
    special_instructions: Optional[List[str]] = None,
    welcome_message: Optional[str] = None,
    name: str = 'concierge',
    route: str = '/concierge',
    **kwargs = {}
)
```

## Parameters

| Name                   | Type                        | Required | Default        | Description                            |
| ---------------------- | --------------------------- | -------- | -------------- | -------------------------------------- |
| `venue_name`           | `str`                       | yes      | —              | Name of the venue or business          |
| `services`             | `List[str]`                 | yes      | —              | List of services offered               |
| `amenities`            | `Dict[str, Dict[str, str]]` | yes      | —              | Dictionary of amenities with details   |
| `hours_of_operation`   | `Optional[Dict[str, str]]`  | no       | `None`         | Optional dictionary of operating hours |
| `special_instructions` | `Optional[List[str]]`       | no       | `None`         | Optional list of special instructions  |
| `welcome_message`      | `Optional[str]`             | no       | `None`         | Optional custom welcome message        |
| `name`                 | `str`                       | no       | `'concierge'`  | Agent name for the route               |
| `route`                | `str`                       | no       | `'/concierge'` | HTTP route for this agent              |
| `...kwargs`            | —                           | no       | `{}`           | —                                      |

## Source

[`/src/signalwire/signalwire/prefabs/concierge.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/concierge.py)

Line 45.
