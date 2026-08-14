import type { DecoratorContext, Operation } from "@typespec/compiler";

/**
 * Mark an operation as an OpenAPI 3.1 webhook — a request the service sends to
 * the customer's endpoint. The operation is lifted out of `paths` into the
 * document's top-level `webhooks` object at emit time.
 *
 * NOTE: hand-authored to mirror the output of `tspd gen-extern-signature`
 * (the `@typespec/tspd` codegen tool is not available in this workspace). Keep in
 * sync with `lib/decorators.tsp` — the `satisfies` check in `src/tsp-index.ts`
 * and the typed `$webhook` impl enforce that the JS matches this shape.
 *
 * @param name Key in the OpenAPI `webhooks` object. Defaults to the operation name.
 */
export type WebhookDecorator = (
  context: DecoratorContext,
  target: Operation,
  name?: string,
) => void;

export type SignalWireWebhookDecorators = {
  webhook: WebhookDecorator;
};
