import "@typespec/http";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

namespace VoiceAPI {
  @tag(LOGS_TAG)
  @route("/logs")
  namespace Logs {
    @doc("""
      List the available logs.
      
      #### Permissions
      
      The API token must include the following scopes: _Voice_.
      """)
    @summary("List Logs")
    @get
    op list(...LogListRequest):
      | LogListResponse
      | StatusCode401
      | VoiceLogsListStatusCode422
      | StatusCode500;

    @doc("""
      Find a log by ID.
      
      #### Permissions
      
      The API token must include the following scopes: _Voice_.
      """)
    @summary("Find a Log by ID")
    @get
    op retrieve(
      @path
      @doc("""
        Unique ID of the log. This is the segment_id you can find in Relay call details in your Dashboard UI or in return objects when using the SDK.
        """)
      id: uuid,
    ): LogRetrieveResponse | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
