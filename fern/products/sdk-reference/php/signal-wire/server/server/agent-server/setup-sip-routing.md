---
slug: "/reference/php/signal-wire/server/server/agent-server/setup-sip-routing"
title: "setupSipRouting"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Server\\AgentServer::setupSipRouting"
  parent: "SignalWire\\Server\\AgentServer"
  module: "SignalWire.Server"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php"
  visibility: "public"
---
# `setupSipRouting`

Set up central SIP-based routing for the server.

Mirrors Python's AgentServer.setup\_sip\_routing(route, auto\_map). When
called with no args, defaults match Python: route="/sip", auto\_map=true.

## Signature

```php
public function setupSipRouting(
    string $route = '/sip',
    bool $auto_map = true
): SignalWire\Server\AgentServer
```

## Parameters

| Name       | Type     | Required | Default  | Description                                                                                           |
| ---------- | -------- | -------- | -------- | ----------------------------------------------------------------------------------------------------- |
| `route`    | `string` | no       | `'/sip'` | Path for SIP routing (default "/sip"). Leading slash is added if missing; trailing slash is stripped. |
| `auto_map` | `bool`   | no       | `true`   | If true, existing agents have their SIP usernames auto-derived from their route.                      |

## Returns

`SignalWire\Server\AgentServer`

## Source

[`/src/src/SignalWire/Server/AgentServer.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php)

Line 141.
