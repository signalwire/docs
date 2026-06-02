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
  event_channel: string;

  @doc("Unix timestamp (seconds) when the event was generated.")
  @example(1640000000.123)
  timestamp: float;

  @doc("The project ID associated with the call.")
  @example("a1b2c3d4-e5f6-7890-abcd-ef1234567890")
  project_id: uuid;

  @doc("The Space ID associated with the call.")
  @example("b2c3d4e5-f6a7-8901-bcde-f12345678901")
  space_id: uuid;

  @doc("Transcription details.")
  params: {
    @doc("The call ID.")
    @example("c3d4e5f6-a7b8-9012-cdef-234567890123")
    call_id: uuid;

    @doc("The node handling the call.")
    @example("d4e5f6a7-b8c9-0123-def4-34567890abcd")
    node_id: uuid;

    @doc("Identifier of this transcription.")
    @example("transcribe-control-1")
    control_id: string;

    @doc("Transcription state: `transcribing` when it starts, `finished` when it ends.")
    @example("finished")
    state: "transcribing" | "finished";

    @doc("URL where the recording is hosted. Present once available.")
    @example("https://example.com/recordings/c3d4e5f6-a7b8-9012-cdef-234567890123.wav")
    url?: url;

    @doc("ID of the recording. Present once available.")
    @example("e5f6a7b8-c9d0-1234-ef56-4567890abcde")
    recording_id?: string;

    @doc("The callback URL the event was delivered to. Present when a `status_url` was set.")
    @example("https://example.com/transcribe-status")
    status_url?: url;

    @doc("Length of the recording in seconds. Present when `state` is `finished`.")
    @example(42.5)
    duration?: float;

    @doc("Size of the recording in bytes. Present when `state` is `finished`.")
    @example(680000)
    size?: int64;

    @doc("Unix timestamp when the recording started. Present when `state` is `finished`.")
    @example(1640000000.123)
    start_time?: float;

    @doc("Unix timestamp when the recording ended. Present when `state` is `finished`.")
    @example(1640000042.623)
    end_time?: float;
  };
}
