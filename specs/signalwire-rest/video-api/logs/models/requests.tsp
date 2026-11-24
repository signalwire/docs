import "@typespec/http";
import "../../../_globally_shared/log-list-query.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Video;


@doc("Query parameters for listing logs.")
model ListLogsRequest {
  @query
  @doc("Include logs for deleted activity.")
  @example(false)
  include_deleted?: boolean = false;

  ...LogListQuery;
}
