import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../room-sessions/models.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/room_recordings")
@tag(ROOM_RECORDINGS_TAG)
namespace VideoAPI.RoomRecordings {
  @get
  @operationId("list_room_recordings")
  @summary("List Room Recordings")
  @doc("A list of all Room Recordings.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listRoomRecordings(
    @query
    @doc("Generated media links will be valid for this many seconds. Default is 900 (15 minutes).")
    @example(900)
    media_ttl?: int32
  ): ListRoomRecordingsResponse | VideoError;
}

@route("/room_recordings/{id}")
@tag(ROOM_RECORDINGS_TAG)
namespace VideoAPI.RoomRecordingsById {
  @get
  @operationId("get_room_recording")
  @summary("Find a Room Recording by ID")
  @doc("A detailed summary of a particular Room Recording.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getRoomRecording(
    @path
    @doc("ID of room recording to return")
    id: string,

    @query
    @doc("Generated media links will be valid for this many seconds. Default is 900 (15 minutes).")
    @example(900)
    media_ttl?: int32
  ): RoomRecordingResponse | VideoError;

  @delete
  @operationId("delete_room_recording")
  @summary("Delete a Room Recording.")
  @doc("Delete a Room Recording.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op deleteRoomRecording(
    @path
    @doc("ID of room recording to return")
    id: string
  ): {
    @statusCode statusCode: 204;
  } | VideoError;
}
