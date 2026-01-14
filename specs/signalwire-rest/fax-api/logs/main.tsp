import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/logs")
namespace FaxAPI.Logs {
  @tag(LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @operationId("list_fax_logs")
    @summary("List Logs")
    @doc("""
      List the available logs.
      
      #### Permissions 
      
      The API token must include the following scopes: _Fax_.
      """)
    list(...LogListRequest):
      | LogListResponse
      | StatusCode401
      | FaxLogsListStatusCode422
      | StatusCode500;

    @operationId("get_fax_log")
    @summary("Find a Log by ID")
    @doc("""
      Find a log by ID.
      
      #### Permissions
      
      The API token must include the following scopes: _Fax_.
      """)
    read(...LogPathID):
      | LogResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
