import "@typespec/http";
import "./models/responses.tsp";
import "../../../types";
import "./models/core.tsp";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

namespace FabricAPI.Subscribers.Addresses {
  @route("/{id}/addresses")
  @tag(SUBSCRIBERS_TAG)
  @friendlyName("Subscriber Addresses")
  @summary("Subscriber Addresses")
  interface SubscriberAddresses {
    @summary("List Subscriber Addresses")
    @doc("""
      List Subscriber Addresses

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...SubscriberAddressID):
      | SubscriberAddressesResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
