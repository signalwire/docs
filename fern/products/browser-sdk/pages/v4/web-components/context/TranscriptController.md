# `TranscriptController`

Reactive controller that subscribes to `call.signalingEvent$`, runs the AI transcript state machine, and provides `transcriptContext` to all descendants.

## Constructor

```ts
new TranscriptController(host: LitElement)
```

Attach once in the host class body. No further wiring needed if the host is inside a `<sw-call-media>` tree — the controller auto-consumes `callContext`.

## Methods

| method | description |
|--------|-------------|
| `setCall(call?)` | Manually bind or unbind a call (overrides context) |

## State machine — events handled

| `event_type` | action |
|---|---|
| `ai.partial_result` / `ai.speech_detect` | Upsert partial user entry |
| `ai.transparent_barge` | Finalise user entry |
| `ai.completion` | Finalise current agent entry |
| `ai.response_utterance` | Append/accumulate agent entry |

## Usage

```ts
class MyElement extends LitElement {
  private _transcript = new TranscriptController(this);

  // If call doesn't come from callContext, set it manually:
  protected updated(changed: Map<string, unknown>) {
    if (changed.has('call')) this._transcript.setCall(this.call);
  }
}
```
