import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_scripts/{id}/addresses")
namespace FabricAPI.CXMLScript.Addresses {
  @tag(CXML_SCRIPTS_TAG)
  interface CXMLScriptAddresses {
    @summary("List cXML Script Addresses")
    @doc("This endpoint returns a list of addresses associated with a specific cXML Script.")
    list(...CXMLScriptAddressPathID):
      | CXMLScriptAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
