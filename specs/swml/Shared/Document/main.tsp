import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Shared;

@summary("SWML section")
model Section<TMethod> {
  main: TMethod[];

  ...TypeSpec.Record<TMethod[]>;
}

@summary("SWML Document")
model SWMLObject<TSection> {
  version?: "1.0.0";
  sections: TSection;
}
