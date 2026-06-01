---
slug: "/reference/java/com/signalwire/sdk/runtime/runtime/execution-mode"
title: "ExecutionMode"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "enum"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.ExecutionMode"
  parent: "com.signalwire.sdk.runtime"
  module: "com.signalwire.sdk.runtime"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/ExecutionMode.java"
  visibility: "public"
---
# `ExecutionMode`

Runtime deployment environments the SDK knows about.

<p>Detected from well-known environment variables set by the hosting
 platform. Mirrors `get_execution_mode()` in the Python SDK and
 `detectPlatform()` in the TypeScript SDK.

 <p>Use `#detect()` to read the actual process environment, or
 `#detect(EnvProvider)` to pass a test double.

**Modifiers:** `final`

## Signature

```java
public final enum ExecutionMode
```

## Inheritance

**Extends:** `java.lang.Enum<com.signalwire.sdk.runtime.ExecutionMode>`

## Variants

| Name                    | Type                                                             | Required | Default | Description                                            |
| ----------------------- | ---------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------ |
| `AZURE_FUNCTION`        | `com.signalwire.sdk.runtime.ExecutionMode AZURE_FUNCTION`        | yes      | —       | Azure Functions.                                       |
| `CGI`                   | `com.signalwire.sdk.runtime.ExecutionMode CGI`                   | yes      | —       | Legacy CGI script behind a web server.                 |
| `GOOGLE_CLOUD_FUNCTION` | `com.signalwire.sdk.runtime.ExecutionMode GOOGLE_CLOUD_FUNCTION` | yes      | —       | Google Cloud Functions (1st or 2nd gen / Cloud Run).   |
| `LAMBDA`                | `com.signalwire.sdk.runtime.ExecutionMode LAMBDA`                | yes      | —       | AWS Lambda function (container or zip deployment).     |
| `SERVER`                | `com.signalwire.sdk.runtime.ExecutionMode SERVER`                | yes      | —       | Normal long-running HTTP server process (the default). |

## Methods

- [`detect`](/reference/java/com/signalwire/sdk/runtime/runtime/execution-mode/detect) — Detect the execution mode from the real process environment.
- [`getExecutionMode`](/reference/java/com/signalwire/sdk/runtime/runtime/execution-mode/get-execution-mode) — Cross-language SDK contract: return the execution mode as the canonical lower-case-with-underscores string used by every port.
- [`isServerlessMode`](/reference/java/com/signalwire/sdk/runtime/runtime/execution-mode/is-serverless-mode) — Cross-language SDK contract: true when the process is running inside any serverless / short-lived environment (i.e.
- [`valueOf`](/reference/java/com/signalwire/sdk/runtime/runtime/execution-mode/value-of)
- [`values`](/reference/java/com/signalwire/sdk/runtime/runtime/execution-mode/values)

## Source

[`src/main/java/com/signalwire/sdk/runtime/ExecutionMode.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/ExecutionMode.java)

Line 13.
