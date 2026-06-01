---
slug: "/reference/dotnet/signal-wire.utils/execution-mode/get-execution-mode"
title: "GetExecutionMode()"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Utils.ExecutionMode.GetExecutionMode()"
  parent: "SignalWire.Utils.ExecutionMode"
  module: "SignalWire.Utils"
  visibility: "public"
---
# `GetExecutionMode()`

Returns the execution-mode string —
`"server"` (default), `"cgi"`, `"lambda"`,
`"google_cloud_function"`, `"azure_function"`.
(Python parity:
`signalwire.core.logging_config.get_execution_mode`.)

**Modifiers:** `static`

## Signature

```dotnet
public static string GetExecutionMode()
```

## Returns

`string`
