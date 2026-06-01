---
slug: "/reference/php/signal-wire/server/server/agent-server/register-sip-username"
title: "registerSipUsername"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Server\\AgentServer::registerSipUsername"
  parent: "SignalWire\\Server\\AgentServer"
  module: "SignalWire.Server"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php"
  visibility: "public"
---
# `registerSipUsername`

Map a SIP username to a route.

## Signature

```php
public function registerSipUsername(
    string $username,
    string $route
): SignalWire\Server\AgentServer
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `username` | `string` | yes      | —       | —           |
| `route`    | `string` | yes      | —       | —           |

## Returns

`SignalWire\Server\AgentServer`

## Source

[`/src/src/SignalWire/Server/AgentServer.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php)

Line 186.
