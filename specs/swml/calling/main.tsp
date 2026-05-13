import "@typespec/json-schema";
import "./Methods";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("SWML section")
model Section {
  main: SWMLMethod[];
  ...TypeSpec.Record<SWMLMethod[]>;
}

@jsonSchema
@summary("Calling SWML Document")
@doc("""
  A SWML document for handling inbound and outbound calls. Contains a `sections` map where
  each section holds an array of methods that run sequentially. Execution starts at
  `sections.main`. See the [Calling SWML reference](/docs/swml/reference/calling) for the
  full list of available methods.
  """)
model SWMLObject {
  version?: "1.0.0";
  sections: Section;
}
