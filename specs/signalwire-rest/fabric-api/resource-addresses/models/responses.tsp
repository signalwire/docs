import "../../../types/status-codes";
import "../../addresses/models/core.tsp";
import "../../enums.tsp";
import "../../../types";

using Types.StatusCodes;

model ResourceAddressListResponse {
  @doc("List of Resource Addresses")
  data: FabricAddress[];
  
  @doc("Pagination links")
  links: ResourceAddressPaginationResponse;
}

model ResourceAddressPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=1&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad")
  next?: url;

  @doc("Link to the previous page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad")
  prev?: url;
}