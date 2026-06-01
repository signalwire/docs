---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/step/set-functions"
title: "setFunctions"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.Step.setFunctions"
  parent: "com.signalwire.sdk.contexts.Step"
  module: "com.signalwire.sdk.contexts.Step"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Step.java"
  visibility: "public"
---
# `setFunctions`

Set which non-internal functions are callable while this step is active.

<p><b>IMPORTANT \u2014 inheritance behavior:</b> If you do NOT call this method,
 the step inherits whichever function set was active on the previous step
 (or the previous context's last step). The server-side runtime only
 resets the active set when a step explicitly declares its `functions`
 field. This is the most common source of bugs in multi-step agents:
 forgetting `setFunctions()` on a later step lets the previous step's
 tools leak through. Best practice is to call `setFunctions()`
 explicitly on every step that should differ from the previous one.

 <p>Keep the per-step active set small: LLM tool selection accuracy
 degrades noticeably past ~7-8 simultaneously-active tools per call.
 Use per-step whitelisting to partition large tool collections.

 <p>Accepts:
 <ul>
   <li>`List<String>` \u2014 whitelist of function names allowed in this
       step. Functions not in the list become inactive.</li>
   <li>`List.of()` (empty list) \u2014 explicit disable-all.</li>
   <li>The string `"none"` \u2014 synonym for an empty list.</li>
 </ul>

 <p>Internal functions (e.g. `gather_submit`, hangup hook) are
 ALWAYS protected and cannot be deactivated by this whitelist. The native
 navigation tools `next_step` and `change_context` are
 injected automatically when `setValidSteps`/`setValidContexts`
 is used; they are not affected by this list and do not need to appear in
 it.

## Signature

```java
public com.signalwire.sdk.contexts.Step setFunctions(java.lang.Object functions)
```

## Parameters

| Name        | Type               | Required | Default | Description                                                        |
| ----------- | ------------------ | -------- | ------- | ------------------------------------------------------------------ |
| `functions` | `java.lang.Object` | yes      | —       | a `List<String>` whitelist, an empty list, or the string `"none"`. |

## Returns

`com.signalwire.sdk.contexts.Step` — this step for chaining.

## Source

[`src/main/java/com/signalwire/sdk/contexts/Step.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Step.java)

Line 130.
