---
slug: "/reference/dotnet/signal-wire.contexts/context"
title: "Context"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.Context"
  parent: "SignalWire.Contexts"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `Context`

## Signature

```dotnet
public class Context
```

## Properties

| Name   | Type                          | Required | Default | Description |
| ------ | ----------------------------- | -------- | ------- | ----------- |
| `Name` | `public string Name { get; }` | yes      | —       | —           |

## Methods

- [`AddBullets(string, List<string>)`](/reference/dotnet/signal-wire.contexts/context/add-bullets-string-list-string)
- [`AddEnterFiller(string, params string[])`](/reference/dotnet/signal-wire.contexts/context/add-enter-filler-string-params-string)
- [`AddExitFiller(string, params string[])`](/reference/dotnet/signal-wire.contexts/context/add-exit-filler-string-params-string)
- [`AddSection(string, string)`](/reference/dotnet/signal-wire.contexts/context/add-section-string-string)
- [`AddStep(string, Dictionary<string, object>?)`](/reference/dotnet/signal-wire.contexts/context/add-step-string-dictionary-string-object)
- [`AddSystemBullets(string, List<string>)`](/reference/dotnet/signal-wire.contexts/context/add-system-bullets-string-list-string)
- [`AddSystemSection(string, string)`](/reference/dotnet/signal-wire.contexts/context/add-system-section-string-string)
- [`Context(string)`](/reference/dotnet/signal-wire.contexts/context/context-string)
- [`GetInitialStep()`](/reference/dotnet/signal-wire.contexts/context/get-initial-step)
- [`GetStep(string)`](/reference/dotnet/signal-wire.contexts/context/get-step-string)
- [`GetStepOrder()`](/reference/dotnet/signal-wire.contexts/context/get-step-order)
- [`GetSteps()`](/reference/dotnet/signal-wire.contexts/context/get-steps)
- [`GetValidContexts()`](/reference/dotnet/signal-wire.contexts/context/get-valid-contexts)
- [`MoveStep(string, int)`](/reference/dotnet/signal-wire.contexts/context/move-step-string-int)
- [`RemoveStep(string)`](/reference/dotnet/signal-wire.contexts/context/remove-step-string)
- [`SetConsolidate(bool)`](/reference/dotnet/signal-wire.contexts/context/set-consolidate-bool)
- [`SetEnterFillers(Dictionary<string, List<string>>)`](/reference/dotnet/signal-wire.contexts/context/set-enter-fillers-dictionary-string-list-string)
- [`SetExitFillers(Dictionary<string, List<string>>)`](/reference/dotnet/signal-wire.contexts/context/set-exit-fillers-dictionary-string-list-string)
- [`SetFullReset(bool)`](/reference/dotnet/signal-wire.contexts/context/set-full-reset-bool)
- [`SetInitialStep(string)`](/reference/dotnet/signal-wire.contexts/context/set-initial-step-string) — Set which step the context starts on when entered. <p>By default, a context starts on its first step (index 0). Use this to skip a preamble step on re-entry via <code>change\_context</code>.</p>
- [`SetIsolated(bool)`](/reference/dotnet/signal-wire.contexts/context/set-isolated-bool) — Mark this context as isolated — entering it wipes conversation history. <p>When <code class="paramref">isolated</code> = true and the context is entered via change\_context, the runtime wipes the conversation array. The model starts fresh with only the new context's system\_prompt + step instructions, with no memory of prior turns.</p> <p><b>EXCEPTION — reset overrides the wipe:</b> If the context also has a reset configuration (via <xref href="SignalWire.Contexts.Context.SetConsolidate(System.Boolean)" data-throw-if-not-resolved="false"></xref> or <xref href="SignalWire.Contexts.Context.SetFullReset(System.Boolean)" data-throw-if-not-resolved="false"></xref>), the wipe is skipped in favor of the reset behavior. Use reset with consolidate=true to summarize prior history into a single message instead of dropping it entirely.</p> <p>Use cases: switching to a sensitive billing flow that should not see prior small-talk; handing off to a different agent persona; resetting after a long off-topic detour.</p>
- [`SetPostPrompt(string)`](/reference/dotnet/signal-wire.contexts/context/set-post-prompt-string)
- [`SetPrompt(string)`](/reference/dotnet/signal-wire.contexts/context/set-prompt-string)
- [`SetSystemPrompt(string)`](/reference/dotnet/signal-wire.contexts/context/set-system-prompt-string)
- [`SetUserPrompt(string)`](/reference/dotnet/signal-wire.contexts/context/set-user-prompt-string)
- [`SetValidContexts(List<string>)`](/reference/dotnet/signal-wire.contexts/context/set-valid-contexts-list-string)
- [`SetValidSteps(List<string>)`](/reference/dotnet/signal-wire.contexts/context/set-valid-steps-list-string)
- [`ToDict()`](/reference/dotnet/signal-wire.contexts/context/to-dict)
