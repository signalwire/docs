import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_applications")
namespace FabricAPI.CxmlApplications {
  @tag("cXML Application")
  @friendlyName("cXML Applications")
  interface CxmlApplications {
    @summary("List cXML Applications")
    @doc("A list of cXML Applications")
    list():
      CxmlApplicationListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get cXML Application")
    @doc("Returns an cXML Application by ID")
    read(...CxmlApplicationID): {
        @statusCode statusCode: 200;
        @body cxml_application: CxmlApplicationFabricResource;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create cXML Application")
    @doc("Creates acXML Application")
    @post create(...CxmlApplicationCreateRequest):
      { @statusCode statusCode: 201; @body cxml_application: CxmlApplication; } |
      StatusCode401 |
      StatusCode404 |
      CxmlApplicationCreateStatusCode422;

    @summary("Update cXML Application")
    @doc("Updates a cXML Application by ID")
    @patch update(...CxmlApplicationID, ...CxmlApplicationUpdateRequest): {
      @statusCode statusCode: 200; @body cxml_application: CxmlApplication;
    } |
      StatusCode401 |
      StatusCode404 |
      CxmlApplicationUpdateStatusCode422;

    @summary("Delete cXML Application")
    @doc("Deletes a cXML Application by ID")
    @delete delete(...CxmlApplicationID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}

