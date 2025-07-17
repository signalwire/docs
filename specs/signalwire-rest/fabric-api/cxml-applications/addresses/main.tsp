import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_applications/{id}/addresses")
namespace FabricAPI.CxmlApplication.Addresses {
  @tag(CXML_APPLICATIONS_TAG)
  interface CxmlApplicationAddresses {
    @summary("List cXML Application Addresses")
    @doc("This endpoint returns a list of addresses associated with a specific LaML Application.")
    list(...CxmlApplicationAddressPathID):
      | CxmlApplicationAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
