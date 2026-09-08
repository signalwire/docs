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
namespace SignalWireAPI.Voice.Logs {
  @tag(VOICE_LOGS_TAG)
  @friendlyName("Logs")
  interface Logs {
    @operationId("list_voice_logs")
    @summary("List voice logs")
    @doc("""
      Lists historical voice activity in the project across supported call types. Use it for usage reporting, billing review, and troubleshooting, not live call control. Place or control calls through [Send call commands](/docs/apis/rest/calls/call-commands) or the Compatibility Calls API instead.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(...LogListRequest):
      | LogListResponse
      | StatusCode400
      | StatusCode401
      | VoiceLogsListStatusCode422
      | StatusCode500;

    @operationId("get_voice_log")
    @summary("Get voice log")
    @doc("""
      Retrieves one historical voice activity record by log ID for reporting or troubleshooting a known call segment. This read-only endpoint does not retrieve or control a live call; use [Send call commands](/docs/apis/rest/calls/call-commands) for live control.
      
      ${tokenPermissions<"_Voice_">}
      """)
    retrieve(...LogPathID):
      | LogRetrieveResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode422
      | StatusCode500;

    @operationId("list_voice_log_events")
    @summary("List voice log events")
    @doc("""
      Returns the recorded event timeline for one historical voice log. Use it to troubleshoot the sequence of events for a known call segment; use [Get voice log](/docs/apis/rest/voice-logs/get-voice-log) for the log summary. This endpoint reports history and does not subscribe to or control live call events.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{id}/events")
    listEvents(...LogPathID):
      | LogEventsListResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode422
      | StatusCode500;
  }
}
