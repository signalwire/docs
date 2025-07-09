import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/conference_room/{id}/addresses")
namespace FabricAPI.ConferenceRoomAddresses {
  @tag("Conference Rooms")
  interface ConferenceRoomAddresses {
    @summary("List Conference Room Addresses")
    @doc("A list of Conference Room Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...ConferenceRoomAddressPathID):
      ConferenceRoomAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}