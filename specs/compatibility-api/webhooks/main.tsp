import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models.tsp";

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

  @route("/Webhooks/TenDlcStatus")
  @tag(WEBHOOKS_TAG)
  @friendlyName("10DLC Status Callback")
  interface TenDlcStatusCallback {
    @operationId("ten_dlc_status_callback")
    @summary("10DLC status callback")
    @doc("""
      SignalWire sends this webhook when the state of a 10DLC registration object changes.
      Use it to monitor the lifecycle of messaging brands, campaigns, number assignment orders,
      and number assignments in real time.
    """)
    @post
    @extension("x-fern-webhook", true)
    receive(@body body: TenDlcStatusCallbackPayload): void;
  }

  @route("/Webhooks/SmsStatus")
  @tag(WEBHOOKS_TAG)
  @friendlyName("SMS Status Callback")
  interface SmsStatusCallback {
    @operationId("sms_status_callback")
    @summary("SMS status callback")
    @doc("""
      SignalWire sends this webhook when the status of an SMS/MMS message changes.
      Configure it by setting the StatusCallback parameter when sending an outgoing message.
      Use it to track message delivery, failures, and inbound message processing.
    """)
    @post
    @extension("x-fern-webhook", true)
    receive(@body body: SmsStatusCallbackPayload): void;
  }

  @route("/Webhooks/TranscriptionStatus")
  @tag(WEBHOOKS_TAG)
  @friendlyName("Transcription Status Callback")
  interface TranscriptionStatusCallback {
    @operationId("transcription_status_callback")
    @summary("Transcription status callback")
    @doc("""
      SignalWire sends this webhook when the status of a transcription changes.
      Configure it by enabling transcription on a recording (transcribe=true) and setting transcribeCallback
      to your webhook URL.
    """)
    @post
    @extension("x-fern-webhook", true)
    receive(@body body: TranscriptionStatusCallbackPayload): void;
  }

  @route("/Webhooks/VoiceStatus")
  @tag(WEBHOOKS_TAG)
  @friendlyName("Voice Status Callback")
  interface VoiceStatusCallback {
    @operationId("voice_status_callback")
    @summary("Voice status callback")
    @doc("""
      SignalWire sends this webhook when the status of a call changes and you have configured StatusCallback
      and (optionally) StatusCallbackEvent. Use it to monitor call lifecycle, quality metrics, and associated recordings.
    """)
    @post
    @extension("x-fern-webhook", true)
    receive(@body body: VoiceStatusCallbackPayload): void;
  }
}
