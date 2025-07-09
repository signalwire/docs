import "../../../_shared/fabric-address";
import "../../../_shared/enums.tsp";
import "../../../../types";

using Types.StatusCodes;

model SipEndpointAddressListResponse {
  @doc("List of SIP Endpoint Addresses")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "sip-endpoint-address",
      display_name: "SIP Endpoint Address",
      type: DisplayTypes.Subscriber,
      cover_url: "https://example.com/cover.jpg",
      preview_url: "https://example.com/preview.jpg",
      locked: false,
      channel: #{
        audio: "/external/sip_endpoint?channel=audio"
      },
      created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
    }
  ])
  data: FabricAddress[];

  @doc("Pagination links")
  links: SipEndpointAddressPaginationResponse;
}

@example(#{
  self: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50",
  first: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50",
  next: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca",
  prev: "https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca"
})
model SipEndpointAddressPaginationResponse is FabricAddressPaginationResponse {}