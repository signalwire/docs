import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_scripts/{id}/addresses")
namespace FabricAPI.CXMLScriptAddresses {
  @tag("cXML Scripts")
  interface CXMLScriptAddresses {
    @summary("List cXML Script Addresses")
    @doc("A list of cXML Script Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...CXMLScriptAddressPathID):
      CXMLScriptAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}