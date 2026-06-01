---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/context"
title: "Context"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.Context"
  parent: "com.signalwire.sdk.contexts"
  module: "com.signalwire.sdk.contexts"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Context.java"
  visibility: "public"
---
# `Context`

Represents a single context containing multiple steps.

<p>
 All setter methods return `this` for fluent chaining.

## Signature

```java
public class Context
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/contexts/contexts/context/init)
- [`addBullets`](/reference/java/com/signalwire/sdk/contexts/contexts/context/add-bullets)
- [`addEnterFiller`](/reference/java/com/signalwire/sdk/contexts/contexts/context/add-enter-filler)
- [`addExitFiller`](/reference/java/com/signalwire/sdk/contexts/contexts/context/add-exit-filler)
- [`addSection`](/reference/java/com/signalwire/sdk/contexts/contexts/context/add-section)
- [`addStep`](/reference/java/com/signalwire/sdk/contexts/contexts/context/add-step) — Add a new step to this context.
- [`getName`](/reference/java/com/signalwire/sdk/contexts/contexts/context/get-name)
- [`getStep`](/reference/java/com/signalwire/sdk/contexts/contexts/context/get-step)
- [`moveStep`](/reference/java/com/signalwire/sdk/contexts/contexts/context/move-step)
- [`removeStep`](/reference/java/com/signalwire/sdk/contexts/contexts/context/remove-step)
- [`setConsolidate`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-consolidate)
- [`setEnterFillers`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-enter-fillers)
- [`setExitFillers`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-exit-fillers)
- [`setFullReset`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-full-reset)
- [`setInitialStep`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-initial-step) — Set which step the context starts on when entered.
- [`setIsolated`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-isolated) — Mark this context as isolated \u2014 entering it wipes conversation history.
- [`setPostPrompt`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-post-prompt)
- [`setPrompt`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-prompt)
- [`setSystemPrompt`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-system-prompt)
- [`setUserPrompt`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-user-prompt)
- [`setValidContexts`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-valid-contexts)
- [`setValidSteps`](/reference/java/com/signalwire/sdk/contexts/contexts/context/set-valid-steps)
- [`toMap`](/reference/java/com/signalwire/sdk/contexts/contexts/context/to-map)

## Source

[`src/main/java/com/signalwire/sdk/contexts/Context.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Context.java)

Line 16.
