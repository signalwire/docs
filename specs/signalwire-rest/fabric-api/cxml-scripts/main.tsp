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

@route("/resources/cxml_scripts")
namespace FabricAPI.CXMLScripts {
  @tag("cXML Scripts")
  @friendlyName("cXML Scripts")
  interface CXMLScripts {
    @summary("List cXML Scripts")
    @doc("A list of cXML Scripts")
    list():
      CXMLScriptResponse[] |
      StatusCode401 |
      StatusCode404;

    @summary("Get cXML Script")
    @doc("Returns a cXML Script by ID")
    read(...CXMLScriptPathID):
      { @statusCode statusCode: 200; @body cxml_script: CXMLScriptResponse; } |
      StatusCode401 |
      StatusCode404;

    @summary("Create cXML Script")
    @doc("Creates a cXML Script")
    @post create(@body request: CXMLScriptCreateRequest):
      { @statusCode statusCode: 200; @body cxml_script: CXMLScriptResponse; } |
      StatusCode401 |
      StatusCode404 |
      CXMLScriptCreateStatusCode422;

    @summary("Update cXML Script")
    @doc("Updates a cXML Script by ID")
    @put update(...CXMLScriptPathID, @body request: CXMLScriptUpdateRequest):
      { @statusCode statusCode: 200; @body cxml_script: CXMLScriptResponse; } |
      StatusCode401 |
      StatusCode404 |
      CXMLScriptUpdateStatusCode422;

    @summary("Delete cXML Script")
    @doc("Deletes a cXML Script by ID")
    @delete delete(...CXMLScriptPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}