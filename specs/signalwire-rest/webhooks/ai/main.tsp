import "../../../_shared/webhook/decorator.tsp";
import "../tags.tsp";
import "./models/common.tsp";
import "./models/swaig.tsp";
import "./models/post-prompt.tsp";
import "./models/debug.tsp";
import "./models/sidecar.tsp";

using TypeSpec.OpenAPI;

@webhook("aiSwaigToolWebhook", AiSwaigToolWebhookPayload, AI_WEBHOOKS_TAG)
@webhook("swaigSignatureRequest", SwaigSignatureRequestPayload, AI_WEBHOOKS_TAG)
@webhook("aiPostPromptCallback", AiPostPromptCallbackPayload, AI_WEBHOOKS_TAG)
@webhook("aiDebugWebhook", AiDebugWebhookPayload, AI_WEBHOOKS_TAG)
@webhook(
  "bedrockSwaigToolWebhook",
  BedrockSwaigToolWebhookPayload,
  AI_WEBHOOKS_TAG
)
@webhook(
  "bedrockPostPromptCallback",
  BedrockPostPromptCallbackPayload,
  AI_WEBHOOKS_TAG
)
@webhook("aiSidecarCallback", AISidecarCallbackPayload, AI_WEBHOOKS_TAG)
@webhook(
  "aiSidecarSwaigToolWebhook",
  AISidecarSwaigToolWebhookPayload,
  AI_WEBHOOKS_TAG
)
namespace SignalWireAPI.Webhooks.AI;
