import "@typespec/http";
import "@typespec/openapi";
import "./models/responses.tsp";
import "../../../types";
import "./models/core.tsp";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

namespace SignalWireAPI.Fabric.Subscribers.Addresses {
  @route("/{id}/addresses")
  @tag(SUBSCRIBERS_TAG)
  @friendlyName("Subscriber Addresses")
  @summary("Subscriber Addresses")
  interface SubscriberAddresses {
    @operationId("list_subscriber_addresses")
    @summary("List Subscriber Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one [Subscriber](/docs/platform/subscribers). Use these callable handles to see how calls or messages can reach that subscriber; use [Get Subscriber](/docs/apis/rest/subscribers/get-subscriber) for profile data, or the SAT-authenticated [List Resource Addresses from a Client](/docs/apis/rest/addresses/list-resource-addresses-client) when a subscriber client is discovering addresses it can reach.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...SubscriberAddressID):
      | SubscriberAddressesResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
