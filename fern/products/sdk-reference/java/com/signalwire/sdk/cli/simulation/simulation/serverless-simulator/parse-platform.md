---
slug: "/reference/java/com/signalwire/sdk/cli/simulation/simulation/serverless-simulator/parse-platform"
title: "parsePlatform"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.cli.simulation.ServerlessSimulator.parsePlatform"
  parent: "com.signalwire.sdk.cli.simulation.ServerlessSimulator"
  module: "com.signalwire.sdk.cli.simulation.ServerlessSimulator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java"
  visibility: "public"
---
# `parsePlatform`

Parse the CLI-string form of a platform.

Accepts only values this
port supports; unknown strings throw `IllegalArgumentException`
so the CLI can surface a clear error instead of silently falling
back.

**Modifiers:** `static`

## Signature

```java
public static com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform parsePlatform(
    java.lang.String s
)
```

## Parameters

| Name | Type               | Required | Default | Description                    |
| ---- | ------------------ | -------- | ------- | ------------------------------ |
| `s`  | `java.lang.String` | yes      | —       | user-supplied platform string. |

## Returns

`com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform` — the matching `Platform`.

## Throws

- `IllegalArgumentException` — for unsupported platforms.

## Source

[`src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java)

Line 80.
