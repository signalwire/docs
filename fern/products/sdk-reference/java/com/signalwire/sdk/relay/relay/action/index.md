---
slug: "/reference/java/com/signalwire/sdk/relay/relay/action"
title: "Action"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Action"
  parent: "com.signalwire.sdk.relay"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java"
  visibility: "public"
---
# `Action`

Base class for long-running call actions tracked by `control_id`.

<p>
 Actions support three completion patterns:
 <ol>
   <li><b>Wait inline</b>: `action.waitForCompletion()` blocks until terminal</li>
   <li><b>Fire and forget</b>: don't wait, check `isDone()` later</li>
   <li><b>Callback</b>: pass an `onCompleted` callback that fires on terminal state</li>
 </ol>
 <p>
 Subclasses add action-specific sub-commands (pause, resume, volume, etc.).

## Signature

```java
public class Action
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/relay/relay/action/init)
- [`getCall`](/reference/java/com/signalwire/sdk/relay/relay/action/get-call)
- [`getControlId`](/reference/java/com/signalwire/sdk/relay/relay/action/get-control-id)
- [`getResult`](/reference/java/com/signalwire/sdk/relay/relay/action/get-result)
- [`getState`](/reference/java/com/signalwire/sdk/relay/relay/action/get-state)
- [`isDone`](/reference/java/com/signalwire/sdk/relay/relay/action/is-done)
- [`isTerminal`](/reference/java/com/signalwire/sdk/relay/relay/action/is-terminal) — Check if a state is terminal for this action type.
- [`resolve`](/reference/java/com/signalwire/sdk/relay/relay/action/resolve) — Resolve the action immediately (e.g., on call-gone 404/410).
- [`setOnCompleted`](/reference/java/com/signalwire/sdk/relay/relay/action/set-on-completed)
- [`stop`](/reference/java/com/signalwire/sdk/relay/relay/action/stop) — Stop the action.
- [`toString`](/reference/java/com/signalwire/sdk/relay/relay/action/to-string)
- [`updateState`](/reference/java/com/signalwire/sdk/relay/relay/action/update-state) — Update state from an incoming event.
- [`waitForCompletion`](/reference/java/com/signalwire/sdk/relay/relay/action/wait-for-completion) — Block until the action reaches a terminal state.

## Classes

- [`AiAction`](/reference/java/com/signalwire/sdk/relay/relay/action/ai-action) — AI action with stop sub-command.
- [`CollectAction`](/reference/java/com/signalwire/sdk/relay/relay/action/collect-action) — Collect action with stop and start\_input\_timers sub-commands.
- [`DetectAction`](/reference/java/com/signalwire/sdk/relay/relay/action/detect-action) — Detect action with stop sub-command.
- [`PayAction`](/reference/java/com/signalwire/sdk/relay/relay/action/pay-action) — Pay action with stop sub-command.
- [`PlayAction`](/reference/java/com/signalwire/sdk/relay/relay/action/play-action) — Play action with pause, resume, volume, and stop sub-commands.
- [`PlayAndCollectAction`](/reference/java/com/signalwire/sdk/relay/relay/action/play-and-collect-action) — Play-and-collect action.
- [`ReceiveFaxAction`](/reference/java/com/signalwire/sdk/relay/relay/action/receive-fax-action) — Receive fax action with stop sub-command.
- [`RecordAction`](/reference/java/com/signalwire/sdk/relay/relay/action/record-action) — Record action with pause, resume, and stop sub-commands.
- [`SendFaxAction`](/reference/java/com/signalwire/sdk/relay/relay/action/send-fax-action) — Send fax action with stop sub-command.
- [`StreamAction`](/reference/java/com/signalwire/sdk/relay/relay/action/stream-action) — Stream action with stop sub-command.
- [`TapAction`](/reference/java/com/signalwire/sdk/relay/relay/action/tap-action) — Tap action with stop sub-command.
- [`TranscribeAction`](/reference/java/com/signalwire/sdk/relay/relay/action/transcribe-action) — Transcribe action with stop sub-command.

## Source

[`src/main/java/com/signalwire/sdk/relay/Action.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java)

Line 28.
