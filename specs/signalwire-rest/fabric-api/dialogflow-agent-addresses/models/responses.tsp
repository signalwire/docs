import "../../../types/status-codes";
import "../../addresses/models/core.tsp";
import "../../enums.tsp";
import "../../../types";

using Types.StatusCodes;

model DialogflowAgentAddressListResponse {
  @doc("List of Dialogflow Agent Addresses")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "dialogflow-agent-address",
      display_name: "Dialogflow Agent Address",
      type: DisplayTypes.App,
      cover_url: "https://example.com/cover.jpg",
      preview_url: "https://example.com/preview.jpg",
      locked: false,
      channel: #{
        audio: "/external/dialogflow_agent?channel=audio"
      },
      created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
    }
  ])
  data: FabricAddress[];

  @doc("Pagination links")
  links: DialogflowAgentAddressPaginationResponse;
}

model DialogflowAgentAddressPaginationResponse {
  @doc("Link of the current page")
  @format("uri")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_size=50")
  self: string;

  @doc("Link to the first page")
  @format("uri")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_size=50")
  first: string;

  @doc("Link to the next page")
  @format("uri")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=1&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad")
  next: string;

  @doc("Link to the previous page")
  @format("uri")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad")
  prev?: string;
}