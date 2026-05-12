import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Messaging;

@summary("receive Method")
model Receive {
  @summary("receive")
  @doc("Accept the inbound message without sending a reply. No-op step.")
  @example(#{})
  receive: {};
}

@summary("Empty SWML document")
@doc("An empty document `{}`. Accepts the inbound message without sending a reply — equivalent to `{ receive: {} }`.")
model ImplicitReceive {}

@summary("Light document receive")
@doc("""
  Accept the inbound message without sending a reply. Can be written either way:
  - `{ receive: {} }` — explicit `receive` method.
  - `{}` — empty document; treated as a `receive`.
  """)
@oneOf
union LightReceive {
  Receive,
  ImplicitReceive,
}
