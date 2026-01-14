import "./core.tsp";
import "../../addresses/models/responses.tsp";

using TypeSpec.Http;

@doc("Response containing a list of SIP endpoints.")
model SipEndpointListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of SIP endpoints.")
  data?: SipEndpoint[];
}

@doc("Response containing a single SIP endpoint.")
model SipEndpointResponse {
  ...SipEndpoint;
}
