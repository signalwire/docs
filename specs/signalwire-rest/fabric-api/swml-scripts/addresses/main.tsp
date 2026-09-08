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

@route("/resources/swml_scripts/{id}/addresses")
namespace SignalWireAPI.Fabric.SWMLScript.Addresses {
  @tag(SWML_SCRIPTS_TAG)
  interface SWMLScriptAddresses {
    @operationId("list_swml_script_addresses")
    @summary("List SWML Script Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one SWML Script. Use these callable handles to see how calls or messages can reach the stored script; use [List SWML Scripts](/docs/apis/rest/swml-scripts/list-swml-scripts) for the resources themselves, or the SWML Webhook address operation for server-generated SWML handlers.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...SWMLScriptAddressPathID):
      | SWMLScriptAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
