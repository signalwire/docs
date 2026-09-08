import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/logs")
namespace SignalWireAPI.Video.Logs {
  @tag(VIDEO_LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @operationId("list_logs")
    @summary("List video logs")
    @doc("""
      Lists historical Video API activity in the project for usage review and troubleshooting. This collection does not manage live Rooms or Conferences; use [Get video log](/docs/apis/rest/video-logs/get-log) when you already have a log ID.

      ${tokenPermissions<"_Video_">}
      """)
    list(...ListLogsRequest):
      | ListLogsResponse
      | StatusCode400
      | StatusCode401
      | StatusCode403
      | VideoStatusCode422
      | StatusCode500;

    @operationId("get_log")
    @summary("Get video log")
    @doc("""
      Retrieves one historical Video API activity log by ID. Use it to inspect a record selected from [List video logs](/docs/apis/rest/video-logs/list-logs); this read-only endpoint reports past activity and does not control a live Room or Conference.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    read(
      ...LogPathID,
    ):
      | LogResponse
      | StatusCode400
      | StatusCode401
      | StatusCode403
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;
  }
}
