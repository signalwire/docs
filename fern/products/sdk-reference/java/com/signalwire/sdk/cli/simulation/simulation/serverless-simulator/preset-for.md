---
slug: "/reference/java/com/signalwire/sdk/cli/simulation/simulation/serverless-simulator/preset-for"
title: "presetFor"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.cli.simulation.ServerlessSimulator.presetFor"
  parent: "com.signalwire.sdk.cli.simulation.ServerlessSimulator"
  module: "com.signalwire.sdk.cli.simulation.ServerlessSimulator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java"
  visibility: "public"
---
# `presetFor`

Default env-var preset for a platform, mirroring Python's
`ServerlessSimulator.PLATFORM_PRESETS`.

**Modifiers:** `static`

## Signature

```java
public static java.util.Map<java.lang.String,java.lang.String> presetFor(
    com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform platform
)
```

## Parameters

| Name       | Type                                                             | Required | Default | Description |
| ---------- | ---------------------------------------------------------------- | -------- | ------- | ----------- |
| `platform` | `com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform` | yes      | —       | platform.   |

## Returns

`java.util.Map<java.lang.String,java.lang.String>` — the preset map (never null).

## Source

[`src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java)

Line 142.
