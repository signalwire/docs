import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/tokens")
namespace SignalWireAPI.PubSub.Tokens {
  @tag(PUBSUB_TOKENS_TAG)
  @friendlyName("Tokens")
  interface PubSubTokens {
    @summary("Create PubSub token")
    @doc("""
      Creates a time-limited PubSub Token that a client consumes to read from or publish to the channels allowed in the request. Call this operation from your server when granting PubSub access to a client; choose a lifetime from 1 minute through 30 days and never expose the project API token used to create it. Use [Create chat token](/docs/apis/rest/chat-tokens/create-chat-token) for Chat channels or [Create API token](/docs/apis/rest/project-tokens/create-token) for server-side REST authentication.
      
      ${tokenPermissions<"_PubSub_">}
      """)
    @post
    @operationId("create_token")
    create(...NewPubSubToken):
      | {
          @statusCode statusCode: 200;
          @body body: PubSubToken;
        }
      | StatusCode400
      | StatusCode401
      | PubSubToken422Error
      | StatusCode500;
  }
}
