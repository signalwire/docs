import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/conference_room/{id}/addresses")
namespace FabricAPI.ConferenceRoom.Addresses {
  @tag("Conference Rooms")
  interface ConferenceRoomAddresses {
    @summary("List Conference Room Addresses")
    @doc("This endpoint returns a list of addresses associated with a specific Conference Room.")
    list(...ConferenceRoomAddressPathID):
      ConferenceRoomAddressListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
  }
}