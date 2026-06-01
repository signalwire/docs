---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/context-builder"
title: "ContextBuilder"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.ContextBuilder"
  parent: "com.signalwire.sdk.contexts"
  module: "com.signalwire.sdk.contexts"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/ContextBuilder.java"
  visibility: "public"
---
# `ContextBuilder`

Builder for multi-step, multi-context AI agent workflows.

<p>A ContextBuilder owns one or more `Context`s; each context owns an
 ordered list of `Step`s. Only one context and one step is active at a
 time. Per chat turn, the runtime injects the current step's instructions as
 a system message, then asks the LLM for a response.

 <h2>Native tools auto-injected by the runtime</h2>

 <p>When a step (or its enclosing context) declares valid_steps or
 valid_contexts, the runtime auto-injects two native tools so the model can
 navigate the flow:
 <ul>
   <li>enum)        \u2014 present when valid_steps is set</li>
   <li>enum) \u2014 present when valid_contexts is set</li>
 </ul>

 <p>A third native tool \u2014 `gather_submit` \u2014 is injected during
 gather_info questioning. These three names are <b>reserved</b>:
 `#validate()` rejects any agent that defines a SWAIG tool with one of
 these names. See `#RESERVED_NATIVE_TOOL_NAMES`.

 <h2>Function whitelisting (Step.setFunctions)</h2>

 <p>Each step may declare a functions whitelist. The whitelist is applied
 in-memory at the start of each LLM turn. CRITICALLY: if a step does NOT
 declare a functions field, it INHERITS the previous step's active set.
 See `Step#setFunctions(Object)` for details and examples.

## Signature

```java
public class ContextBuilder
```

## Constants

| Name                         | Type                                                         | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                          |
| ---------------------------- | ------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RESERVED_NATIVE_TOOL_NAMES` | `java.util.Set<java.lang.String> RESERVED_NATIVE_TOOL_NAMES` | yes      | —       | Reserved tool names auto-injected by the runtime when contexts/steps are in use. User-defined SWAIG tools must not collide with these names.  \<ul> \<li>\`next\_step\` / \`change\_context\` are injected when valid\_steps or valid\_contexts is set so the model can navigate the flow.\</li> \<li>\`gather\_submit\` is injected while a step's gather\_info is collecting answers.\</li> \</ul> |

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/init)
- [`addContext`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/add-context) — Add a new context.
- [`attachToolNameSupplier`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/attach-tool-name-supplier) — Attach a supplier that returns registered SWAIG tool names so `#validate()` can check for collisions with `#RESERVED_NATIVE_TOOL_NAMES`.
- [`getContext`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/get-context) — Get an existing context by name.
- [`isEmpty`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/is-empty)
- [`reset`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/reset) — Remove all contexts, returning the builder to its initial state.
- [`toMap`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/to-map) — Convert all contexts to a Map for SWML generation.
- [`validate`](/reference/java/com/signalwire/sdk/contexts/contexts/context-builder/validate) — Validate the contexts configuration.

## Source

[`src/main/java/com/signalwire/sdk/contexts/ContextBuilder.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/ContextBuilder.java)

Line 41.
