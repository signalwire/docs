import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/errors.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/room_sessions")
namespace SignalWireAPI.Video.RoomSessions {
  @tag(ROOM_SESSIONS_TAG)
  @friendlyName("Room Sessions")
  interface RoomSessions {
    @operationId("list_room_sessions")
    @summary("List room sessions")
    @doc("""
      Lists past and in-progress activity sessions created when participants join the project's Video Rooms. Use it for session history and auditing; use [List rooms](/docs/apis/rest/video/rooms/list-rooms) to manage the reusable configurations instead.

      ${tokenPermissions<"_Video_">}
      """)
    list(...ListRoomSessionsRequest):
      | ListRoomSessionsResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("get_room_session")
    @summary("Get room session")
    @doc("""
      Retrieves one past or in-progress Room Session by ID. Use it to inspect the session associated with an event, member, or recording; use [Get room](/docs/apis/rest/video/rooms/get-room) when you need the reusable room configuration rather than an occurrence of activity.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    read(
      ...RoomSessionPathID,
    ): RoomSessionResponse | StatusCode400 | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("list_room_session_recordings")
    @summary("List room session recordings")
    @doc("""
      Lists the recordings created during one Room Session. Returned media links use the requested `media_ttl` lifetime. Use [List room recordings](/docs/apis/rest/video/room-recordings/list-room-recordings) to browse recordings across rooms and sessions.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}/recordings")
    listRecordings(
      ...RoomSessionPathID,
      ...ListRoomSessionRecordingsRequest,
    ):
      | ListRoomSessionRecordingsResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("list_room_session_members")
    @summary("List room session members")
    @doc("""
      Lists the participants associated with one Room Session for attendance and session auditing. Participant controls for a live room belong in the client SDK rather than this read-only history endpoint.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}/members")
    listMembers(
      ...RoomSessionPathID,
      ...ListRoomSessionMembersRequest,
    ):
      | ListRoomSessionMembersResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("list_room_session_events")
    @summary("List room session events")
    @doc("""
      Lists the recorded event timeline for one Room Session. Use it to audit membership and media activity; this endpoint reports history and does not control the active room.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}/events")
    listEvents(
      ...RoomSessionPathID,
      ...ListRoomSessionEventsRequest,
    ):
      | ListRoomSessionEventsResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;
  }
}
