import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/conference_room/{id}/addresses")
namespace SignalWireAPI.Fabric.ConferenceRoom.Addresses {
  @tag(CONFERENCE_ROOM_TAG)
  interface ConferenceRoomAddresses {
    @operationId("list_conference_room_addresses")
    @summary("List conference room Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one Fabric Conference Room. Use these callable handles to see how calls can reach the programmable room; use [Get conference room](/docs/apis/rest/conference-rooms/get-conference-room) for its video configuration. Managed Video Conferences and SDK-based Video Rooms are not addressed through this endpoint.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...ConferenceRoomAddressPathID):
      | ConferenceRoomAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
