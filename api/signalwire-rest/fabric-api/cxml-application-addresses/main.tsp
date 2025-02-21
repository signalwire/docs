import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_applications/{cxml_application_id}/addresses")
namespace FabricAPI.CxmlApplicationAddresses {
  @tag("cXML Application")
  @friendlyName("cXML Applications")
  interface CxmlApplicationAddresses {
    @summary("List cXML Application Addresses")
    @doc("A list of cXML Application Addresses")
    list(...CxmlApplicationIDPath):
      CxmlApplicationAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}

