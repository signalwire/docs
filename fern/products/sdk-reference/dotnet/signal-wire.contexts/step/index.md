---
slug: "/reference/dotnet/signal-wire.contexts/step"
title: "Step"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.Step"
  parent: "SignalWire.Contexts"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `Step`

## Signature

```dotnet
public class Step
```

## Properties

| Name             | Type                                          | Required | Default | Description |
| ---------------- | --------------------------------------------- | -------- | ------- | ----------- |
| `GatherInfoData` | `public GatherInfo? GatherInfoData { get; }`  | yes      | —       | —           |
| `Name`           | `public string Name { get; }`                 | yes      | —       | —           |
| `ValidContexts`  | `public List<string>? ValidContexts { get; }` | yes      | —       | —           |
| `ValidSteps`     | `public List<string>? ValidSteps { get; }`    | yes      | —       | —           |

## Methods

- [`AddBullets(string, List<string>)`](/reference/dotnet/signal-wire.contexts/step/add-bullets-string-list-string)
- [`AddGatherQuestion(Dictionary<string, object>)`](/reference/dotnet/signal-wire.contexts/step/add-gather-question-dictionary-string-object) — Add a question to this step's gather\_info. Initializes gather\_info if not yet set. <p><b>IMPORTANT — gather mode locks function access:</b> While the model is asking gather questions, the runtime forcibly deactivates ALL of the step's other functions. The only callable tools during a gather question are:</p> <ul><li><code>gather\_submit</code> (the native answer-submission tool)</li><li>Whatever names you pass in this question's <code>"functions"</code> option</li></ul> <p><code>next\_step</code> and <code>change\_context</code> are also filtered out — the model cannot navigate away until the gather completes. This is by design: it forces a tight ask → submit → next-question loop.</p> <p>If a question needs to call out to a tool (e.g. validate an email, geocode a ZIP), list that tool name in this question's <code>"functions"</code> option. Functions listed here are active ONLY for this question.</p>
- [`AddSection(string, string)`](/reference/dotnet/signal-wire.contexts/step/add-section-string-string)
- [`ClearSections()`](/reference/dotnet/signal-wire.contexts/step/clear-sections)
- [`SetEnd(bool)`](/reference/dotnet/signal-wire.contexts/step/set-end-bool) — Mark this step as terminal for the step flow. <p><b>IMPORTANT:</b> <code class="paramref">end</code> = true does NOT end the conversation or hang up the call. It exits step mode entirely after this step executes — clearing the steps list, current step index, valid\_steps, and valid\_contexts. The agent keeps running, but operates only under the base system prompt and the context-level prompt; no more step instructions are injected and no more <code>next\_step</code> tool is offered.</p> <p>To actually end the call, call a hangup tool or define a hangup hook.</p>
- [`SetFunctions(object)`](/reference/dotnet/signal-wire.contexts/step/set-functions-object) — Set which non-internal functions are callable while this step is active. <p><b>IMPORTANT — inheritance behavior:</b> If you do NOT call this method, the step inherits whichever function set was active on the previous step (or the previous context's last step). The server-side runtime only resets the active set when a step explicitly declares its <code>functions</code> field. This is the most common source of bugs in multi-step agents: forgetting <xref href="SignalWire.Contexts.Step.SetFunctions(System.Object)" data-throw-if-not-resolved="false"></xref> on a later step lets the previous step's tools leak through. Best practice is to call <xref href="SignalWire.Contexts.Step.SetFunctions(System.Object)" data-throw-if-not-resolved="false"></xref> explicitly on every step that should differ from the previous one.</p> <p>Keep the per-step active set small: LLM tool selection accuracy degrades noticeably past ~7-8 simultaneously-active tools per call. Use per-step whitelisting to partition large tool collections.</p> <p>Internal functions (e.g. <code>gather\_submit</code>, hangup hook) are ALWAYS protected and cannot be deactivated by this whitelist. The native navigation tools <code>next\_step</code> and <code>change\_context</code> are injected automatically when <xref href="SignalWire.Contexts.Step.SetValidSteps(System.Collections.Generic.List%7bSystem.String%7d)" data-throw-if-not-resolved="false"></xref> / <xref href="SignalWire.Contexts.Step.SetValidContexts(System.Collections.Generic.List%7bSystem.String%7d)" data-throw-if-not-resolved="false"></xref> is used; they are not affected by this list.</p>
- [`SetGatherInfo(Dictionary<string, object>)`](/reference/dotnet/signal-wire.contexts/step/set-gather-info-dictionary-string-object)
- [`SetResetConsolidate(bool)`](/reference/dotnet/signal-wire.contexts/step/set-reset-consolidate-bool)
- [`SetResetFullReset(bool)`](/reference/dotnet/signal-wire.contexts/step/set-reset-full-reset-bool)
- [`SetResetSystemPrompt(string)`](/reference/dotnet/signal-wire.contexts/step/set-reset-system-prompt-string)
- [`SetResetUserPrompt(string)`](/reference/dotnet/signal-wire.contexts/step/set-reset-user-prompt-string)
- [`SetSkipToNextStep(bool)`](/reference/dotnet/signal-wire.contexts/step/set-skip-to-next-step-bool)
- [`SetSkipUserTurn(bool)`](/reference/dotnet/signal-wire.contexts/step/set-skip-user-turn-bool)
- [`SetStepCriteria(string)`](/reference/dotnet/signal-wire.contexts/step/set-step-criteria-string)
- [`SetText(string)`](/reference/dotnet/signal-wire.contexts/step/set-text-string)
- [`SetValidContexts(List<string>)`](/reference/dotnet/signal-wire.contexts/step/set-valid-contexts-list-string)
- [`SetValidSteps(List<string>)`](/reference/dotnet/signal-wire.contexts/step/set-valid-steps-list-string)
- [`Step(string)`](/reference/dotnet/signal-wire.contexts/step/step-string)
- [`ToDict()`](/reference/dotnet/signal-wire.contexts/step/to-dict)
