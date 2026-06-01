---
slug: "/reference/python/signalwire/core/config-loader/config-loader/find-config-file"
title: "find_config_file"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.config_loader.ConfigLoader.find_config_file"
  parent: "signalwire.core.config_loader.ConfigLoader"
  module: "signalwire.core.config_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/config_loader.py"
---
# `find_config_file`

Static method to find a config file for a service.

**Modifiers:** `static`

## Signature

```python
@staticmethod
find_config_file(
    service_name: Optional[str] = None,
    additional_paths: Optional[List[str]] = None
) -> Optional[str]
```

## Parameters

| Name               | Type                  | Required | Default | Description                                       |
| ------------------ | --------------------- | -------- | ------- | ------------------------------------------------- |
| `service_name`     | `Optional[str]`       | no       | `None`  | Optional service name for service-specific config |
| `additional_paths` | `Optional[List[str]]` | no       | `None`  | Additional paths to check                         |

## Returns

`Optional[str]` — Path to the first config file found, or None

## Source

[`/src/signalwire/signalwire/core/config_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/config_loader.py)

Line 224.
