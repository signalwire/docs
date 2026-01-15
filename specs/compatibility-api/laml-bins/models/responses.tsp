import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of cXML Bins.")
model LamlBinListResponse {
  @doc("Pagination metadata.")
  meta?: PaginationWithKey;

  @doc("List of cXML bins.")
  laml_bins?: LamlBin[];
}

@doc("Response containing a single cXML Bin.")
model LamlBinResponse {
  ...LamlBin;
}
