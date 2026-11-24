import "@typespec/http";
import "../../../_globally_shared/log-list-query.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Logs;


@doc("Query parameters for listing conference logs.")
model ConferenceLogListRequest {
  @doc("Include logs for deleted activity.")
  @example(false)
  @query
  include_deleted?: boolean = false;

  ...LogListQuery;
}
