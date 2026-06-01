---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/step"
title: "Step"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.Step"
  parent: "com.signalwire.sdk.contexts"
  module: "com.signalwire.sdk.contexts"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Step.java"
  visibility: "public"
---
# `Step`

Represents a single step within a context.

<p>
 Steps can use either raw text or POM-style sections for their prompt content.
 All setter methods return `this` for fluent chaining.

## Signature

```java
public class Step
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/contexts/contexts/step/init)
- [`addBullets`](/reference/java/com/signalwire/sdk/contexts/contexts/step/add-bullets) — Add a POM section with bullet points.
- [`addGatherQuestion`](/reference/java/com/signalwire/sdk/contexts/contexts/step/add-gather-question) — Add a question to this step's gather\_info configuration.
- [`addSection`](/reference/java/com/signalwire/sdk/contexts/contexts/step/add-section) — Add a POM section to the step.
- [`clearSections`](/reference/java/com/signalwire/sdk/contexts/contexts/step/clear-sections)
- [`getName`](/reference/java/com/signalwire/sdk/contexts/contexts/step/get-name)
- [`setEnd`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-end) — Mark this step as terminal for the step flow.
- [`setFunctions`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-functions) — Set which non-internal functions are callable while this step is active.
- [`setGatherInfo`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-gather-info) — Enable info gathering for this step.
- [`setResetConsolidate`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-reset-consolidate)
- [`setResetFullReset`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-reset-full-reset)
- [`setResetSystemPrompt`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-reset-system-prompt)
- [`setResetUserPrompt`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-reset-user-prompt)
- [`setSkipToNextStep`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-skip-to-next-step)
- [`setSkipUserTurn`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-skip-user-turn)
- [`setStepCriteria`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-step-criteria)
- [`setText`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-text) — Set the step's prompt text directly.
- [`setValidContexts`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-valid-contexts)
- [`setValidSteps`](/reference/java/com/signalwire/sdk/contexts/contexts/step/set-valid-steps)
- [`toMap`](/reference/java/com/signalwire/sdk/contexts/contexts/step/to-map)

## Source

[`src/main/java/com/signalwire/sdk/contexts/Step.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Step.java)

Line 17.
