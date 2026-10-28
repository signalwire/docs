import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-call.tsp";
import "./models/live-transcribe.tsp";
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
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("transcribe_status_callback")
@post
op transcribeStatusCallback(
  @body payload: TranscribeStatusCallbackPayload,
): WebhookAck;

@summary("Live transcription utterance webhook")
@doc("""
  Sent to the `webhook` URL of a [`live_transcribe`](/docs/swml/reference/calling/live-transcribe)
  `start` action each time an utterance is transcribed, when `live_events` is `true`. Each side of
  the call you listed in `direction` sends its own events. `channel_data.content_disposition` is
  `transcribe.utterance`.
  """)
@webhook
@operationId("live_transcribe_utterance_webhook")
@post
op liveTranscribeUtteranceWebhook(
  @body payload: LiveTranscribeUtteranceWebhookPayload,
): WebhookAck;

@summary("Live transcription summary webhook")
@doc("""
  Sent when you request a summary with the [`live_transcribe`](/docs/swml/reference/calling/live-transcribe)
  `summarize` action while transcription is running. It goes to the `webhook` URL on `summarize`,
  or to the one on `start` when `summarize` has none. `channel_data.content_disposition` is
  `transcribe.live_summarize`.
  """)
@webhook
@operationId("live_transcribe_summary_webhook")
@post
op liveTranscribeSummaryWebhook(
  @body payload: LiveTranscribeSummaryWebhookPayload,
): WebhookAck;

@summary("Live transcription conversation log webhook")
@doc("""
  Sent once to the `webhook` URL of a [`live_transcribe`](/docs/swml/reference/calling/live-transcribe)
  `start` action when the session ends, whether you stopped it or the call ended. It carries the
  full transcript, session totals, and the AI summary when `ai_summary` is `true`.
  `channel_data.content_disposition` is `transcribe.conversation_log`.
  """)
@webhook
@operationId("live_transcribe_conversation_log_webhook")
@post
op liveTranscribeConversationLogWebhook(
  @body payload: LiveTranscribeConversationLogWebhookPayload,
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
