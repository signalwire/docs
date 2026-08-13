import "@typespec/openapi";
import "../../../../swml/calling";

namespace SignalWireAPI.Webhooks.AI;

// What your endpoint sends *back*. Only the signature response lives here — the
// SWAIG tool result is `SWML.Calling.Output` (or `OutputBase` for the surfaces
// that read less), because a webhook reply and a `data_map` output are the same
// object to the same parser. The webhook operations reference those directly.
//
// Shapes were verified against the platform's parser rather than inferred from
// prose: the agent surfaces do not accept the same reply, and the differences
// are load-bearing.

@summary("SWAIG function signature envelope")
@doc("""
  The object form of a signature response, which additionally lets you set
  [`SWAIG.defaults`](/docs/swml/reference/calling/ai/swaig#swaigdefaults) for the functions it carries.
  
  Use this when the functions you are returning share a `web_hook_url`, auth, or other defaults —
  it saves repeating them on every definition.
  """)
model SwaigSignatureEnvelope {
  @doc("The function definitions your server hosts.")
  functions: SWML.Calling.UserSWAIGFunction[];

  @doc("Defaults applied to every function in `functions`.")
  defaults?: SWML.Calling.SWAIGDefaults;
}

@summary("SWAIG function signature response")
@doc("""
  The function definitions your server hosts, returned to the agent that asked for them.
  
  Three forms are accepted: an array of definitions (the usual one), a single definition on its own,
  or an envelope object carrying `functions` alongside shared `defaults`. Each definition is shaped
  like an entry in
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) — `function`,
  `description`, and `parameters`.
  
  Every definition you return is registered, whether or not it was named in the request's
  `functions` list.
  """)
union SwaigSignatureResponse {
  SWML.Calling.UserSWAIGFunction[],
  SWML.Calling.UserSWAIGFunction,
  SwaigSignatureEnvelope,
}
