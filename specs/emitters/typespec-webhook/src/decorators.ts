import type { Operation, Program } from "@typespec/compiler";
import { useStateMap } from "@typespec/compiler/utils";
import { setRoute } from "@typespec/http";
import type { WebhookDecorator } from "../generated-defs/SignalWire.Webhook.js";
import { reportDiagnostic, WebhookStateKeys } from "./lib.js";

/**
 * Route prefix for the synthetic path a webhook operation is parked on.
 *
 * Webhooks have no path — the customer owns the URL. But the stock OpenAPI
 * emitter only walks *routed* operations, and that walk is what produces the
 * request/response schemas, `$ref`s into `components`, tags and examples we
 * want. So each webhook operation is parked on a unique synthetic route, emitted
 * as a normal path, then lifted into `webhooks` and deleted from `paths` by
 * `@signalwire/typespec-openapi3`.
 *
 * The prefix is deliberately conspicuous: if one ever reaches a published
 * document it is unmistakably a bug, and the emitter hard-fails on exactly that.
 */
export const WEBHOOK_ROUTE_PREFIX = "/.typespec-webhook";

const [getWebhookKey, setWebhookKey] = useStateMap<Operation, string>(WebhookStateKeys.webhooks);

/**
 * `@webhook` marks an operation as a request the service *sends* rather than
 * receives. Registration is all that happens here; the lifting into the
 * document's `webhooks` object happens at emit time in
 * `@signalwire/typespec-openapi3`.
 *
 * Assigning the synthetic route from inside the decorator (rather than making
 * every call site write `@route`) keeps the marker argument-free and keeps the
 * routes guaranteed-unique, since they are derived from the webhook key that
 * this same decorator already requires to be unique.
 */
export const $webhook: WebhookDecorator = (context, target, name) => {
  const { program } = context;
  const key = name ?? target.name;

  for (const [other, existing] of listWebhooks(program)) {
    if (existing === key && other !== target) {
      reportDiagnostic(program, {
        code: "duplicate-name",
        format: { name: key, other: other.name },
        target: context.decoratorTarget,
      });
      return;
    }
  }

  setWebhookKey(program, target, key);
  setRoute(context, target, { path: `${WEBHOOK_ROUTE_PREFIX}/${key}`, shared: false });
};

/** The `webhooks` object key for `operation`, or undefined if it is not a webhook. */
export function getWebhookName(program: Program, operation: Operation): string | undefined {
  return getWebhookKey(program, operation);
}

/** Every operation marked `@webhook`, mapped to its `webhooks` object key. */
export function listWebhooks(program: Program): ReadonlyMap<Operation, string> {
  return program.stateMap(WebhookStateKeys.webhooks) as ReadonlyMap<Operation, string>;
}
