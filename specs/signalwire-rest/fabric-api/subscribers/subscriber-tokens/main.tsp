import "@typespec/http";
import "../../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/subscribers/tokens")
namespace FabricAPI.SubscriberTokens {
  @tag(SUBSCRIBERS_TAG)
  interface SubscriberTokens {
    @summary("Create Subscriber Token")
    @doc("""
      Create a Subscriber Token

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    create(...SubscriberTokenRequest):
      | SubscriberTokenResponse
      | StatusCode401
      | StatusCode404
      | SubscriberTokenStatusCode422
      | StatusCode500;
  }
}
