import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/recordings")
namespace SpaceAPI.Recordings {
  @tag(RECORDINGS_TAG)
  @friendlyName("Recordings")
  interface Recordings {
    @operationId("Recordings_list")
    @summary("List Relay Recordings")
    @doc("""
      Returns a list of your recordings.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      @query
      @doc("Filter by call SID.")
      call_sid?: string,

      @query
      @doc("Filter by conference SID.")
      conference_sid?: string,

      @query
      @doc("Filter by status.")
      status?: string
    ): RecordingListResponse | StatusCode401 | StatusCode500;

    @operationId("Recordings_get")
    @summary("Get Relay Recording")
    @doc("""
      Retrieves the details of a recording.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    read(...RecordingPathID): RecordingResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("Recordings_delete")
    @summary("Delete Relay Recording")
    @doc("""
      Deletes a recording.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    delete(...RecordingPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
