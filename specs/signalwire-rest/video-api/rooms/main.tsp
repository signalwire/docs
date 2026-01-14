import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "../_shared/models.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/rooms")
@tag(ROOMS_TAG)
namespace VideoAPI.Rooms {
  @post
  @operationId("create_room")
  @summary("Create a Room")
  @doc("Create a room.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op createRoom(@body body: CreateRoomRequest): RoomResponse | VideoError;

  @get
  @operationId("list_rooms")
  @summary("List Rooms")
  @doc("List rooms.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listRooms(
    @query
    @doc("Specifies whether or not to include information about the room's active session (if any)")
    include_active_session?: boolean
  ): ListRoomsResponse | VideoError;

  @route("/{name}")
  @get
  @operationId("get_room_by_name")
  @summary("Find a Room by Name")
  @doc("Find a room by name.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getRoomByName(
    @path
    @doc("Unique name of the room")
    name: string,

    @query
    @doc("Specifies whether or not to include information about the room's active session (if any)")
    include_active_session?: boolean
  ): RoomResponse | VideoError;
}

@route("/rooms/{id}")
@tag(ROOMS_TAG)
namespace VideoAPI.RoomsById {
  @get
  @operationId("get_room")
  @summary("Find a Room by ID")
  @doc("Find a room by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getRoom(
    @path
    @doc("Unique ID of the room")
    id: string
  ): RoomResponse | VideoError;

  @put
  @operationId("update_room")
  @summary("Update a Room")
  @doc("Update a room.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op updateRoom(
    @path
    @doc("Unique ID of the room")
    id: string,

    @body body: UpdateRoomRequest
  ): RoomResponse | VideoError;

  @delete
  @operationId("delete_room")
  @summary("Delete a Room")
  @doc("Delete a room.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op deleteRoom(
    @path
    @doc("Unique ID of the room")
    id: string
  ): {
    @statusCode statusCode: 204;
  } | VideoError;
}
