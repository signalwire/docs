---
slug: "/reference/python/signalwire/utils/url-validator/validate-url"
title: "validate_url"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.utils.url_validator.validate_url"
  parent: "signalwire.utils.url_validator"
  module: "signalwire.utils.url_validator"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/url_validator.py"
---
# `validate_url`

Validate that a URL is safe to fetch (not pointing to private/internal resources).

## Signature

```python
validate_url(url: str, allow_private: bool = False) -> bool
```

## Parameters

| Name            | Type   | Required | Default | Description                                       |
| --------------- | ------ | -------- | ------- | ------------------------------------------------- |
| `url`           | `str`  | yes      | —       | The URL to validate                               |
| `allow_private` | `bool` | no       | `False` | If True, allow private IP ranges (default: False) |

## Returns

`bool` — True if the URL is safe to fetch, False otherwise

## Source

[`/src/signalwire/signalwire/utils/url_validator.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/utils/url_validator.py)

Line 34.
