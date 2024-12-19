import "@typespec/http";
import "./models/responses.tsp";
import "../../../types";
import "./models/core.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

namespace FabricAPI.Subscribers.Addresses {

    @route("/{id}/addresses")
    @tag("Subscribers")
    @friendlyName("Subscriber Addresses")
    @summary("Subscriber Addresses")
    interface SubscriberAddresses {

        @summary("List Subscriber Addresses")
        list(...SubscriberAddressID): SubscriberAddressesResponse[] |
        StatusCode401 |
        StatusCode404;
    }
}
