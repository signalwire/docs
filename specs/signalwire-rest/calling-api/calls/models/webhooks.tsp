import "../../../../_shared/webhook/decorator.tsp";
import "../../../types";

namespace SignalWireAPI.Calling;

@summary("Transcribe status callback")
@doc("""
  Payload sent to the `status_url` each time a background transcription changes state:
  once when transcription starts (`transcribing`) and once when it ends (`finished`).
  The same payload shape is used for the SWML [`transcribe`](/docs/swml/reference/calling/transcribe)
  method's `status_url` and the REST `calling.transcribe` command.

  The `finished` event additionally carries `duration`, `size`, `start_time`, and `end_time`.
  """)
model TranscribeStatusCallbackPayload {
  @doc("The event type. Always `calling.call.transcribe`.")
  @example("calling.call.transcribe")
  event_type: string;

  @doc("The event channel, including the session ID.")
  @example("swml:00000000-0000-0000-0000-000000000000")
  event_channel?: string;

  @doc("Unix timestamp (seconds) when the event was generated.")
  @example(1640000000.123)
  timestamp?: float;

  @doc("The project ID associated with the call.")
  project_id?: uuid;

  @doc("The Space ID associated with the call.")
  space_id?: uuid;

  @doc("Transcription details.")
  params: {
    @doc("The call ID.")
    call_id?: uuid;

    @doc("The node handling the call.")
    node_id?: uuid;

    @doc("Identifier of this transcription.")
    @example("transcribe-control-1")
    control_id?: string;

    @doc("Transcription state: `transcribing` when it starts, `finished` when it ends.")
    @example("finished")
    state: "transcribing" | "finished";

    @doc("URL where the call recording is hosted.")
    url?: url;

    @doc("Identifier of the call recording.")
    recording_id?: string;

    @doc("The callback URL the event was delivered to.")
    status_url?: url;

    @doc("Length of the recording in seconds. Present when `state` is `finished`.")
    @example(42.5)
    duration?: float;

    @doc("Size of the recording in bytes. Present when `state` is `finished`.")
    @example(680000)
    size?: int64;

    @doc("Unix timestamp when the recording started. Present when `state` is `finished`.")
    start_time?: float;

    @doc("Unix timestamp when the recording ended. Present when `state` is `finished`.")
    end_time?: float;
  };
}
