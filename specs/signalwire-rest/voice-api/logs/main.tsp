import "@typespec/http";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/logs")
namespace VoiceAPI.Logs {
  @tag(VOICE_LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @summary("List Logs")
    @doc("""
      List the available logs.
      
      #### Permissions
      
      The API token must include the following scopes: _Voice_.
      """)
    list(...LogListRequest):
      | LogListResponse
      | StatusCode401
      | VoiceLogsListStatusCode422
      | StatusCode500;

    @summary("Find a Log by ID")
    @doc("""
      Find a log by ID.

      #### Permissions

      The API token must include the following scopes: _Voice_.
      """)
    retrieve(...LogPathID):
      | LogRetrieveResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("List Log Events")
    @doc("""
      List all events for a specific log.

      #### Permissions

      The API token must include the following scopes: _Voice_.
      """)
    @route("/{id}/events")
    listEvents(...LogPathID):
      | LogEventsListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
