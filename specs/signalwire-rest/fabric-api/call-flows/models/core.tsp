import "../../../types";
import "../../_shared/const.tsp";

using TypeSpec.Http;

model CallFlowPathID {
  @doc("Unique ID of a Call Flow.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid
}

model CallFlowID {
  @doc("Unique ID of a Call Flow.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid
}

model CallFlow {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title: string;

  @doc("Call flow data as JSON string")
  @example("{}")
  flow_data?: string;

  @doc("A SWML document. For more information on SWML, please go to https://developer.signalwire.com/swml")
  @example(SWML_EXAMPLE)
  relayml?: string;

  @doc("The current revision of the call flow. Every update must increase this number.")
  @example(1)
  document_version?: int32;
}

model CallFlowWithID {
  ...CallFlowID,
  ...CallFlow
}