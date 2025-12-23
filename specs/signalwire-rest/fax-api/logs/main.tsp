import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/logs")
namespace FaxAPI.Logs {
  @tag(LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @summary("List Logs")
    @doc("""
      List the available logs.
      
      #### Permissions 
      
      The API token used to authenticate must have the following scopes enabled to make a successful request: _Fax_.
      
      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...LogListRequest):
      | LogListResponse
      | StatusCode401
      | FaxLogsListStatusCode422
      | StatusCode500;

    @summary("Find a Log by ID")
    @doc("""
      Find a log by ID.
      
      #### Permissions
      
      The API token used to authenticate must have the following scopes enabled to make a successful request: _Fax_.
      
      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...LogPathID):
      | LogResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
