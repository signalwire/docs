import "./core.tsp";
import "../../_shared/const.tsp";
model CallFlowCreateRequest {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title: string;

  @doc("Call Flow Builder state, stored as an opaque JSON object. Optional but must be paired with `relayml` — provide both fields together or omit both. An empty object counts as omitted, so sending `relayml` with `flow_data: {}` is rejected. When both are omitted, SignalWire creates a starter Call Flow.")
  flow_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The calling SWML document this Call Flow should execute. Uses [calling SWML methods](/docs/swml/reference/calling). Optional but must be paired with a non-empty `flow_data` — provide both fields together or omit both. When both are omitted, SignalWire creates a starter SWML document.")
  @example(SWML_CONTENTS_EXAMPLE)
  relayml?: TypeSpec.Record<unknown>;
}

model CallFlowUpdateRequest {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title?: string;

  @doc("The revision number for this update. Must equal the Call Flow's current `document_version` plus one; any other value is rejected with an `out_of_sync` error.")
  @example(2)
  document_version: int32;

  @doc("Call Flow Builder state, stored as an opaque JSON object. Omit to keep the current value; an empty object is rejected.")
  flow_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The calling SWML document this Call Flow should execute. Uses [calling SWML methods](/docs/swml/reference/calling). Omit to keep the current document.")
  @example(SWML_CONTENTS_EXAMPLE)
  relayml?: TypeSpec.Record<unknown>;
}
