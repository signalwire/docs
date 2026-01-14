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

    @operationId("retrieve_a_call")
    @summary("Retrieve a Call")
    @doc("""
      Retrieve a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...CallsAccountSidPath, ...CallSidPath): CallResponse | StatusCode401 | StatusCode404;

    @operationId("update_a_call")
    @summary("Update a Call")
    @doc("""
      Update a call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{Sid}")
    update(...CallsAccountSidPath, ...CallSidPath, @body body: UpdateCallRequest): CallResponse | StatusCode401 | StatusCode404;

    @operationId("delete_a_call")
    @summary("Delete a Call")
    @doc("""
      Delete a call record from your account. If the delete is successful, a 204 response, with no body, will be returned.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...CallsAccountSidPath, ...CallSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }

  @tag(CALL_RECORDINGS_TAG)
  @friendlyName("Call Recordings")
  @route("/{CallSid}/Recordings")
  interface CallRecordings {
    @operationId("create_recording")
    @summary("Create a Recording.")
    @doc("""
      Create a recording.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(...CallsAccountSidPath, ...CallSidPathForRecording, @body body: CreateCallRecordingRequest): CallRecordingResponse | StatusCode401 | StatusCode400;

    @operationId("update_recording")
    @summary("Update a Recording")
    @doc("""
      Pause, resume or stop a Recording. You can control what happens while recording is paused (replace pause with silence or skip it).

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{Sid}")
    update(...CallsAccountSidPath, ...CallSidPathForRecording, ...CallSidPath, @body body: UpdateCallRecordingRequest): CallRecordingResponse | StatusCode401 | StatusCode404;
  }

  @tag(CALL_STREAMS_TAG)
  @friendlyName("Call Streams")
  @route("/{CallSid}/Streams")
  interface CallStreams {
    @operationId("create_stream")
    @summary("Create a Stream.")
    @doc("""
      Create a stream.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(...CallsAccountSidPath, ...CallSidPathForRecording, @body body: CreateCallStreamRequest): CallStreamResponse | StatusCode401 | StatusCode400;

    @operationId("update_stream")
    @summary("Stop a Stream")
    @doc("""
      Stop a Stream.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{Sid}")
    update(...CallsAccountSidPath, ...CallSidPathForRecording, ...CallSidPath, @body body: UpdateCallStreamRequest): CallStreamResponse | StatusCode401 | StatusCode404;
  }
}
