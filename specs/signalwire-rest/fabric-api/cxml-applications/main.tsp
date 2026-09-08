import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/cxml_applications")
namespace SignalWireAPI.Fabric.CxmlApplications {
  @tag(CXML_APPLICATIONS_TAG)
  @friendlyName("cXML Applications")
  interface CxmlApplications {
    @operationId("list_cxml_applications")
    @summary("List cXML applications")
    @doc("""
      Lists the project's addressable cXML Applications, which provide reusable voice and messaging routing. These are the same applications exposed by the Compatibility API's [Applications](/docs/compatibility-api/rest/applications/list-applications), which is also where new ones are created. Use [cXML Webhooks](/docs/apis/rest/cxml-webhook/list-cxml-webhooks) when your server supplies cXML for each request.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | CxmlApplicationListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_cxml_application")
    @summary("Get cXML application")
    @doc("""
      Retrieves one cXML Application resource by ID so you can inspect its voice and messaging routing. Use [List cXML applications](/docs/apis/rest/cxml-applications/list-cxml-applications) to discover IDs, or Compatibility [Get application](/docs/compatibility-api/rest/applications/get-application) when your integration holds an Application SID.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...CxmlApplicationPathID):
      | {
          @statusCode statusCode: 200;
          @body laml_application: CxmlApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_cxml_application")
    @summary("Update cXML application")
    @doc("""
      Changes where a cXML Application sends voice and messaging requests and callbacks. Compatibility [Update application](/docs/compatibility-api/rest/applications/update-application) manages the same application by Application SID; use whichever identifier your integration holds.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(
      ...CxmlApplicationPathID,
      @body request: CxmlApplicationUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body laml_application: CxmlApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | CxmlApplicationUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_cxml_application")
    @summary("Delete cXML application")
    @doc("""
      Deletes a cXML Application by resource ID, removing its addresses and the corresponding Compatibility API [Application](/docs/compatibility-api/rest/applications/list-applications) as well. An individual cXML Webhook is a separate resource with its own delete operation.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...CxmlApplicationPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
