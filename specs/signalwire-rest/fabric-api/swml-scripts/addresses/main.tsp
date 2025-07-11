import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/swml_scripts/{id}/addresses")
namespace FabricAPI.SWMLScriptAddresses {
  @tag("SWML Scripts")
  interface SWMLScriptAddresses {
    @summary("List SWML Script Addresses")
    @doc("A list of SWML Script Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...SWMLScriptAddressPathID):
      SWMLScriptAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}