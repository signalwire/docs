import "@typespec/http";
import "../../../_globally_shared/log-list-query.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Fax;


@doc("Query parameters for listing fax logs.")
model LogListRequest {
  @doc("Include logs for deleted activity.")
  @example(false)
  @query
  include_deleted?: boolean = false;

  ...LogListQuery;
}
