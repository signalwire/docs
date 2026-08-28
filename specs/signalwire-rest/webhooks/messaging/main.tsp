import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-message.tsp";
import "@signalwire/typespec-webhook";
import "../../../_shared/webhook-ack.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using SignalWire.Webhook;

// SignalWire is the caller here, not the callee — these operations describe
// requests we send to the customer's endpoint, so the service's own auth scheme
// does not apply to them.
@tag(MESSAGING_WEBHOOKS_TAG)
@useAuth(NoAuth)
namespace SignalWireAPI.Webhooks.Messaging;

@summary("SWML inbound message webhook")
@doc("""
  Payload sent by SignalWire to a SWML messaging webhook URL when an inbound SMS or MMS message arrives on a phone number configured with a SWML message handler. The same payload shape is also used when the SWML messaging `transfer` method targets an external URL — in that case, `params` carries the values supplied to the `transfer` step and `vars` carries the propagated runtime variables from the originating document.
  
  The webhook URL is expected to respond with the SWML document to execute for the inbound message.
  """)
@webhook
@operationId("inbound_message_webhook")
@post
op inboundMessageWebhook(
  @body payload: InboundMessageWebhookPayload,
): WebhookAck;

@summary("Message status callback")
@doc("""
  Payload sent by SignalWire to the `status_callback` URL each time a message transitions to a new state. The same payload shape is used for Relay SDK message callbacks, SWML `send_sms` status callbacks, and SWML messaging `reply.status_url` callbacks.
  
  Configure `status_callback` when [sending a message](/docs/apis/rest/messages/create-message).
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("message_status_callback")
@post
op messageStatusCallback(
  @body payload: MessageStatusCallbackPayload,
): WebhookAck;

@summary("10DLC status callback")
@doc("""
  Payload sent by SignalWire to your 10DLC Status Callback URL when the state of a 10DLC registration
  object changes. Use this webhook to monitor the lifecycle of messaging brands, campaigns, number
  assignment orders, and number assignments in real time.
  
  Configure `status_callback_url` when
  [creating a brand](/docs/apis/rest/campaign-registry/brands/create-brand),
  [creating a campaign](/docs/apis/rest/campaign-registry/campaigns/create-campaign), or
  [creating a number assignment order](/docs/apis/rest/campaign-registry/phone-number-assignments/create-order).
  
  ### Brand event types
  
  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `completed` | `brand_activated` | The brand has been successfully verified and activated. |
  | `pending` → `unverified` | `brand_unverified` | Brand verification failed or additional information is required. |
  | `unverified` → `completed` | `brand_activated` | The brand was previously unverified but is now active. |
  
  ### Campaign event types
  
  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `active` | `campaign_activated` | The campaign has been approved and is now active. |
  | `active` → `inactive` | `campaign_deactivated` | The campaign has been deactivated and can no longer send. |
  
  ### Number assignment order event types
  
  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `processed` | `number_assignment_order_processed` | The order has been processed and numbers assigned. |
  
  ### Number assignment event types
  
  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `failed` | `number_assignment_failed` | The number was not assigned to the campaign. |
  | `failed` → `pending` | `number_assignment_pending` | A failed assignment is being retried. |
  | `pending` → `completed` | `number_assignment_activated` | The number has been successfully assigned to the campaign. |
  
  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
@webhook
@operationId("ten_dlc_status_callback")
@post
op tenDlcStatusCallback(@body payload: TenDlcStatusCallbackPayload): WebhookAck;
