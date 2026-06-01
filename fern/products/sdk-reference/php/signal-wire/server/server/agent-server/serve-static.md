---
slug: "/reference/php/signal-wire/server/server/agent-server/serve-static"
title: "serveStatic"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Server\\AgentServer::serveStatic"
  parent: "SignalWire\\Server\\AgentServer"
  module: "SignalWire.Server"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php"
  visibility: "public"
---
# `serveStatic`

Serve static files from a directory under a URL prefix.

## Signature

```php
public function serveStatic(
    string $directory,
    string $urlPrefix
): SignalWire\Server\AgentServer
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `directory` | `string` | yes      | —       | —           |
| `urlPrefix` | `string` | yes      | —       | —           |

## Returns

`SignalWire\Server\AgentServer`

## Throws

- `\RuntimeException` — If the directory does not exist.

## Source

[`/src/src/SignalWire/Server/AgentServer.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php)

Line 220.
