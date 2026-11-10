import type { SignalWireWebhookDecorators } from "../generated-defs/SignalWire.Webhook.js";
import { $webhook } from "./decorators.js";

export { $lib } from "./lib.js";

export const $decorators = {
  "SignalWire.Webhook": {
    webhook: $webhook,
  } satisfies SignalWireWebhookDecorators,
};
