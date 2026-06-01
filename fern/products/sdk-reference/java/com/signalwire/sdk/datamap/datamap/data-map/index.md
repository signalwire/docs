---
slug: "/reference/java/com/signalwire/sdk/datamap/datamap/data-map"
title: "DataMap"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.datamap.DataMap"
  parent: "com.signalwire.sdk.datamap"
  module: "com.signalwire.sdk.datamap"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java"
  visibility: "public"
---
# `DataMap`

Fluent builder for creating SWAIG data\_map configurations.

<p>
 DataMap tools execute on SignalWire servers without requiring webhook endpoints.
 Supports variable expansion: `${args.param`}, `${response.field`},
 `${global_data.key`}, `${foreach.item`}.
 <p>
 All methods return `this` for fluent chaining.

## Signature

```java
public class DataMap
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/init)
- [`body`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/body) — Set request body for the last added webhook (POST/PUT requests).
- [`description`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/description) — Alias for `#purpose(String)`; sets the LLM-facing tool description.
- [`errorKeys`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/error-keys) — Set error keys for the most recent webhook (if webhooks exist) or top-level.
- [`expression`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/expression) — Add an expression pattern for pattern-based responses.
- [`fallbackOutput`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/fallback-output) — Set a fallback output result at the top level (used when all webhooks fail).
- [`foreach`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/foreach) — Process an array from the webhook response using foreach mechanism.
- [`getName`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/get-name)
- [`globalErrorKeys`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/global-error-keys) — Set top-level error keys (applies to all webhooks).
- [`output`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/output) — Set the output result for the most recent webhook.
- [`parameter`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/parameter) — Add a parameter to this data-map tool \u2014 the `description` is LLM-FACING.
- [`params`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/params) — Set request params for the last added webhook.
- [`purpose`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/purpose) — Set the LLM-facing tool description \u2014 this is PROMPT ENGINEERING, not developer documentation.
- [`toSwaigFunction`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/to-swaig-function) — Convert this DataMap to a SWAIG function definition.
- [`webhook`](/reference/java/com/signalwire/sdk/datamap/datamap/data-map/webhook) — Add a webhook API call.

## Source

[`src/main/java/com/signalwire/sdk/datamap/DataMap.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java)

Line 22.
