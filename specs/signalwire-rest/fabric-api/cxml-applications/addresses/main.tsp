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

@route("/resources/cxml_applications/{id}/addresses")
namespace SignalWireAPI.Fabric.CxmlApplication.Addresses {
  @tag(CXML_APPLICATIONS_TAG)
  interface CxmlApplicationAddresses {
    @operationId("list_cxml_application_addresses")
    @summary("List cXML application Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one cXML Application. Use these callable handles to see how calls or messages can reach its configured cXML handlers; use [List cXML applications](/docs/apis/rest/cxml-applications/list-cxml-applications) for the resources themselves, or the cXML Webhook address operation for an individual server-backed handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...CxmlApplicationAddressPathID):
      | CxmlApplicationAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
