// Import necessary modules or types
import "@typespec/http";
import "./models/core.tsp";
import "./subscriber-sip-endpoint";
import "./subscriber-addresses";
import "./subscriber-tokens";
import "./guest-tokens";
import "./invite-tokens";
import "./refresh-tokens";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

// Define the API path for subscribers
@route("/resources/subscribers")
namespace FabricAPI.Subscribers {
    @tag(SUBSCRIBERS_TAG)
    @friendlyName("Subscribers")
    interface Subscribers {
        @summary("List Subscribers")
        @doc("Retrieve a list of all subscribers")
        list():
          SubscriberListResponse |
          StatusCode401 |
          StatusCode404 |
          StatusCode500;

        @summary("Create Subscriber")
        @doc("Create a new Subscriber")
        @post
        create(@body body: SubscriberRequest):
        { @statusCode statusCode: 201; @body subscriber: SubscriberResponse; } |
        StatusCode401 |
        StatusCode404 |
        SubscriberCreateStatusCode422 |
        StatusCode500;

        @summary("Get Subscriber")
        @doc("Fetch an existing Subscriber")
        get(...SubscriberPathID):
        { @statusCode statusCode: 200; @body body: SubscriberResponse; } |
        StatusCode401 |
        StatusCode404 |
        StatusCode500;

        @summary("Update Subscriber")
        @doc("Update an existing Subsriber")
        @put
        update(...SubscriberPathID, ...SubscriberRequest):
        { @statusCode statusCode: 200; @body body: SubscriberResponse; } |
        StatusCode401 |
        StatusCode404 |
        SubscriberUpdateStatusCode422 |
        StatusCode500;

        @summary("Delete Subscriber")
        @doc("Delete an existing Subscriber")
        @delete
        delete(...SubscriberPathID):
        { @statusCode statusCode: 204; } |
        StatusCode401 |
        StatusCode404 |
        StatusCode500;
    }
}