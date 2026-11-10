import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/tokens")
namespace SignalWireAPI.Chat.Tokens {
  @tag(CHAT_TOKENS_TAG)
  @friendlyName("Tokens")
  interface ChatTokens {
    @operationId("create_chat_token")
    @summary("Create chat token")
    @doc("""
      Creates a time-limited Chat Token that a client consumes to access the Chat channels and permissions supplied in the request. Call this operation from your server when granting Chat access to a member; choose a lifetime from 1 minute through 30 days and never expose the project API token used to create it. Use [Create PubSub token](/docs/apis/rest/pubsub/create-token) for PubSub channels or [Create API token](/docs/apis/rest/project-tokens/create-token) for server-side REST authentication.
      
      ${tokenPermissions<"_Chat_">}
      """)
    create(...NewChatToken):
      | {
          @statusCode statusCode: 200;
          @body body: ChatToken;
        }
      | StatusCode400
      | StatusCode401
      | ChatToken422Error;
  }
}
