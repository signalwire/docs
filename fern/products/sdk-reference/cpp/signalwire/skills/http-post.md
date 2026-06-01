---
slug: "/reference/cpp/signalwire/skills/http-post"
title: "http_post"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::skills::http_post"
  parent: "signalwire::skills"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/skills_http.cpp"
  visibility: "public"
---
# `http_post`

Issue a real HTTP POST with body as the request body and content\_type for Content-Type. Same semantics as http\_get for status / error / body.

## Signature

```cpp
SkillHttpResponse http_post(
    const std::string & url,
    const std::string & body,
    const std::string & content_type = "application/json",
    const std::map< std::string, std::string > & headers = {},
    int timeout_seconds = 10
)
```

## Parameters

| Name              | Type                                           | Required | Default              | Description |
| ----------------- | ---------------------------------------------- | -------- | -------------------- | ----------- |
| `url`             | `const std::string &`                          | yes      | —                    | —           |
| `body`            | `const std::string &`                          | yes      | —                    | —           |
| `content_type`    | `const std::string &`                          | no       | `"application/json"` | —           |
| `headers`         | `const std::map< std::string, std::string > &` | no       | `{}`                 | —           |
| `timeout_seconds` | `int`                                          | no       | `10`                 | —           |

## Returns

`SkillHttpResponse`

## Source

[`src/skills/skills_http.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/skills_http.cpp)

Line 76.
