---
slug: "/reference/python/signalwire/core/swml-handler/ai-verb-handler/validate-config"
title: "validate_config"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_handler.AIVerbHandler.validate_config"
  parent: "signalwire.core.swml_handler.AIVerbHandler"
  module: "signalwire.core.swml_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py"
---
# `validate_config`

Validate the configuration for the AI verb

## Signature

```python
validate_config(config: Dict[str, Any]) -> Tuple[bool, List[str]]
```

## Parameters

| Name     | Type             | Required | Default | Description                                  |
| -------- | ---------------- | -------- | ------- | -------------------------------------------- |
| `config` | `Dict[str, Any]` | yes      | —       | The configuration dictionary for the AI verb |

## Returns

`Tuple[bool, List[str]]` — (is\_valid, error\_messages) tuple

## Source

[`/src/signalwire/signalwire/core/swml_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_handler.py)

Line 84.
