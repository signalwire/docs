import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/conference_rooms")
namespace FabricAPI.ConferenceRooms {
  @tag(CONFERENCE_ROOM_TAG)
  @friendlyName("Conference Rooms")
  interface ConferenceRooms {
    @operationId("list_conference_rooms")
    @summary("List Conference Rooms")
    @doc("Returns a list of conference rooms.")
    list():
      | ConferenceRoomListResponse
      | StatusCode401
      | StatusCode404
          | StatusCode500;

        @operationId("get_conference_room")
        @summary("Get Conference Room")
        @doc("Returns a Conference Room by ID")
        read(...ConferenceRoomPathID):
      | {
          @statusCode statusCode: 200;
          @body conference_room: ConferenceRoomResponse;
        }
      | StatusCode401
      | StatusCode404
          | StatusCode500;

        @operationId("create_conference_room")
        @summary("Create Conference Room")
        @doc("Creates a Conference Room")
        @post
        create(@body request: ConferenceRoomCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body conference_room: ConferenceRoomResponse;
        }
      | StatusCode401
      | StatusCode404
      | ConferenceRoomCreateStatusCode422
          | StatusCode500;

        @operationId("update_conference_room")
        @summary("Update Conference Room")
        @doc("Updates a Conference Room by ID")
        @put
        update(
      ...ConferenceRoomPathID,
      @body request: ConferenceRoomUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body conference_room: ConferenceRoomResponse;
        }
      | StatusCode401
      | StatusCode404
      | ConferenceRoomUpdateStatusCode422
          | StatusCode500;

        @operationId("delete_conference_room")
        @summary("Delete Conference Room")
        @doc("Deletes a Conference Room by ID")
        @delete
        delete(...ConferenceRoomPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
