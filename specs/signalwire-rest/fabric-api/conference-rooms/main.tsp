import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/conference_rooms")
namespace SignalWireAPI.Fabric.ConferenceRooms {
  @tag(CONFERENCE_ROOM_TAG)
  @friendlyName("Conference Rooms")
  interface ConferenceRooms {
    @operationId("list_conference_rooms")
    @summary("List conference rooms")
    @doc("""
      Returns the project's Fabric Conference Room resources. Use it to discover programmable video rooms that can be reached through resource addresses and used in call routing. Use [Video Conferences](/docs/apis/rest/video/video-conferences/list-video-conferences) for managed conferences with hosted guest and moderator access, or [Video Rooms](/docs/apis/rest/video/rooms/list-rooms) for SDK-based room configurations.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | ConferenceRoomListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_conference_room")
    @summary("Get conference room")
    @doc("""
      Retrieves one Fabric Conference Room by resource ID so you can inspect how the addressable room is configured. Use [List conference rooms](/docs/apis/rest/conference-rooms/list-conference-rooms) to discover IDs, or [Get video conference](/docs/apis/rest/video/video-conferences/get-video-conference) for a managed hosted conference.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...ConferenceRoomPathID):
      | {
          @statusCode statusCode: 200;
          @body conference_room: ConferenceRoomResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_conference_room")
    @summary("Create conference room")
    @doc("""
      Creates a Fabric Conference Room resource that can be reached through resource addresses and used in call routing. Use it for a programmable, addressable video room; use [Create video conference](/docs/apis/rest/video/video-conferences/create-video-conference) for a managed hosted conference, or [Create room](/docs/apis/rest/video/rooms/create-room) for an SDK-based Video Room configuration.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("update_conference_room")
    @summary("Update conference room")
    @doc("""
      Changes how a Fabric Conference Room schedules and runs sessions while preserving the same addressable project resource. Managed Video Conferences and SDK-based Video Rooms have separate update operations.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("delete_conference_room")
    @summary("Delete conference room")
    @doc("""
      Deletes a Fabric Conference Room resource by ID so it can no longer be reached through its resource addresses. This does not delete a managed [Video Conference](/docs/apis/rest/video/video-conferences/delete-video-conference) or an SDK-based [Video Room](/docs/apis/rest/video/rooms/delete-room).
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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
