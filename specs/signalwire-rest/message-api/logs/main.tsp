import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/logs")
namespace SignalWireAPI.Message.Logs {
  @tag(MESSAGE_LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @operationId("list_message_logs")
    @summary("List message logs")
    @doc("""
      Lists historical messaging activity in the project for delivery review, auditing, and troubleshooting. This collection is read-only; send or redact messages through the [Messages API](/docs/apis/rest/messages/create-message) instead.

      ${tokenPermissions<"_Messaging_">}
      """)
    list(...LogListRequest):
      | LogListResponse
      | StatusCode400
      | StatusCode401
      | MessageLogsListStatusCode422
      | StatusCode500;

    @operationId("get_message_log")
    @summary("Get message log")
    @doc("""
      Retrieves one historical messaging record by log ID. Use it to inspect delivery details for a known message segment; this read-only endpoint does not send, retry, or redact the message. Use [List message logs](/docs/apis/rest/message-logs/list-message-logs) to discover log IDs or [Send a message](/docs/apis/rest/messages/create-message) for live messaging.

      ${tokenPermissions<"_Messaging_">}
      """)
    retrieve(...LogPathID):
      | LogRetrieveResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | MessageLogShowStatusCode422
      | StatusCode500;
  }
}
