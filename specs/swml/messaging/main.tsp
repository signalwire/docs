import "@typespec/json-schema";
import "../Shared/Document";
import "./Methods";

using TypeSpec.JsonSchema;

namespace SWML.Messaging;

model Section is SWML.Shared.Section<SWMLMethod>;

@jsonSchema
@summary("Messaging SWML Document")
@doc("""
  A SWML document for handling inbound SMS or MMS messages. The document has a top-level
  `sections` map; execution starts at `sections.main`, and each section is an ordered array of
  methods. Additional sections can be invoked via `execute`, `transfer`, or `goto`.

  See the [Messaging SWML reference](/docs/swml/reference/messaging) for the full list of
  available methods.
  """)
model SWMLObject is SWML.Shared.SWMLObject<Section>;
