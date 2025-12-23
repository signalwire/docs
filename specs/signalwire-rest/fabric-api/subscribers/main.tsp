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
    @doc("""
      Retrieve a list of all subscribers

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | SubscriberListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create Subscriber")
    @doc("""
      Create a new Subscriber

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(@body body: SubscriberRequest):
      | {
          @statusCode statusCode: 201;
          @body subscriber: SubscriberResponse;
        }
      | StatusCode401
      | StatusCode404
      | SubscriberCreateStatusCode422
      | StatusCode500;

    @summary("Get Subscriber")
    @doc("""
      Fetch an existing Subscriber

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    get(...SubscriberPathID):
      | {
          @statusCode statusCode: 200;
          @body body: SubscriberResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Update Subscriber")
    @doc("""
      Update an existing Subsriber

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @put
    update(...SubscriberPathID, ...SubscriberRequest):
      | {
          @statusCode statusCode: 200;
          @body body: SubscriberResponse;
        }
      | StatusCode401
      | StatusCode404
      | SubscriberUpdateStatusCode422
      | StatusCode500;

    @summary("Delete Subscriber")
    @doc("""
      Delete an existing Subscriber

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...SubscriberPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
