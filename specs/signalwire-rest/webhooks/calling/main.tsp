import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-call.tsp";
import "./models/command-callbacks.tsp";
import "@signalwire/typespec-webhook";
import "../../../_shared/webhook-ack.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using SignalWire.Webhook;

// SignalWire is the caller here, not the callee — these operations describe
// requests we send to the customer's endpoint, so the service's own auth scheme
// does not apply to them.
@tag(CALLING_WEBHOOKS_TAG)
@useAuth(NoAuth)
namespace SignalWireAPI.Webhooks.Calling;

@summary("Transcript status callback")
@doc("""
  Sent to your `status_url` when the call's transcription is ready.
  `calling.transcript.completed` includes the transcribed text;
  `calling.transcript.failed` means the call could not be transcribed.
  The same `status_url` also receives [transcribe state callbacks](/docs/apis/rest/webhooks/transcribe-state-callback)
  as the transcription starts and finishes.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("transcribe_status_callback")
@post
op transcribeStatusCallback(
  @body payload: TranscribeStatusCallbackPayload,
): WebhookAck;

@summary("Stream status callback")
@doc("""
  Sent to your `status_url` when a background audio stream started with
  `calling.stream` changes state. `params.state` is `streaming` when the stream
  starts and `finished` when it ends.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("stream_status_callback")
@post
op streamStatusCallback(@body payload: StreamStatusCallbackPayload): WebhookAck;

@summary("SWML inbound call webhook")
@doc("""
  Payload sent by SignalWire to a SWML calling webhook URL when SWML is fetched for a call. This includes inbound calls arriving on a phone number configured with a SWML calling handler, and outbound REST-initiated calls that point at a SWML URL. The same payload shape is also used when the SWML calling `transfer` or `execute` method targets an external URL — in those cases, the `params` object carries the values supplied to that step.
  
  The webhook URL is expected to respond with the SWML document to execute for the call.
  """)
@webhook
@operationId("inbound_call_webhook")
@post
op inboundCallWebhook(@body payload: InboundCallWebhookPayload): WebhookAck;

@summary("Call state status callback")
@doc("""
  Sent to the `status_url` of a [`dial`](/docs/apis/rest/calls/call-commands) command when the call
  enters one of the states listed in `status_events` (by default, only `ended`).
  `params.call_state` is the state the call has entered.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("call_state_status_callback")
@post
op callStateStatusCallback(
  @body payload: CallStateStatusCallbackPayload,
): WebhookAck;

@summary("Play status callback")
@doc("""
  Sent to the `status_url` of a `calling.play` command when playback changes state.
  `params.state` is `playing`, `paused`, `finished`, or `error`.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("play_status_callback")
@post
op playStatusCallback(@body payload: PlayStatusCallbackPayload): WebhookAck;

@summary("Record status callback")
@doc("""
  Sent to the `status_url` of a `calling.record` command when the recording changes state.
  The `finished` event carries the recording's final `url`, `size`, and `duration`.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("record_status_callback")
@post
op recordStatusCallback(@body payload: RecordStatusCallbackPayload): WebhookAck;

@summary("Collect status callback")
@doc("""
  Sent to the `status_url` of a `calling.collect` command with each collect result: the digits
  or speech collected, or why nothing was.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("collect_status_callback")
@post
op collectStatusCallback(
  @body payload: CollectStatusCallbackPayload,
): WebhookAck;

@summary("Detect status callback")
@doc("""
  Sent to the `status_url` of a `calling.detect` command each time the detector reports a result,
  and with `finished` when it stops.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("detect_status_callback")
@post
op detectStatusCallback(@body payload: DetectStatusCallbackPayload): WebhookAck;

@summary("Tap status callback")
@doc("""
  Sent to the `status_url` of a `calling.tap` command when the tap starts (`tapping`) and when it
  ends (`finished`).
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("tap_status_callback")
@post
op tapStatusCallback(@body payload: TapStatusCallbackPayload): WebhookAck;

@summary("Transcribe state callback")
@doc("""
  Sent to the `status_url` of a `calling.transcribe` command when the transcription starts
  (`transcribing`) and when it finishes (`finished`). The transcript itself arrives separately, as a
  [transcript status callback](/docs/apis/rest/webhooks/transcribe-status-callback).
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("transcribe_state_callback")
@post
op transcribeStateCallback(
  @body payload: TranscribeStateStatusCallbackPayload,
): WebhookAck;
