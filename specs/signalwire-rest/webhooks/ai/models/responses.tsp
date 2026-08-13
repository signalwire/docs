import "@typespec/openapi";
import "../../../../swml/calling";

namespace SignalWireAPI.Webhooks.AI;

// What your endpoint sends *back*. Webhook request payloads live alongside this
// file; these are the replies SignalWire parses and acts on, which is what makes
// them worth modelling — a status callback's reply is ignored beyond its status
// code, but everything here changes what the agent does next.
//
// The action vocabulary is the SWML one: these models reference
// `SWML.Calling.Action` and the `SWAIG.functions` models rather than restating
// them, so the contract your endpoint returns stays defined in exactly one place.

@summary("SWAIG tool webhook response")
@doc("""
  What your endpoint returns after running a SWAIG function.
  
  `response` is written to the AI, not spoken to the caller — it is the result the agent reads before
  deciding what to say next. `action` is optional and steers the call itself: transfer it, send an
  SMS, play audio, update `global_data`, or move to a different context or step. Both can appear
  together; returning the pickup time in `response` and an SMS `action` alongside it is the ordinary
  case.
  
  Every object `action` accepts is documented in the
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) reference.
  """)
model SwaigToolWebhookResponse {
  @doc("The result the agent reads next. Written to the AI's context, not spoken to the caller.")
  @example("The fare to the airport is $38.60. Offer to book a pickup now.")
  response: string;

  @doc("""
    Instructions the platform executes on the live call. Accepts a single action object or an array of
    them.
    """)
  action?: SWML.Calling.Action | SWML.Calling.Action[];
}

@summary("SWAIG function signature response")
@doc("""
  The function definitions your server hosts, returned to the agent that asked for them.
  
  Each entry is shaped like an entry in
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) — `function`,
  `description`, and `parameters`. Every definition you return is registered, whether or not it was
  named in the request's `functions` list.
  """)
model SwaigSignatureResponse is SWML.Calling.UserSWAIGFunction[];
