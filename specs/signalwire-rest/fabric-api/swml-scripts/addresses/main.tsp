import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/swml_scripts/{id}/addresses")
namespace FabricAPI.SWMLScript.Addresses {
  @tag(SWML_SCRIPTS_TAG)
  interface SWMLScriptAddresses {
    @summary("List SWML Script Addresses")
    @doc("""
      This endpoints returns a list of addresses associated with a specific SWML script.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...SWMLScriptAddressPathID):
      | SWMLScriptAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
