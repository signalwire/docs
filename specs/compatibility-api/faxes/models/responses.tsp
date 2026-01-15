import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Meta information for fax list response.")
model FaxMeta {
  ...Pagination;

  @doc("The name of the object.")
  @example("faxes")
  key?: string;
}

@doc("Response containing a list of faxes.")
model FaxListResponse {
  @doc("Pagination and metadata information.")
  meta?: FaxMeta;

  @doc("List of faxes.")
  faxes?: Fax[];
}

@doc("Response containing a single fax.")
model FaxResponse {
  ...Fax;
}

@doc("Response containing a list of fax media.")
model FaxMediaListResponse {
  ...Pagination;

  @doc("List of media.")
  media?: FaxMedia[];
}

@doc("Response containing a single fax media.")
model FaxMediaResponse {
  ...FaxMedia;
}
