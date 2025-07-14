import "../../../_shared/fabric-address";
import "../../../_shared/enums.tsp";
import "../../../../types";

using Types.StatusCodes;

model SipEndpointAddressListResponse {
  @doc("List of SIP Endpoint Addresses")
  data: FabricAddressCall[];

  @doc("Pagination links")
  links: SipEndpointAddressPaginationResponse;
}

model SipEndpointAddressPaginationResponse {

  @doc("Link of the current page")
  self: url;

  @doc("Link to the first page")
  first: url;

  @doc("Link to the next page")
  next: url;

  @doc("Link to the previous page")
  prev?: url;
}