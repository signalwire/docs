---
slug: "/reference/python/signalwire/core/mixins/web-mixin/web-mixin/manual-set-proxy-url"
title: "manual_set_proxy_url"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.web_mixin.WebMixin.manual_set_proxy_url"
  parent: "signalwire.core.mixins.web_mixin.WebMixin"
  module: "signalwire.core.mixins.web_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py"
---
# `manual_set_proxy_url`

Manually set the proxy URL base for webhook callbacks

This can be called at runtime to set or update the proxy URL

## Signature

```python
manual_set_proxy_url(proxy_url: str) -> AgentBase
```

## Parameters

| Name        | Type  | Required | Default | Description                                                       |
| ----------- | ----- | -------- | ------- | ----------------------------------------------------------------- |
| `proxy_url` | `str` | yes      | —       | The base URL to use for webhooks (e.g., https://example.ngrok.io) |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/web_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py)

Line 1191.
