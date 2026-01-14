import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/swml_scripts/{id}/addresses")
namespace FabricAPI.SWMLScript.Addresses {
  @tag(SWML_SCRIPTS_TAG)
  interface SWMLScriptAddresses {
    @operationId("list_swml_script_addresses")
    @summary("List SWML Script Addresses")
    @doc("This endpoints returns a list of addresses associated with a specific SWML script.")
    list(...SWMLScriptAddressPathID):
      | SWMLScriptAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
