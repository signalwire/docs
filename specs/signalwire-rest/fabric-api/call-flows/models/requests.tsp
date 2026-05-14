import "./core.tsp";
import "../../_shared/const.tsp";
import "../../../../swml/calling";

model CallFlowCreateRequest {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title: string;

  @doc("Call Flow Builder state, stored as an opaque JSON object. Optional but must be paired with `relayml` — provide both fields together or omit both. When both are omitted, SignalWire creates a starter Call Flow.")
  @example(#{})
  flow_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The calling SWML document this Call Flow should execute. Uses [calling SWML methods](/docs/swml/reference/calling). Optional but must be paired with `flow_data` — provide both fields together or omit both. When both are omitted, SignalWire creates a starter SWML document.")
  @example(SWML_CONTENTS_EXAMPLE)
  relayml?: SWML.Calling.SWMLObject;
}

model CallFlowUpdateRequest {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title?: string;

  @doc("The current revision of the call flow. Must equal the call flow's existing `document_version + 1`.")
  @example(2)
  document_version: int32;

  @doc("Call Flow Builder state, stored as an opaque JSON object.")
  @example(#{})
  flow_data: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The calling SWML document this Call Flow should execute. Uses [calling SWML methods](/docs/swml/reference/calling).")
  @example(SWML_CONTENTS_EXAMPLE)
  relayml: SWML.Calling.SWMLObject;
}
