---
slug: "/reference/cpp/signalwire/agent/agent-base/trust-proxy-for-signature"
title: "trust_proxy_for_signature"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::trust_proxy_for_signature"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `trust_proxy_for_signature`

If true, X-Forwarded-Proto / X-Forwarded-Host are honored by the webhook middleware when reconstructing the URL. Default false — proxy headers are spoofable so opt in only when the reverse-proxy is trusted.

## Signature

```cpp
AgentBase & trust_proxy_for_signature(bool trust)
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `trust` | `bool` | yes      | —       | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 476.
