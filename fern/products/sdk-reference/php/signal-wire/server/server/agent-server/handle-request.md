---
slug: "/reference/php/signal-wire/server/server/agent-server/handle-request"
title: "handleRequest"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Server\\AgentServer::handleRequest"
  parent: "SignalWire\\Server\\AgentServer"
  module: "SignalWire.Server"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php"
  visibility: "public"
---
# `handleRequest`

Handle an HTTP request and return \[status, headers, body].

## Signature

```php
public function handleRequest(
    string $method,
    string $path,
    array $headers = array (
),
    ?string $body = NULL
): array
```

## Parameters

| Name      | Type      | Required | Default     | Description |
| --------- | --------- | -------- | ----------- | ----------- |
| `method`  | `string`  | yes      | —           | —           |
| `path`    | `string`  | yes      | —           | —           |
| `headers` | `array`   | no       | `array (
)` | —           |
| `body`    | `?string` | no       | `NULL`      | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/Server/AgentServer.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php)

Line 242.
