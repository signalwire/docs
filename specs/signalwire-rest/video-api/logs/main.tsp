import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/logs")
@tag(LOGS_TAG)
namespace VideoAPI.Logs {
  @get
  @operationId("list_logs")
  @summary("List Logs")
  @doc("List the available logs.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listLogs(
    @query
    @doc("Include logs for deleted activity.")
    @example(false)
    include_deleted?: boolean,

    @query
    @doc("Return logs for activity prior to this date.")
    @example("2022-04-30")
    created_before?: string,

    @query
    @doc("Return logs for activity on this date.")
    @example("2022-04-30")
    created_on?: string,

    @query
    @doc("Return logs for activity after this date.")
    @example("2022-04-30")
    created_after?: string,

    @query
    @doc("Specify the number of results to return on a single page. The default page size is `50` and the maximum is `1000`.")
    @example(20)
    page_size?: int32
  ): ListLogsResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
}

@route("/logs/{id}")
@tag(LOGS_TAG)
namespace VideoAPI.LogsById {
  @get
  @operationId("get_log")
  @summary("Find a Log by ID")
  @doc("Find a log by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getLog(
    @path
    @doc("Unique ID of the log")
    id: string
  ): LogResponse | StatusCode401 | StatusCode404 | StatusCode500;
}
