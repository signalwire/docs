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
using Types.StatusCodes;

@route("/resources/conference_rooms")
namespace FabricAPI.ConferenceRooms {
  @tag(CONFERENCE_ROOM_TAG)
  @friendlyName("Conference Rooms")
  interface ConferenceRooms {
    @summary("List Conference Rooms")
    @doc("""
      Returns a list of conference rooms.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | ConferenceRoomListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get Conference Room")
    @doc("""
      Returns a Conference Room by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...ConferenceRoomPathID):
      | {
          @statusCode statusCode: 200;
          @body conference_room: ConferenceRoomResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create Conference Room")
    @doc("""
      Creates a Conference Room

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
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

    @summary("Update Conference Room")
    @doc("""
      Updates a Conference Room by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
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

    @summary("Delete Conference Room")
    @doc("""
      Deletes a Conference Room by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
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
