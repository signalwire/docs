import "../../../_shared/fabric-address";
import "../../../_shared/enums.tsp";
import "../../../../types";

using Types.StatusCodes;

model DialogflowAgentAddressListResponse {
  @doc("List of Dialogflow Agent Addresses")
  data: FabricAddressApp[];

  @doc("Pagination links")
  links: DialogflowAgentAddressPaginationResponse;
}

model DialogflowAgentAddressPaginationResponse {

  @doc("Link of the current page")
  @example("https://example.signalwire.com/api/fabric/resources/dialogflow_agents/3fa85f64-5717-4562-b3fc-2c963f66afa6/addresses?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://example.signalwire.com/api/fabric/resources/dialogflow_agents/3fa85f64-5717-4562-b3fc-2c963f66afa6/addresses?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://example.signalwire.com/api/fabric/resources/dialogflow_agents/3fa85f64-5717-4562-b3fc-2c963f66afa6/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;

  @doc("Link to the previous page")
  @example("https://example.signalwire.com/api/fabric/resources/dialogflow_agents/3fa85f64-5717-4562-b3fc-2c963f66afa6/addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: url;
}