using TypeSpec.Reflection;

namespace SignalWire.Webhook;

/**
 * Mark an operation as an OpenAPI 3.1 **webhook** — a request SignalWire sends
 * *to* the customer's endpoint, rather than one the customer sends to us.
 *
 * The decorated operation lands in the document's top-level `webhooks` object
 * instead of `paths`. Direction is inverted relative to a normal operation:
 *
 * | Operation part | Meaning on a webhook |
 * |----------------|----------------------|
 * | parameters / body | what **SignalWire sends** to the customer's URL |
 * | return type | what the **customer's endpoint must return** to SignalWire |
 *
 * That second row is the whole reason this is an `op` and not a payload model:
 * a webhook whose reply SignalWire actually parses (the SWAIG family) can state
 * that contract as a real schema instead of prose.
 *
 * ## Why there is no path
 *
 * The customer owns the endpoint address — it is registered out of band (a
 * dashboard field, a `status_url` on a request), so the provider cannot write a
 * route for it. The `webhooks` key is a *name*, not a URL. This decorator
 * assigns the operation a synthetic internal route purely so the stock OpenAPI
 * emitter resolves it like any other operation; the emitter then lifts it out of
 * `paths` and deletes that route. A synthetic route never reaches the output —
 * `@signalwire/typespec-openapi3` fails the build if one survives.
 *
 * ## Metadata
 *
 * Everything comes from standard decorators — there are no bespoke arguments for
 * things TypeSpec already models. `@summary`, `@doc`, `@tag`, `@operationId`,
 * `@opExample`, `@header` and `@statusCode` all behave exactly as they do on a
 * regular operation.
 *
 * Webhooks are unauthenticated from the API's point of view (SignalWire is the
 * caller, not the callee), so pair them with `@useAuth(NoAuth)` unless the
 * endpoint genuinely expects the service's own credentials.
 *
 * @param name Key in the OpenAPI `webhooks` object. Defaults to the operation
 * name, which is what you want in nearly every case — pass this only when the
 * key must differ from the TypeSpec identifier.
 *
 * @example
 * ```typespec
 * @tag(AI_WEBHOOKS_TAG)
 * @useAuth(NoAuth)
 * namespace SignalWireAPI.Webhooks.AI;
 *
 * @webhook
 * @operationId("ai_swaig_tool_webhook")
 * @summary("AI SWAIG tool webhook")
 * @doc("Sent to a tool's `web_hook_url` when an AI agent calls one of your functions.")
 * @post
 * op aiSwaigToolWebhook(
 *   @body payload: AiSwaigToolWebhookPayload,
 * ): SwaigToolWebhookResponse;
 * ```
 */
extern dec webhook(target: Operation, name?: valueof string);
