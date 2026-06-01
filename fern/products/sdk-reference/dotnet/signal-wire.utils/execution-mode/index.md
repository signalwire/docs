---
slug: "/reference/dotnet/signal-wire.utils/execution-mode"
title: "ExecutionMode"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Utils.ExecutionMode"
  parent: "SignalWire.Utils"
  module: "SignalWire.Utils"
  visibility: "public"
---
# `ExecutionMode`

**Modifiers:** `static`

## Signature

```dotnet
public static class ExecutionMode
```

## Methods

- [`GetExecutionMode()`](/reference/dotnet/signal-wire.utils/execution-mode/get-execution-mode) — Returns the execution-mode string — `"server"` (default), `"cgi"`, `"lambda"`, `"google_cloud_function"`, `"azure_function"`. (Python parity: `signalwire.core.logging_config.get_execution_mode`.)
- [`IsServerlessMode()`](/reference/dotnet/signal-wire.utils/execution-mode/is-serverless-mode) — True when running in any serverless environment (anything other than `"server"`). (Python parity: `signalwire.utils.is_serverless_mode`.)
