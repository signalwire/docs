import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/conference_rooms")
namespace FabricAPI.ConferenceRooms {
  @tag("Conference Rooms")
  @friendlyName("Conference Rooms")
  interface ConferenceRooms {
    @summary("List Conference Rooms")
    @doc("Returns a list of conference rooms.")
    list():
      ConferenceRoomResponse[] |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Get Conference Room")
    @doc("Returns a Conference Room by ID")
    read(...ConferenceRoomPathID):
      { @statusCode statusCode: 200; @body conference_room: ConferenceRoomResponse; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Create Conference Room")
    @doc("Creates a Conference Room")
    @post create(@body request: ConferenceRoomCreateRequest):
      { @statusCode statusCode: 200; @body conference_room: ConferenceRoomResponse; } |
      StatusCode401 |
      StatusCode404 |
      ConferenceRoomCreateStatusCode422 |
      StatusCode500;

    @summary("Update Conference Room")
    @doc("Updates a Conference Room by ID")
    @put update(...ConferenceRoomPathID, @body request: ConferenceRoomUpdateRequest):
      { @statusCode statusCode: 200; @body conference_room: ConferenceRoomResponse; } |
      StatusCode401 |
      StatusCode404 |
      ConferenceRoomUpdateStatusCode422 |
      StatusCode500;

    @summary("Delete Conference Room")
    @doc("Deletes a Conference Room by ID")
    @delete delete(...ConferenceRoomPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
    }
}