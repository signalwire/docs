import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@useAuth(BasicAuth)
@route("/conferences")
namespace LogsAPI.Conferences {
  @tag("Conferences")
  @friendlyName("Conferences")
  interface Conferences {
    @summary("List Conferences")
    @doc("""
      A list of Conferences.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_ or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(): ConferencesResponse | StatusCode401 | StatusCode404;
  }
}
