---
slug: "/reference/java/com/signalwire/sdk/sdk/signalwire/rest-client"
title: "RestClient"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.Signalwire.RestClient"
  parent: "com.signalwire.sdk.Signalwire"
  module: "com.signalwire.sdk.Signalwire"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/Signalwire.java"
  visibility: "public"
---
# `RestClient`

Construct a `RestClient` from positional or keyword
credentials.

<p>Mirrors Python's top-level **kwargs) factory. Supports two call shapes:
 <ul>
   <li>token, space) \u2014 three positional
       strings, mapping straight onto the Java builder.</li>
   <li>kwargs) \u2014 variadic-shaped form
       matching Python's signature exactly. `args` is an
       array of three strings (project/token/space) or empty;
       `kwargs` carries the same fields by name.</li>
 </ul>

 <p>The audit projects this method onto Python's
 **kwargs) via
 `FREE_FUNCTION_PROJECTIONS`.

**Modifiers:** `static`

## Signature

```java
public static com.signalwire.sdk.rest.RestClient RestClient(
    java.util.List<java.lang.String> args,
    java.util.Map<java.lang.String,java.lang.String> kwargs
)
```

## Parameters

| Name     | Type                                               | Required | Default | Description                                                                                            |
| -------- | -------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------ |
| `args`   | `java.util.List<java.lang.String>`                 | yes      | —       | positional credentials \u2014 empty or token, space]                                                   |
| `kwargs` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | keyword credentials \u2014 recognised keys are `project` / `project_id`, `token`, and `space` / `host` |

## Returns

`com.signalwire.sdk.rest.RestClient` — a fully wired `RestClient` instance

## Source

[`src/main/java/com/signalwire/sdk/Signalwire.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/Signalwire.java)

Line 87.
