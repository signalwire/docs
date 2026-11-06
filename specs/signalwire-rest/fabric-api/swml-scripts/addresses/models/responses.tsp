import "../../../_shared/fabric-address";
import "../../../_shared/enums.tsp";
import "../../../../types";

model SWMLScriptAddressListResponse {
  @doc("An array of objects that contain a list of SWML Script Addresses")
  data: FabricAddressApp[];

  @doc("Object containing pagination links")
  links: SWMLScriptAddressPaginationResponse;
}

model SWMLScriptAddressPaginationResponse {
  @doc("Link of the current page")
  @example("https://example.signalwire.com/api/fabric/resources/swml_scripts/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&type=swml_script")
  self: url;

  @doc("Link of the first page")
  @example("https://example.signalwire.com/api/fabric/resources/swml_scripts/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_size=50&type=swml_script")
  first: url;

  @doc("Link of the next page")
  @example("https://example.signalwire.com/api/fabric/resources/swml_scripts/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=1&page_size=50&page_token=PA6581c1fa-d985-4c8f-b53e-2fee11b579ad&type=swml_script")
  next?: url;

  @doc("Link of the previous page")
  @example("https://example.signalwire.com/api/fabric/resources/swml_scripts/016e5773-c197-4446-bcc2-9c48f14e2d0a/addresses?page_number=0&page_size=50&page_token=PB6581c1fa-d985-4c8f-b53e-2fee11b579ad&type=swml_script")
  prev?: url;
}
