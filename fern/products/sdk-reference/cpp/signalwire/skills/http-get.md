---
slug: "/reference/cpp/signalwire/skills/http-get"
title: "http_get"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::skills::http_get"
  parent: "signalwire::skills"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/skills_http.cpp"
  visibility: "public"
---
# `http_get`

Issue a real HTTP GET. Implementation uses cpp-httplib so it works against any plain-HTTP host (including loopback fixtures used by the audit\_skills\_dispatch.py audit). Skills that need TLS to reach production upstreams set the appropriate base-URL env var (e.g. WEB\_SEARCH\_BASE\_URL) — production deployments point at TLS proxies or a dev-side rewriter; the SDK keeps its transport stack OpenSSL-3 independent until the wider port adopts it.

## Signature

```cpp
SkillHttpResponse http_get(
    const std::string & url,
    const std::map< std::string, std::string > & headers = {},
    int timeout_seconds = 10
)
```

## Parameters

| Name              | Type                                           | Required | Default | Description |
| ----------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `url`             | `const std::string &`                          | yes      | —       | —           |
| `headers`         | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |
| `timeout_seconds` | `int`                                          | no       | `10`    | —           |

## Returns

`SkillHttpResponse`

## Source

[`src/skills/skills_http.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/skills_http.cpp)

Line 53.
