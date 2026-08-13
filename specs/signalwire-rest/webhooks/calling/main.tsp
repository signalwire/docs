import "../../../_shared/webhook/decorator.tsp";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-call.tsp";

using TypeSpec.OpenAPI;

@webhook(
  "transcribeStatusCallback",
  TranscribeStatusCallbackPayload,
  CALLING_WEBHOOKS_TAG
)
@webhook(
  "streamStatusCallback",
  StreamStatusCallbackPayload,
  CALLING_WEBHOOKS_TAG
)
@webhook("inboundCallWebhook", InboundCallWebhookPayload, CALLING_WEBHOOKS_TAG)
namespace SignalWireAPI.Webhooks.Calling;
