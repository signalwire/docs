import "../../../_shared/fabric-address";
import "../../../../types";

using Types.StatusCodes;

model ResourceAddressListResponse {
  @doc("List of Resource Addresses")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "relay-application-address",
      display_name: "Resource Address",
      type: DisplayTypes.App,
      cover_url: "https://example.com/cover.jpg",
      preview_url: "https://example.com/preview.jpg",
      locked: false,
      channel: #{
        audio: "/external/relay_application?channel=audio"
      },
      created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
    }
  ])
  data: FabricAddress[];
  
  @doc("Pagination links")
  links: ResourceAddressPaginationResponse;
}

@example(#{
  self: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50",
  first: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50",
  next: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca",
  prev: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca"
})
model ResourceAddressPaginationResponse is FabricAddressPaginationResponse {}