import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_applications")
namespace FabricAPI.CxmlApplications {
  @tag("cXML Applications")
  @friendlyName("cXML Applications")
  interface CxmlApplications {
    @summary("List cXML Applications")
    @doc("A list of cXML Applications")
    list():
      CxmlApplicationResponse[] |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Get cXML Application")
    @doc("Returns a cXML Application by ID")
    read(...CxmlApplicationPathID):
      { @statusCode statusCode: 200; @body laml_application: CxmlApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;


    @summary("Update cXML Application")
    @doc("Updates a cXML Application by ID")
    @put update(...CxmlApplicationPathID, @body request: CxmlApplicationUpdateRequest):
      { @statusCode statusCode: 200; @body laml_application: CxmlApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      CxmlApplicationUpdateStatusCode422 |
      StatusCode500;

    @summary("Delete LAML Application")
    @doc("Deletes a LAML Application by ID")
    @delete delete(...CxmlApplicationPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
    }
}