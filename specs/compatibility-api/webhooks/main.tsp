import "@typespec/http";
import "@typespec/openapi";
import "@signalwire/typespec-webhook";
import "../../_shared/webhook-ack.tsp";
import "../tags.tsp";
import "../calls/models/webhooks.tsp";
import "../messages/models/webhooks.tsp";
import "../transcriptions/models/webhooks.tsp";
import "../incoming-phone-numbers/models/webhooks.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using SignalWire.Webhook;

// Webhooks are collected here rather than on the resources that configure them
// because they cannot live under a routed namespace: the Compatibility API's
// resource namespaces carry an `/Accounts/{AccountSid}/...` route, and a webhook
// has no path to hang off. Each operation keeps its own @tag so it still files
// under the resource it belongs to.
//
// SignalWire is the caller here, not the callee, so the service's auth scheme
// does not apply.
@useAuth(NoAuth)
namespace CompatibilityAPI.Webhooks;

@summary("Voice status callback")
@doc("""
  Payload sent by SignalWire to your Voice Status Callback URL when the status of a call changes.
  
  Configure this callback using the `StatusCallback` and `StatusCallbackEvent` parameters when
  [creating a call via the API](/docs/compatibility-api/rest/calls/create-a-call) or using
  [Dial](/docs/compatibility-api/cxml/reference/voice/dial) with
  [Number](/docs/compatibility-api/cxml/reference/voice/number),
  [SIP](/docs/compatibility-api/cxml/reference/voice/sip), or
  [Conference](/docs/compatibility-api/cxml/reference/voice/conference).
  
  Use `StatusCallbackEvent` to receive every call progress event — not just the final status —
  along with current call state and all parameters below.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("voice_status_callback")
@tag(CALLS_TAG)
@post
op voiceStatusCallback(@body payload: VoiceStatusCallbackPayload): WebhookAck;

@summary("Recording status callback")
@doc("""
  Payload sent by SignalWire to your `RecordingStatusCallback` URL when a recording status event occurs.
  
  Recordings are not always available immediately — especially at high call volumes. This callback lets
  your app react as soon as a recording is ready, whether that means uploading it to external storage,
  sending it via email, or forwarding the URL via SMS.
  
  Configure `RecordingStatusCallback` when
  [creating a call via the API](/docs/compatibility-api/rest/calls/create-a-call) or when using
  [Dial](/docs/compatibility-api/cxml/reference/voice/dial),
  [Conference](/docs/compatibility-api/cxml/reference/voice/conference), or
  [Record](/docs/compatibility-api/cxml/reference/voice/record).
  
  Use `RecordingStatusCallbackEvent` to request callbacks for specific events. If omitted, only the
  `completed` event is sent. Possible values: `in-progress`, `completed`, `absent`.
  
  | Status | Description |
  |--------|-------------|
  | `in-progress` | The recording has begun. |
  | `completed` | The file is available for access. |
  | `absent` | The recording was too short or the call was silent — no audio was detected. |
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("recording_status_callback")
@tag(RECORDINGS_TAG)
@post
op recordingStatusCallback(
  @body payload: RecordingStatusCallbackPayload,
): WebhookAck;

@summary("SMS status callback")
@doc("""
  Payload sent by SignalWire to your SMS Status Callback URL when the status of an SMS/MMS message changes.
  
  Configure this callback using the `StatusCallback` parameter when
  [sending an outgoing message](/docs/compatibility-api/rest/messages/create-message).
  
  There are 8 possible message statuses:
  
  | Status | Description |
  |--------|-------------|
  | `queued` | The API request was processed and the message is waiting to be sent. |
  | `sending` | The message is being transmitted to the nearest upstream carrier. |
  | `sent` | The nearest upstream carrier has accepted the message. |
  | `delivered` | The nearest upstream carrier confirmed receipt of the message. |
  | `undelivered` | SignalWire received notice from the upstream carrier that the message was not delivered. |
  | `failed` | SignalWire could not send the message. There is no charge for failed messages. |
  | `receiving` | SignalWire has received and is currently processing an inbound message. |
  | `received` | The inbound message has been received by a number in your account. |
  
  <Note>
  SignalWire only marks a message as `delivered` when it receives a Delivery Receipt (DLR)
  from the receiving carrier confirming entry into the end carrier's network. `sent` means the message
  left SignalWire and reached the downstream peer. Some carriers send delayed DLRs; others send none
  at all. MMS messages never receive DLRs, so they will only ever reach `sent` status.
  </Note>
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("sms_status_callback")
@tag(MESSAGES_TAG)
@post
op smsStatusCallback(@body payload: SmsStatusCallbackPayload): WebhookAck;

@summary("Transcription status callback")
@doc("""
  Payload sent by SignalWire to your Transcription Status Callback URL when the status of a transcription changes.
  
  Configure this callback by enabling transcription on a recording via the
  [Record](/docs/compatibility-api/cxml/reference/voice/record) verb (`transcribe=true`) and setting `transcribeCallback`
  to your webhook URL.
  
  Your app can use these parameters to handle the transcription — for example, uploading the text to
  your CRM, sending it via email, or forwarding the body via SignalWire SMS.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("transcription_status_callback")
@tag(TRANSCRIPTIONS_TAG)
@post
op transcriptionStatusCallback(
  @body payload: TranscriptionStatusCallbackPayload,
): WebhookAck;

@summary("Incoming call status callback")
@doc("""
  Payload sent by SignalWire to your Inbound Call Status Callback URL for inbound calls to a phone number.
  
  Configure `StatusCallback` at the phone number level via the dashboard
  (**Phone Numbers** → select a number → **Phone Number Settings**) or programmatically via the
  [create](/docs/compatibility-api/rest/incoming-phone-numbers/create-incoming-phone-number) or
  [update](/docs/compatibility-api/rest/incoming-phone-numbers/update-incoming-phone-number) Incoming Phone Number API endpoints.
  
  By default, the webhook fires only when the call is `completed` or `failed`, making it well-suited
  for tracking inbound call success rate, call quality, and total call volume in a call center context.
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("incoming_call_status_callback")
@tag(INCOMING_PHONE_NUMBERS_TAG)
@post
op incomingCallStatusCallback(
  @body payload: InboundCallStatusCallbackPayload,
): WebhookAck;
