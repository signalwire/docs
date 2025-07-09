import "../../addresses/models/core.tsp";
import "../../../_shared/fabric-address";
import "../../../../types";

using Types.StatusCodes;

model CallFlowAddressListResponse {
  @doc("List of Call Flow Addresses")
  @example(#[#{
    id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    name: "call-flow-address",
    display_name: "Call Flow Address",
    type: DisplayTypes.App,
    cover_url: "https://example.com/cover.jpg",
    preview_url: "https://example.com/preview.jpg",
    locked: false,
    channel: #{
      audio: "/external/call_flow?channel=audio"
    },
    created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
  }])
  data: FabricAddress[];
  
  @doc("Pagination links")
  links: CallFlowAddressPaginationResponse;
}

@example(#{
  self: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50",
  first: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50",
  next: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=1&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad",
  prev: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad"
})
model CallFlowAddressPaginationResponse is FabricAddressPaginationResponse {}