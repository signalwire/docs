import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/room_sessions")
namespace VideoAPI.RoomSessions {
  @tag(ROOM_SESSIONS_TAG)
  @friendlyName("Room Sessions")
  interface RoomSessions {
    @operationId("list_room_sessions")
    @summary("List Room Sessions")
    @doc("A list of past and in-progress Room Sessions.\n\n${tokenPermissions<"_Video_">}")
    list(
      @query
      @doc("Return Sessions started from this Room.")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      room_id?: string,

      @query
      @doc("Return Sessions with a matching room name.")
      @example("my_example_room")
      room_name?: string,

      @query
      @doc("Return Sessions currently in this state. Possible values are: completed and in-progress.")
      @example("completed")
      status?: string,
    ):
      | ListRoomSessionsResponse
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("get_room_session")
    @summary("Find a Room Session by ID")
    @doc("Find a Room Session by ID.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}")
    read(
      @path
      @doc("Unique ID of the Room Session")
      id: string,
    ): RoomSessionResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("list_room_session_recordings")
    @summary("List a Room Session's Recordings")
    @doc("A list of Room Recordings for a particular Room Session.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}/recordings")
    listRecordings(
      @path
      @doc("Unique ID of the Room Session")
      id: string,

      @query
      @doc("Generated media links will be valid for this many seconds. Default is 900 (15 minutes).")
      @example(900)
      media_ttl?: int32,
    ):
      | ListRoomSessionRecordingsResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("list_room_session_members")
    @summary("List a Room Session's Members")
    @doc("A list of Members for a particular Room Session.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}/members")
    listMembers(
      @path
      @doc("Unique ID of the Room Session")
      id: string,
    ):
      | ListRoomSessionMembersResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
