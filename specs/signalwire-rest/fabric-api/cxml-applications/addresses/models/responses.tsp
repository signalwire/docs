import "../../../_shared/fabric-address";
import "../../../_shared/enums.tsp";
import "../../../../types";

using Types.StatusCodes;

model CxmlApplicationAddressListResponse {
  @doc("List of Cxml Application Addresses")
  data: FabricAddress[];

  @doc("Pagination links")
  links: CxmlApplicationAddressPaginationResponse;
}

model CxmlApplicationAddressPaginationResponse {

  @doc("Self link for the current page")
  @example("https://example.signalwire.com/api/fabric/resources/laml_applications/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50")
  self: string;

  @doc("Link to the first page of results")
  @example("https://example.signalwire.com/api/fabric/resources/laml_applications/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50")
  first: string;

  @doc("Link to the next page of results")
  @example("https://example.signalwire.com/api/fabric/resources/laml_applications/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: string;

  @doc("Link to the previous page of results")
  @example("https://example.signalwire.com/api/fabric/resources/laml_applications/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: string;
}