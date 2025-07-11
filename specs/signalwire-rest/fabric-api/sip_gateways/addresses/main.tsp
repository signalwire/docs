import "@typespec/http";
import "@typespec/openapi";
import "../../../types";
import "./models/responses.tsp";
import "./models/requests.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_gateways/{resource_id}/addresses")
namespace FabricAPI.SipGateways.Addresses {
  @tag("SIP Gateway")
  @friendlyName("SIP Gateway")
  interface RelayApplicationAddresses {
    @summary("List Fabric Addresses assigned to a SIP Gateway")
    @doc("Returns a paginated list of Fabric Addresses associated with the specified SIP Gateway.")
    readAddressesByResourceId(...SipGatewayAddressRequest): 
      SipGatewayAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}