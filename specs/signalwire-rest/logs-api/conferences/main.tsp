import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../../../_shared/auth.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@useAuth(SignalWireBasicAuth)
@route("/conferences")
namespace SignalWireAPI.Logs.Conferences {
  @tag(CONFERENCE_LOGS_TAG)
  @friendlyName("Conferences")
  interface Conferences {
    @operationId("list_conferences")
    @summary("List conference logs")
    @doc("""
      Lists historical voice conferences and Video Room or Conference sessions across the project. Use it for usage reporting and auditing across conference types, not for live control. Use Compatibility [Conferences](/docs/compatibility-api/rest/conferences/list-all-conferences) to inspect or control live voice conferences, or [Video Conferences](/docs/apis/rest/video/video-conferences/list-video-conferences) to manage hosted video conference configurations.
      
      ${tokenPermissions<"_Voice_ or _Video_">}
      """)
    list(...ConferenceLogListRequest):
      | ConferencesResponse
      | StatusCode401
      | ConferenceLogsStatusCode422
      | StatusCode500;
  }
}
