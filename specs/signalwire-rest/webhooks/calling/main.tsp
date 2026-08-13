import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-call.tsp";
import "@signalwire/typespec-webhook";
import "../../../_shared/webhook-ack.tsp";
import "../../../swml/calling";

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
op inboundCallWebhook(
  @body payload: InboundCallWebhookPayload,
): SWML.Calling.SWMLObject;
