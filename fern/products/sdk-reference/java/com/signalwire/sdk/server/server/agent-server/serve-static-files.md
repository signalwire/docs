---
slug: "/reference/java/com/signalwire/sdk/server/server/agent-server/serve-static-files"
title: "serveStaticFiles"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.server.AgentServer.serveStaticFiles"
  parent: "com.signalwire.sdk.server.AgentServer"
  module: "com.signalwire.sdk.server.AgentServer"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java"
  visibility: "public"
---
# `serveStaticFiles`

Serve static files from a directory at a specific route.

## Signature

```java
public com.signalwire.sdk.server.AgentServer serveStaticFiles(
    java.lang.String directory,
    java.lang.String route
)
```

## Parameters

| Name        | Type               | Required | Default | Description                                              |
| ----------- | ------------------ | -------- | ------- | -------------------------------------------------------- |
| `directory` | `java.lang.String` | yes      | —       | Filesystem path to the directory containing static files |
| `route`     | `java.lang.String` | yes      | —       | URL route prefix (e.g., "/static" or "/assets")          |

## Returns

`com.signalwire.sdk.server.AgentServer`

## Source

[`src/main/java/com/signalwire/sdk/server/AgentServer.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java)

Line 137.
