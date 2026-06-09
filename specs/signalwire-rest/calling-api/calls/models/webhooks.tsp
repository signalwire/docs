import "../../../../_shared/webhook/decorator.tsp";
import "../../../types";

namespace SignalWireAPI.Calling;

@summary("Transcript status callback")
@doc("""
  Sent to your `status_url` when the call's transcription is ready.
  `calling.transcript.completed` includes the transcribed text;
  `calling.transcript.failed` means the call could not be transcribed.
  """)
model TranscribeStatusCallbackPayload {
  @doc("Whether the transcription completed or failed.")
  @example("calling.transcript.completed")
  event_type: "calling.transcript.completed" | "calling.transcript.failed";

  @doc("When the event was sent, as a Unix timestamp in seconds.")
  @example(1777565701.5623918)
  timestamp: float;

  @doc("Your project ID.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id: uuid;

  @doc("Your Space ID.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id: uuid;

  @doc("The transcript.")
  params: {
    @doc("Unique ID for this transcript.")
    @example("0ec5a4da-46b9-4d2c-b724-151add8d4d08")
    id: uuid;

    @doc("ID of the call that was transcribed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: uuid;

    @doc("ID of the call leg that was transcribed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    segment_id: uuid;

    @doc("The transcribed text of the call. Omitted when there is no transcribed text.")
    @example("A long time ago in a galaxy far, far away, Luke, I am your father. Do or do not, there is no try. May the force be with you. These aren't the droids you're looking for. I find your lack of faith disturbing. The force will be with you always.")
    text?: string;
  };
}

@summary("Stream status callback")
@doc("""
  Sent to your `status_url` when a background audio stream started with
  `calling.stream` changes state. `params.state` is `streaming` when the stream
  starts and `finished` when it ends.
  """)
model StreamStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.stream` for stream status callbacks.")
  @example("calling.call.stream")
  event_type: "calling.call.stream";

  @doc("The channel the event was delivered on.")
  @example("swml:451ed9ff-e568-4222-8af9-4f9ab7428d09")
  event_channel: string;

  @doc("When the event was sent, as a Unix timestamp in seconds.")
  @example(1777565701.5623918)
  timestamp: float;

  @doc("Your project ID.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id: uuid;

  @doc("Your Space ID.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id: uuid;

  @doc("Details about the stream.")
  params: {
    @doc("ID of the call being streamed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: uuid;

    @doc("ID of the node the call is on.")
    @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
    node_id: uuid;

    @doc("ID of the call segment being streamed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    segment_id: uuid;

    @doc("The tag associated with the call. Present only when a tag was set on the call.")
    @example("my-tag")
    tag?: string;

    @doc("The control ID used to control the stream, as set in `calling.stream`.")
    @example("stream-control-1")
    control_id: string;

    @doc("The stream state. `streaming` when the stream starts, `finished` when it ends.")
    @example("streaming")
    state: "streaming" | "finished";

    @doc("The WebSocket URL the audio is being streamed to.")
    @example("wss://example.com/stream")
    url: string;

    @doc("The friendly name of the stream. Present when a `name` was set on the stream.")
    @example("customer-support-recording")
    name?: string;
  };
}

@doc("""
  The kind of AI sidecar callback. See the
  [SWML ai_sidecar reference](/docs/swml/reference/calling/ai-sidecar#callback-types)
  for the type-specific fields each one carries.
  """)
enum AISidecarCallbackType {
  @doc("The sidecar attached to the call.")
  start,

  @doc("The customer finished a turn and an evaluation is about to run.")
  turn,

  @doc("The sidecar called the model.")
  request,

  @doc("The model produced intermediate reasoning text.")
  thought,

  @doc("The sidecar's advice for the agent.")
  insight,

  @doc("The model called the built-in `sidecar_skip` tool to stay silent for this turn.")
  skip,

  @doc("The model called one of your tools.")
  tool_call,

  @doc("One of your tools returned a result.")
  tool_result,

  @doc("A SWAIG action was returned (and, if enabled, executed).")
  action,

  @doc("A `set_global_data` / `unset_global_data` action changed `global_data`.")
  global_data_change,

  @doc("The conversation history was trimmed to fit the token budget.")
  history_pruned,

  @doc("Something failed, or an anti-loop guard tripped.")
  error,

  @doc("An `ai_sidecar.ask` was queued. Carries the `ask_id`.")
  ask_request,

  @doc("The answer to an `ai_sidecar.ask`. Carries the matching `ask_id`.")
  ask_answer,

  @doc("The sidecar is shutting down.")
  stop,

  @doc("The last callback before the sidecar stops — a full snapshot of the session.")
  final,
}

@summary("AI sidecar callback")
@doc("""
  Delivered to the sidecar's `url` (when set) as the sidecar observes the call. The same payload
  is always published on the `calling.ai.sidecar` relay topic; the webhook POST is opt-in.
  The actual event is under `sidecar_event` — unwrap it before reading `type` and the event's fields.
  
  This payload documents the common envelope shared by every callback. For the per-`type` fields
  (for example `insight.raw`, `turn.transcript_delta`, `final.summary`), see the
  [SWML ai_sidecar reference](/docs/swml/reference/calling/ai-sidecar#callback-types).
  """)
model AISidecarCallbackPayload {
  @doc("Envelope describing the call. `project_id` and `space_id` are included when available.")
  call_info: {
    @doc("Your project ID.")
    @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
    project_id?: uuid;

    @doc("Your Space ID.")
    @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
    space_id?: uuid;

    @doc("ID of the call the sidecar is attached to.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: uuid;

    @doc("The content type of the POST body.")
    @example("text/json")
    content_type?: string;

    @doc("How the body is delivered.")
    @example("post_data")
    content_disposition?: string;

    @doc("The conversation type.")
    @example("voice")
    conversation_type?: string;
  };

  @doc("The sidecar callback. Carries the common fields below plus type-specific fields.")
  sidecar_event: {
    @doc("The callback type.")
    @example(AISidecarCallbackType.insight)
    type: AISidecarCallbackType;

    @doc("When the event was produced, as a Unix timestamp in microseconds.")
    @example(1745870400123456)
    ts: int64;

    @doc("The processing-tick identifier the callback belongs to.")
    @example(7)
    tick_id: int64;

    @doc("Call/channel context: `call_id`, plus `caller_id_name` / `caller_id_number` / `destination_number` when available.")
    channel_data: Record<unknown>;
  };
}
