// Import necessary modules or types
import "@typespec/http";
import "@typespec/openapi";
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
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

// Define the API path for subscribers
@route("/resources/subscribers")
namespace SignalWireAPI.Fabric.Subscribers {
  @tag(SUBSCRIBERS_TAG)
  @friendlyName("Subscribers")
  interface Subscribers {
    @operationId("list_subscribers")
    @summary("List Subscribers")
    @doc("""
      Returns the project's [Subscriber](/docs/platform/subscribers) resources. Use it to inventory known user identities before retrieving, updating, or issuing access for one. Use [Get Subscriber](/docs/apis/rest/subscribers/get-subscriber) when you already have a resource ID; temporary guests use Guest or Invite Tokens rather than full Subscriber resources.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | SubscriberListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_subscriber")
    @summary("Create Subscriber")
    @doc("""
      Creates a [Subscriber](/docs/platform/subscribers) resource for a known user, with sign-in credentials and optional profile fields. Use it when the user needs a persistent identity for Browser SDK or resource access; use [Create Subscriber guest token](/docs/apis/rest/subscribers/tokens/create-subscriber-guest-token) for temporary scoped access without a full account. Issue the new subscriber a client credential through [Create Subscriber token](/docs/apis/rest/subscribers/tokens/create-subscriber-token).

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("get_subscriber")
    @summary("Get Subscriber")
    @doc("""
      Retrieves one [Subscriber](/docs/platform/subscribers) resource by ID. Use it to inspect a known user's profile and resource metadata; use [List Subscribers](/docs/apis/rest/subscribers/list-subscribers) to discover IDs, or the Subscriber Token endpoints to create client access rather than read the profile.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    get(...SubscriberPathID):
      | {
          @statusCode statusCode: 200;
          @body body: SubscriberResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_subscriber")
    @summary("Update Subscriber")
    @doc("""
      Changes the profile or sign-in information for a persistent [Subscriber](/docs/platform/subscribers) identity in the project. Use [Create Subscriber token](/docs/apis/rest/subscribers/tokens/create-subscriber-token) or the refresh operation to manage a client's time-limited access.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("delete_subscriber")
    @summary("Delete Subscriber")
    @doc("""
      Deletes a persistent [Subscriber](/docs/platform/subscribers) resource by ID. Use it when the user identity should no longer exist in the project; temporary Guest and Invite Tokens expire independently and are not deleted through this operation.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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
