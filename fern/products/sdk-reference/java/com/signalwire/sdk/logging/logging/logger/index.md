---
slug: "/reference/java/com/signalwire/sdk/logging/logging/logger"
title: "Logger"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.logging.Logger"
  parent: "com.signalwire.sdk.logging"
  module: "com.signalwire.sdk.logging"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/logging/Logger.java"
  visibility: "public"
---
# `Logger`

Simple logging system with level control via environment variables.

<p>
 Levels: DEBUG, INFO, WARN, ERROR, OFF
 <p>
 Environment variables:
 <ul>
   <li>SIGNALWIRE_LOG_LEVEL - set log level (debug/info/warn/error/off)</li>
   <li>SIGNALWIRE_LOG_MODE  - set to "off" to suppress all output</li>
 </ul>

**Modifiers:** `final`

## Signature

```java
public final class Logger
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/logging/logging/logger/init)
- [`debug`](/reference/java/com/signalwire/sdk/logging/logging/logger/debug)
- [`error`](/reference/java/com/signalwire/sdk/logging/logging/logger/error)
- [`getGlobalLevel`](/reference/java/com/signalwire/sdk/logging/logging/logger/get-global-level)
- [`getLogger`](/reference/java/com/signalwire/sdk/logging/logging/logger/get-logger)
- [`info`](/reference/java/com/signalwire/sdk/logging/logging/logger/info)
- [`isEnabled`](/reference/java/com/signalwire/sdk/logging/logging/logger/is-enabled)
- [`setGlobalLevel`](/reference/java/com/signalwire/sdk/logging/logging/logger/set-global-level)
- [`warn`](/reference/java/com/signalwire/sdk/logging/logging/logger/warn)

## Enums

- [`Level`](/reference/java/com/signalwire/sdk/logging/logging/logger/level)

## Source

[`src/main/java/com/signalwire/sdk/logging/Logger.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/logging/Logger.java)

Line 20.
