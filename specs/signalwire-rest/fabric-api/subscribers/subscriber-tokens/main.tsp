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
    @doc("Create a Subscriber Token")
    create(...SubscriberTokenRequest):
      SubscriberTokenResponse |
      StatusCode401 |
      StatusCode404 |
      SubscriberTokenStatusCode422 |
      StatusCode500;
  }
}
