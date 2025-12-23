import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_applications")
namespace FabricAPI.CxmlApplications {
  @tag(CXML_APPLICATIONS_TAG)
  @friendlyName("cXML Applications")
  interface CxmlApplications {
    @summary("List cXML Applications")
    @doc("""
      A list of cXML Applications

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | CxmlApplicationListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get cXML Application")
    @doc("""
      Returns a cXML Application by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...CxmlApplicationPathID):
      | {
          @statusCode statusCode: 200;
          @body laml_application: CxmlApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Update cXML Application")
    @doc("""
      Updates a cXML Application by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Delete LAML Application")
    @doc("""
      Deletes a LAML Application by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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
