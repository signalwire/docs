import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Calls")
namespace CompatibilityAPI.Calls {
  @tag(CALLS_TAG)
  @friendlyName("Calls")
  interface Calls {
    @operationId("list_all_calls")
    @summary("List all Calls")
    @doc("""
      List all calls.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      ...CallsAccountSidPath,
      @query @doc("The time, in RFC 2822 GMT format, on which the call was terminated.") EndTime?: string,
      @query("EndTime<") @doc("The time before which the call was terminated.") EndTimeBefore?: string,
      @query("EndTime>") @doc("The time after which the call was terminated.") EndTimeAfter?: string,
      @query @doc("The address that initiated the call.") @example("+13103384645") From?: string,
      @query @doc("The unique identifier for the call that created this call.") @format("uuid") ParentCallSid?: string,
      @query @doc("The time, in RFC 2822 GMT format, on which the call began.") StartTime?: string,
      @query("StartTime<") @doc("The time before which the call began.") StartTimeBefore?: string,
      @query("StartTime>") @doc("The time after which the call began.") StartTimeAfter?: string,
      @query @doc("The status of the call.") Status?: "queued" | "ringing" | "in-progress" | "canceled" | "completed" | "busy" | "failed",
      @query @doc("The address that received the call.") @example("+13105678901") To?: string,
    ): CallListResponse | StatusCode401;

    @operationId("create_a_call")
    @summary("Create a Call")
    @doc("""
      Create a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(...CallsAccountSidPath, @body body: CreateCallRequest): CallResponse | StatusCode401 | StatusCode400;

    @operationId("get_call")
    @summary("Retrieve a Call")
    @doc("""
      Retrieve a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...CallsAccountSidPath, ...CallSidPath): CallResponse | StatusCode401 | StatusCode404;

    @operationId("update_call")
    @summary("Update a Call")
    @doc("""
      Update a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{Sid}")
    update(...CallsAccountSidPath, ...CallSidPath, @body body: UpdateCallRequest): CallResponse | StatusCode401 | StatusCode404;
  }

  @tag(CALL_RECORDINGS_TAG)
  @friendlyName("Call Recordings")
  @route("/{CallSid}/Recordings")
  interface CallRecordings {
    @operationId("list_call_recordings")
    @summary("List Call Recordings")
    @doc("""
      List all recordings for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(...CallsAccountSidPath, ...CallSidPathForRecording): CallRecordingListResponse | StatusCode401;

    @operationId("create_call_recording")
    @summary("Create a Call Recording")
    @doc("""
      Create a recording for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(...CallsAccountSidPath, ...CallSidPathForRecording): CallRecordingResponse | StatusCode401 | StatusCode400;

    @operationId("get_call_recording")
    @summary("Retrieve a Call Recording")
    @doc("""
      Retrieve a recording for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...CallsAccountSidPath, ...CallSidPathForRecording, ...CallSidPath): CallRecordingResponse | StatusCode401 | StatusCode404;

    @operationId("delete_call_recording")
    @summary("Delete a Call Recording")
    @doc("""
      Delete a recording for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...CallsAccountSidPath, ...CallSidPathForRecording, ...CallSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }

  @tag(CALL_STREAMS_TAG)
  @friendlyName("Call Streams")
  @route("/{CallSid}/Streams")
  interface CallStreams {
    @operationId("list_call_streams")
    @summary("List Call Streams")
    @doc("""
      List all streams for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(...CallsAccountSidPath, ...CallSidPathForRecording): CallStreamListResponse | StatusCode401;

    @operationId("create_call_stream")
    @summary("Create a Call Stream")
    @doc("""
      Create a stream for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(...CallsAccountSidPath, ...CallSidPathForRecording, @body body: CreateCallStreamRequest): CallStreamResponse | StatusCode401 | StatusCode400;

    @operationId("get_call_stream")
    @summary("Retrieve a Call Stream")
    @doc("""
      Retrieve a stream for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...CallsAccountSidPath, ...CallSidPathForRecording, ...CallSidPath): CallStreamResponse | StatusCode401 | StatusCode404;

    @operationId("delete_call_stream")
    @summary("Delete a Call Stream")
    @doc("""
      Delete a stream for a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...CallsAccountSidPath, ...CallSidPathForRecording, ...CallSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}
