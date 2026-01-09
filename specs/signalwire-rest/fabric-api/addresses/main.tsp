import "@typespec/http";
import "@typespec/openapi";
import "../_shared/fabric-address";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@useAuth(BearerAuth)
@route("/addresses")
namespace FabricAPI.FabricAddresses {
  @tag(FABRIC_ADDRESS_TAG)
  @friendlyName("Fabric Address")
  interface FabricAddresses {
    @summary("List Fabric Addresses")
    @doc("""
      A list of Fabric Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be
      generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).
      """)
    list():
      | FabricAddressesResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get Fabric Address")
    @doc("""
      Returns a Fabric Address by ID. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be
      generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).
      """)
    read(...FabricAddressID):
      | {
          @statusCode statusCode: 200;
          @body fabric_address: FabricAddress;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
