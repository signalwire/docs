import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "../room-sessions/models/core.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/room_recordings")
namespace SignalWireAPI.Video.RoomRecordings {
  @tag(ROOM_RECORDINGS_TAG)
  @friendlyName("Room Recordings")
  interface RoomRecordings {
    @operationId("list_room_recordings")
    @summary("List room recordings")
    @doc("""
      Lists recordings produced by the project's Video Rooms across sessions. Returned media links use the requested `media_ttl` lifetime. Use [List room session recordings](/docs/apis/rest/video/room-sessions/list-room-session-recordings) when you already know the Room Session.

      ${tokenPermissions<"_Video_">}
      """)
    list(...ListRoomRecordingsRequest):
      | ListRoomRecordingsResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("get_room_recording")
    @summary("Get room recording")
    @doc("""
      Retrieves one Video Room recording by ID and returns a media link with the requested lifetime. Use it when you saved a recording ID or selected one from a recording list; voice-call recordings are available through the [Recordings API](/docs/apis/rest/recordings/list-call-recordings) instead.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    read(
      ...RoomRecordingPathID,

      @query
      @doc("Generated media links will be valid for this many seconds. Default is 900 (15 minutes).")
      @minValue(0)
      @example(900)
      media_ttl?: int32,
    ):
      | RoomRecordingResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;

    @operationId("delete_room_recording")
    @summary("Delete room recording")
    @doc("""
      Permanently deletes one Video Room recording by ID. Use it to remove recorded room media that is no longer needed; this operation does not delete the Room or its Room Session history.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    @delete
    delete(
      ...RoomRecordingPathID,
    ):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;

    @operationId("list_room_recording_events")
    @summary("List room recording events")
    @doc("""
      Lists the event timeline for one Video Room recording. Use it to audit the recording lifecycle; use [List room session events](/docs/apis/rest/video/room-sessions/list-room-session-events) for the wider session timeline.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}/events")
    listEvents(
      ...RoomRecordingPathID,
      ...ListRoomRecordingEventsRequest,
    ):
      | ListRoomRecordingEventsResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;
  }
}
