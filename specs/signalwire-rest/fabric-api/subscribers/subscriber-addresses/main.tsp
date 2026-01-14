import "@typespec/http";
import "@typespec/openapi";
import "./models/responses.tsp";
import "../../../types";
import "./models/core.tsp";
import "../../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

namespace FabricAPI.Subscribers.Addresses {
  @route("/{id}/addresses")
  @tag(SUBSCRIBERS_TAG)
  @friendlyName("Subscriber Addresses")
  @summary("Subscriber Addresses")
  interface SubscriberAddresses {
    @operationId("list_subscriber_addresses")
    @summary("List Subscriber Addresses")
    @doc("List Subscriber Addresses")
    list(...SubscriberAddressID):
      | SubscriberAddressesResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
