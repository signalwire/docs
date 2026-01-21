import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";
import "../../../_shared/auth.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@useAuth(SignalWireBasicAuth)
@route("/conferences")
namespace LogsAPI.Conferences {
  @tag("Conferences")
  @friendlyName("Conferences")
  interface Conferences {
    @operationId("list_conferences")
    @summary("List Conferences")
    @doc("A list of Conferences.")
    list(): ConferencesResponse | StatusCode401 | StatusCode404;
  }
}
