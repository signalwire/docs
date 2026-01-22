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

@route("/rooms")
namespace VideoAPI.Rooms {
  @tag(ROOMS_TAG)
  @friendlyName("Rooms")
  interface Rooms {
    @operationId("create_room")
    @summary("Create a Room")
    @doc("Create a room.\n\n${tokenPermissions<"_Video_">}")
    @post
    create(@body body: CreateRoomRequest): RoomResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("list_rooms")
    @summary("List Rooms")
    @doc("List rooms.\n\n${tokenPermissions<"_Video_">}")
    list(
      @query
      @doc("Specifies whether or not to include information about the room's active session (if any)")
      include_active_session?: boolean
    ): ListRoomsResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("get_room_by_name")
    @summary("Find a Room by Name")
    @doc("Find a room by name.\n\n${tokenPermissions<"_Video_">}")
    @route("/{name}")
    getByName(
      @path
      @doc("Unique name of the room")
      name: string,

      @query
      @doc("Specifies whether or not to include information about the room's active session (if any)")
      include_active_session?: boolean
    ): RoomResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("get_room")
    @summary("Find a Room by ID")
    @doc("Find a room by ID.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}")
    read(
      @path
      @doc("Unique ID of the room")
      id: string
    ): RoomResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_room")
    @summary("Update a Room")
    @doc("Update a room.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}")
    @put
    update(
      @path
      @doc("Unique ID of the room")
      id: string,

      @body body: UpdateRoomRequest
    ): RoomResponse | StatusCode401 | StatusCode404 | VideoStatusCode422 | StatusCode500;

    @operationId("delete_room")
    @summary("Delete a Room")
    @doc("Delete a room.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}")
    @delete
    delete(
      @path
      @doc("Unique ID of the room")
      id: string
    ): {
      @statusCode statusCode: 204;
    } | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
