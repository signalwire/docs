import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "../calls/models/requests.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace CompatibilityAPI.Webhooks {
  @route("/Webhooks/RecordingStatus")
  @tag(WEBHOOKS_TAG)
  @friendlyName("Recording Status Callback")
  interface RecordingStatusCallback {
    @operationId("recording_status_callback")
    @summary("Recording status callback")
    @doc("""
      SignalWire sends this webhook to your RecordingStatusCallback URL when recording status events occur.
      Configure the callback URL when creating a call (Create a Call), or when using Dial, Conference, or Record.
      Use RecordingStatusCallbackEvent to request one or more of: in-progress, completed, absent. Default is completed.
    """)
    @post
    @extension("x-fern-webhook", true)
    receive(@body body: RecordingStatusCallbackPayload): void;
  }

  @route("/Webhooks/InboundCallStatus")
  @tag(WEBHOOKS_TAG)
  @friendlyName("Inbound Call Status Callback")
  interface InboundCallStatusCallback {
    @operationId("inbound_call_status_callback")
    @summary("Inbound call status callback")
    @doc("""
      SignalWire sends this webhook for inbound calls to a phone number when the call is completed or failed.
      Enable it at the phone number level: Phone Numbers tab → select the number → Phone Number Settings.
      Suited for tracking inbound calls, success rate, call quality, and total calls in a call center.
    """)
    @post
    @extension("x-fern-webhook", true)
    receive(@body body: InboundCallStatusCallbackPayload): void;
  }
}
