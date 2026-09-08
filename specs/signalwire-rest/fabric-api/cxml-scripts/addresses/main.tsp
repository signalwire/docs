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

@route("/resources/cxml_scripts/{id}/addresses")
namespace SignalWireAPI.Fabric.CXMLScript.Addresses {
  @tag(CXML_SCRIPTS_TAG)
  interface CXMLScriptAddresses {
    @operationId("list_cxml_script_addresses")
    @summary("List cXML Script Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one cXML Script. Use these callable handles to see how calls or messages can reach the stored cXML; use [List cXML Scripts](/docs/apis/rest/cxml-scripts/list-cxml-scripts) for the resources themselves, or the cXML Webhook address operation for server-generated cXML handlers.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...CXMLScriptAddressPathID):
      | CXMLScriptAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
