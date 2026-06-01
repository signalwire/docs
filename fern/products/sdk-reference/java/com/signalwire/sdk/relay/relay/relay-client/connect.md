---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-client/connect"
title: "connect"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayClient.connect"
  parent: "com.signalwire.sdk.relay.RelayClient"
  module: "com.signalwire.sdk.relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java"
  visibility: "public"
---
# `connect`

Open the WebSocket connection and complete the signalwire.connect
handshake without blocking the caller.

<p>Mirrors the Python `RelayClient.connect()` coroutine. Tests use
 this directly; production code typically uses `#run()` instead.

## Signature

**Overload 1**

```java
public void connect(long timeoutMs)
```

**Overload 2**

```java
public void connect()
```

## Parameters (Overload 1)

| Name        | Type   | Required | Default | Description                                    |
| ----------- | ------ | -------- | ------- | ---------------------------------------------- |
| `timeoutMs` | `long` | yes      | —       | how long to wait for the handshake to complete |

## Throws

- `RuntimeException` — if connect fails or times out

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java)

Line 234.
