import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/logs")
namespace SignalWireAPI.Fax.Logs {
  @tag(FAX_LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @operationId("list_fax_logs")
    @summary("List fax logs")
    @doc("""
      Lists historical fax activity in the project for delivery review, usage reporting, and troubleshooting. The Fax Logs API is read-only; send or manage faxes through the Compatibility API's [Faxes](/docs/compatibility-api/rest/faxes/send-fax) operations instead.
      
      ${tokenPermissions<"_Fax_">}
      """)
    list(...LogListRequest):
      | LogListResponse
      | StatusCode400
      | StatusCode401
      | FaxLogsListStatusCode422
      | StatusCode500;

    @operationId("get_fax_log")
    @summary("Get fax log")
    @doc("""
      Retrieves one historical fax activity record by log ID for delivery review or troubleshooting. This read-only endpoint cannot send, cancel, or delete the fax; use Compatibility [Retrieve fax](/docs/compatibility-api/rest/faxes/retrieve-fax) for the managed fax resource.
      
      ${tokenPermissions<"_Fax_">}
      """)
    read(...LogPathID):
      | LogResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | FaxLogShowStatusCode422
      | StatusCode500;
  }
}
