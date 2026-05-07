import "@typespec/json-schema";
import "./Methods";

using TypeSpec.JsonSchema;

namespace SWML.Messaging;

@summary("SWML section")
model Section {
  main: SWMLMethod[];
  ...TypeSpec.Record<SWMLMethod[]>;
}

@jsonSchema
@summary("SWML Object")
model SWMLObject {
  version?: "1.0.0";
  sections: Section;
}
