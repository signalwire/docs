import "../../../types";
import "../../_shared/const.tsp";
import "../../../../swml/calling";

using TypeSpec.Http;

model CallFlowPathID {
  @doc("Unique ID of a Call Flow.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

model CallFlow {
  @doc("Unique ID of a Call Flow.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: uuid;

  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title: string;

  @doc("Call Flow Builder state, stored as an opaque JSON object. Produced and consumed by the SignalWire Call Flow Builder UI; not used by SWML execution.")
  @example(#{})
  flow_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The calling SWML document this Call Flow executes. Uses [calling SWML methods](/docs/swml/reference/calling).")
  @example(SWML_CONTENTS_EXAMPLE)
  relayml?: SWML.Calling.SWMLObject;

  @doc("The current revision of the call flow. Every update must increase this number.")
  @example(1)
  document_version?: int32;
}
