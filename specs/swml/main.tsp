import "@typespec/json-schema";
import "./Methods";

using TypeSpec.JsonSchema;

@summary("Calling section")
model CallingSection {
  main: CallingMethods[];
  ...TypeSpec.Record<CallingMethods[]>;
}

@summary("Messaging section")
model MessagingSection {
  main: MessagingMethods[];
  ...TypeSpec.Record<MessagingMethods[]>;
}

@jsonSchema
@summary("Calling SWML document")
model CallingSWMLObject {
  version?: "1.0.0";
  sections: CallingSection;
}

@jsonSchema
@summary("Messaging SWML document")
model MessagingSWMLObject {
  sections: MessagingSection;
}

@oneOf
@summary("SWML Object")
union SWMLObject {
  CallingSWMLObject,
  MessagingSWMLObject,
}

/*
// ─────────────────────────────────────────────────────────────────────────────
// DRY single-document approach — commented out, kept for potential revert.
//
// One Section, one SWMLObject, with `main: SWMLMethod[]` accepting both voice
// and messaging methods. Simpler, but mixed arrays validate, and IDE autocomplete
// behaves identically to the discriminated approach above.
//
// To revert: comment out the discriminated block above, uncomment this block,
// and revert inner-array types in cond/connect/execute/switch back to `SWMLMethod[]`.
// ─────────────────────────────────────────────────────────────────────────────

@summary("SWML sections")
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
*/
