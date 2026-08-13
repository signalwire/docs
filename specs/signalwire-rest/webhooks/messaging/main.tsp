import "../../../_shared/webhook/decorator.tsp";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-message.tsp";

using TypeSpec.OpenAPI;

@webhook(
  "messageStatusCallback",
  MessageStatusCallbackPayload,
  MESSAGING_WEBHOOKS_TAG
)
@webhook(
  "tenDlcStatusCallback",
  TenDlcStatusCallbackPayload,
  MESSAGING_WEBHOOKS_TAG
)
@webhook(
  "inboundMessageWebhook",
  InboundMessageWebhookPayload,
  MESSAGING_WEBHOOKS_TAG
)
namespace SignalWireAPI.Webhooks.Messaging;
