---
slug: "/reference/java/com/signalwire/sdk/cli/simulation/simulation/serverless-simulator/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.cli.simulation.ServerlessSimulator.<init>"
  parent: "com.signalwire.sdk.cli.simulation.ServerlessSimulator"
  module: "com.signalwire.sdk.cli.simulation.ServerlessSimulator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java"
  visibility: "public"
---
# `<init>`

Build a simulator for the given platform using the real process
environment as the fallback layer.

## Signature

**Overload 1**

```java
public void <init>(
    com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform platform
)
```

**Overload 2**

```java
public void <init>(
    com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform platform,
    com.signalwire.sdk.runtime.EnvProvider realEnv,
    java.util.Map<java.lang.String,java.lang.String> overrides
)
```

## Parameters (Overload 1)

| Name       | Type                                                             | Required | Default | Description           |
| ---------- | ---------------------------------------------------------------- | -------- | ------- | --------------------- |
| `platform` | `com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform` | yes      | —       | platform to simulate. |

## Parameters (Overload 2)

| Name        | Type                                                             | Required | Default | Description                                            |
| ----------- | ---------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------ |
| `platform`  | `com.signalwire.sdk.cli.simulation.ServerlessSimulator.Platform` | yes      | —       | platform to simulate.                                  |
| `realEnv`   | `com.signalwire.sdk.runtime.EnvProvider`                         | yes      | —       | fallback env provider (usually `EnvProvider#SYSTEM`).  |
| `overrides` | `java.util.Map<java.lang.String,java.lang.String>`               | yes      | —       | user-supplied overrides on top of the platform preset. |

## Source

[`src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/cli/simulation/ServerlessSimulator.java)

Line 100.
