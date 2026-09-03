import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/recordings")
namespace SignalWireAPI.RelayRest.Recordings {
  @tag(RECORDINGS_TAG)
  @friendlyName("Recordings")
  interface Recordings {
    @operationId("list_call_recordings")
    @summary("List recordings")
    @doc("""
      Returns the project's voice call recordings for later review or cleanup. Use it to browse recordings across calls; use [Get recording](/docs/apis/rest/recordings/get-call-recording) when you already have the recording ID. Compatibility [Recordings](/docs/compatibility-api/rest/recordings/list-recordings) include per-call creation and management, while [Room Recordings](/docs/apis/rest/video/room-recordings/list-room-recordings) contain video-room media.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list():
      | RecordingListResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("get_call_recording")
    @summary("Get recording")
    @doc("""
      Retrieves one voice call recording by ID. Use it after listing recordings or when a call event saved the recording identifier. Use Compatibility [Retrieve recording](/docs/compatibility-api/rest/recordings/retrieve-recording) for SID-based recording routes, or [Get room recording](/docs/apis/rest/video/room-recordings/get-room-recording) for video-room media.
      
      ${tokenPermissions<"_Voice_">}
      """)
    read(...RecordingPathID):
      | RecordingResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_call_recording")
    @summary("Delete recording")
    @doc("""
      Permanently deletes one voice call recording by ID. Use it to remove voice media that is no longer needed; Compatibility call recordings and Video Room recordings have separate delete operations on their respective API surfaces.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    delete(...RecordingPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }
}
