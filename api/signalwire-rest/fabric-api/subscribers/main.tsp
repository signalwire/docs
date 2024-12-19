// Import necessary modules or types
import "@typespec/http";
import "./models/core.tsp";
import "./subscriber-sip-endpoint";
import "./subscriber-addresses";
import "./subscriber-tokens";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

// Define the API path for subscribers
@route("/resources/subscribers")
namespace FabricAPI.Subscribers {
    @tag("Subscribers")
    @friendlyName("Subscribers")
    interface Subscribers {
        @summary("List Subscribers")
        list(): Subscriber[];

        @summary("Create Subscriber")
        @post
        create(@body body: SubscriberRequest): 
        { @statusCode statusCode: 201; @body subscriber: SubscriberResponse; } |
        StatusCode401 |
        StatusCode404 |
        SubscriberCreateStatusCode422;

        @summary("Get Subscriber")
        get(...SubscriberPathID): 
        { @statusCode statusCode: 200; @body body: SubscriberResponse; } |
        StatusCode401 |
        StatusCode404;

        @summary("Update Subscriber")
        @put
        update(...SubscriberPathID, ...SubscriberRequest): 
        { @statusCode statusCode: 200; @body body: SubscriberResponse; } |
        StatusCode401 |
        StatusCode404 |
        SubscriberUpdateStatusCode422;

        @summary("Delete Subscriber")
        @delete
        delete(...SubscriberPathID): 
        { @statusCode statusCode: 204; } |
        StatusCode401 |
        StatusCode404;
    }
}