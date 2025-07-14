import "../../_shared/enums.tsp";
import "../../_shared/const.tsp";
import "../../_shared/fabric-address";

model AIAgentResponse {
  @doc("Unique ID of the AIAgent.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  @format("uuid")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("99151cf8-9548-4860-ba70-a8de824f3312")
  @format("uuid")
  project_id: uuid;

  @doc("Display name of the AIAgent Fabric Resource")
  @example("Booking Assistant")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example(FabricResponseType.AiAgent)
  type: FabricResponseType.AiAgent;

  @doc("Date and time when the resource was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;

  @doc("AIAgent data.")
  ai_agent: AIAgentWithID;
}

model AIAgentListResponse {
  data: AIAgentResponse[];
  links: AIAgentPaginationResponse;
}

model AIAgentPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/ai_agents?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/ai_agents?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/ai_agents?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;

  @doc("Link to the previous page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/ai_agents?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: url;
}
