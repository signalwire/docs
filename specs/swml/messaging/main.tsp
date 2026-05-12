import "@typespec/json-schema";
import "./Methods";

using TypeSpec.JsonSchema;

namespace SWML.Messaging;

@summary("SWML section")
model Section {
  main: SWMLMethod[];
  ...TypeSpec.Record<SWMLMethod[]>;
}

@summary("Full SWML document")
@doc("""
  A multi-step SWML document with a top-level `sections` map. Execution starts at
  `sections.main`, and each section contains an array of methods that run sequentially.
  Use this form when your message handler needs branching, subroutines, retries, or
  external HTTP requests.
  """)
model SWMLFullDocument {
  version?: "1.0.0";
  sections: Section;
}

@summary("Light SWML document")
@doc("""
  A single-step SWML document — either a `reply` (send an outbound message) or a `receive`
  (accept the inbound message without replying; can be written as `{ receive: {} }` or as an
  empty `{}` document). Use this form for one-shot handling. For multi-step flows with
  branching, subroutines, or retries, use the full document form instead.
  """)
@oneOf
union SWMLLightDocument {
  Reply,
  LightReceive,
}

@jsonSchema
@summary("Messaging SWML Document")
@oneOf
@doc("""
  A SWML document for handling inbound SMS or MMS messages. Use one of these shapes:
  - **Full document** — a top-level `sections` map for multi-step flows with branching,
    subroutines, retries, and external HTTP requests. Execution starts at `sections.main`.
  - **Light document** — a single top-level `reply` or `receive` for one-shot handling.
    The receive form accepts both `{ receive: {} }` and an empty `{}` document.

  See the [Messaging SWML reference](/docs/swml/reference/messaging) for the full list of
  available methods.
  """)
union SWMLObject {
  SWMLFullDocument,
  SWMLLightDocument,
}
