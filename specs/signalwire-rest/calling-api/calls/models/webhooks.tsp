import "../../../../_shared/webhook/decorator.tsp";
import "../../../types";

namespace SignalWireAPI.Calling;

@summary("Transcript status callback")
@doc("""
  Posted to the `transcribe` `status_url` when the call's transcription finishes.
  On success the `event_type` is `calling.transcript.completed` and `params.text` carries
  the transcribed text. If transcription fails the `event_type` is `calling.transcript.failed`.
  SWML transcription is centered on the transcript, not on a recording —
  the recording is only the underlying mechanism.
  """)
model TranscribeStatusCallbackPayload {
  @doc("The event type. `calling.transcript.completed` on success, `calling.transcript.failed` on failure.")
  @example("calling.transcript.completed")
  event_type: "calling.transcript.completed" | "calling.transcript.failed";

  @doc("Unix timestamp (seconds) when the event was generated.")
  @example(1777565701.5623918)
  timestamp: float;

  @doc("The project ID associated with the call.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id: uuid;

  @doc("The Space ID associated with the call.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id: uuid;

  @doc("Transcript details.")
  params: {
    @doc("ID of the transcript.")
    @example("0ec5a4da-46b9-4d2c-b724-151add8d4d08")
    id: uuid;

    @doc("The call ID.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: uuid;

    @doc("The segment ID for the call leg.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    segment_id: uuid;

    @doc("The transcribed text of the call.")
    @example("A long time ago in a galaxy far, far away, Luke, I am your father. Do or do not, there is no try. May the force be with you. These aren't the droids you're looking for. I find your lack of faith disturbing. The force will be with you always.")
    text: string;
  };
}
