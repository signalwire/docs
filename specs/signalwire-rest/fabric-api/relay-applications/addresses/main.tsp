import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/relay_applications/{id}/addresses")
namespace FabricAPI.RelayApplication.Addresses {
  @tag(RELAY_APPLICATION_TAG)
  interface RelayApplicationAddresses {
    @operationId("list_relay_application_addresses")
    @summary("List Relay Application Addresses")
    @doc("This endpoint returns a paginated list of addresses associated with a Relay Application.")
    list(...RelayApplicationAddressPathID):
      | RelayApplicationAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
