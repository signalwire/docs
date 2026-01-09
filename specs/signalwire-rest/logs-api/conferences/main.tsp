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
    @doc("A list of Conferences.")
    list(): ConferencesResponse | StatusCode401 | StatusCode404;
  }
}
