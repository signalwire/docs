---
slug: "/reference/java/com/signalwire/sdk/runtime/runtime/env-provider"
title: "EnvProvider"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "interface"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.EnvProvider"
  parent: "com.signalwire.sdk.runtime"
  module: "com.signalwire.sdk.runtime"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/EnvProvider.java"
  visibility: "public"
---
# `EnvProvider`

Simple read-only view of process environment variables.

<p>Extracted as an interface so tests can inject a deterministic map
 instead of relying on actual OS environment variables (which Java
 cannot mutate at runtime without native hackery).

 <p>The default implementation delegates to `System#getenv(String)`.

**Modifiers:** `abstract`

**Decorators:** `@FunctionalInterface`

## Signature

```java
public abstract interface EnvProvider
```

## Inheritance

**Extends:** `none`

## Constants

| Name     | Type                                            | Required | Default | Description                                         |
| -------- | ----------------------------------------------- | -------- | ------- | --------------------------------------------------- |
| `SYSTEM` | `com.signalwire.sdk.runtime.EnvProvider SYSTEM` | yes      | —       | Default provider backed by `System#getenv(String)`. |

## Methods

- [`get`](/reference/java/com/signalwire/sdk/runtime/runtime/env-provider/get) — Return the value of the given environment variable, or `null` if it is not set.
- [`isSet`](/reference/java/com/signalwire/sdk/runtime/runtime/env-provider/is-set) — Return true iff the env var is set and non-empty.

## Source

[`src/main/java/com/signalwire/sdk/runtime/EnvProvider.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/EnvProvider.java)

Line 12.
