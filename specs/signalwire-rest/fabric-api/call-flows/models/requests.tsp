import "./core.tsp";

model CallFlowCreateRequest {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title: string;

  @doc("Call flow data as JSON string")
  @example("{}")
  flow_data?: string;

  @doc("A SWML document. For more information on SWML, please go to https://developer.signalwire.com/swml")
  @example("{}")
  relayml?: string;

  @doc("The current revision of the call flow. Every update must increase this number.")
  @example(1)
  document_version?: int32;
}

model CallFlowUpdateRequest {
  @doc("The name of the Call Flow")
  @example("Booking Assistant")
  title?: string;

  @doc("Call flow data as JSON string")
  @example("{}")
  flow_data?: string;

  @doc("A SWML document. For more information on SWML, please go to https://developer.signalwire.com/swml")
  @example("{}")
  relayml?: string;

  @doc("The current revision of the call flow. Every update must increase this number.")
  @example(1)
  document_version?: int32;
}