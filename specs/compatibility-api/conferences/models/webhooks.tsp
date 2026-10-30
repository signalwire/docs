// One payload covers every conference status event. Which fields are present
// depends on the event, so the per-event fields are optional and each one's
// @doc names the events that carry it. Boolean fields are form-encoded as the
// strings "true" and "false"; `Muted` and `Hold` are also sent on
// conference-level events, with no value, so their enums include "".
// `participant-call-quality` is built separately and carries only the common
// fields, `CallSid`, and the audio statistics.
model ConferenceStatusCallbackPayload {
  @doc("The unique ID of the project the conference belongs to.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

  @doc("The unique identifier for the conference.")
  @example("b3877c40-da60-4998-90ad-b792e984cf01")
  ConferenceSid: string;

  @doc("""
    The name of the conference, as given in the `<Conference>` noun.
    Not sent on `participant-speech-start`, `participant-speech-stop`, or `participant-call-quality`.
    """)
  @example("Room 1234")
  FriendlyName?: string;

  @doc("""
    The event that triggered this request.
    - `conference-start`: the conference started.
    - `conference-end`: the conference ended.
    - `participant-join`: a participant joined.
    - `participant-leave`: a participant left.
    - `participant-mute` / `participant-unmute`: a participant was muted or unmuted.
    - `participant-hold` / `participant-unhold`: a participant was put on hold or taken off hold.
    - `participant-speech-start` / `participant-speech-stop`: a participant started or stopped speaking.
    - `participant-call-quality`: audio quality statistics for a participant who joined with `emitCallQuality="true"`, sent when that participant leaves.
    """)
  @example("participant-join")
  StatusCallbackEvent:
    | "conference-start"
    | "conference-end"
    | "participant-join"
    | "participant-leave"
    | "participant-mute"
    | "participant-unmute"
    | "participant-hold"
    | "participant-unhold"
    | "participant-speech-start"
    | "participant-speech-stop"
    | "participant-call-quality";

  @doc("The timestamp, in RFC 2822 format, of when SignalWire processed the event.")
  @example("Thu, 04 Apr 2024 18:32:15 +0000")
  Timestamp: string;

  @doc("""
    The unique identifier of the participant's call.
    Sent on every event; on `conference-start` and `conference-end` it has no value.
    """)
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  CallSid: string;

  @doc("""
    Whether the participant is muted, as the string `true` or `false`.
    Not sent on `participant-call-quality`; on `conference-start` and `conference-end` it has no value.
    """)
  @example("false")
  Muted?: "true" | "false" | "";

  @doc("""
    Whether the participant is on hold, as the string `true` or `false`.
    Not sent on `participant-call-quality`; on `conference-start` and `conference-end` it has no value.
    """)
  @example("false")
  Hold?: "true" | "false" | "";

  @doc("""
    Whether the conference ends when this participant leaves, as the string `true` or `false`.
    Set by the participant's `endConferenceOnExit` attribute. Not sent on `conference-start`, `conference-end`, or `participant-call-quality`.
    """)
  @example("false")
  EndConferenceOnExit?: "true" | "false";

  @doc("""
    Whether the conference starts when this participant joins, as the string `true` or `false`.
    Set by the participant's `startConferenceOnEnter` attribute. Not sent on `conference-start`, `conference-end`, or `participant-call-quality`.
    """)
  @example("true")
  StartConferenceOnEnter?: "true" | "false";

  @doc("""
    Whether the participant is coaching another call, as the string `true` or `false`.
    Sent on every participant event except `participant-call-quality`, whether or not the participant joined with the `coach` attribute.
    """)
  @example("false")
  Coaching?: "true" | "false";

  @doc("""
    The unique identifier of the call this participant is coaching.
    Sent on every participant event except `participant-call-quality`; it has no value when the participant is not coaching.
    """)
  @example("")
  CallSidToCoach?: string;

  @doc("""
    Why the conference ended. Sent on `conference-end` only.
    - `last-participant-left`: the last participant left.
    - `last-participant-kicked`: the last participant was removed from the conference.
    - `participant-with-end-conference-on-exit-left`: a participant with `endConferenceOnExit` set to `true` left.
    - `participant-with-end-conference-on-exit-kicked`: a participant with `endConferenceOnExit` set to `true` was removed from the conference.
    - `conference-ended-via-api`: the conference was ended by setting its `Status` to `completed` through the REST API.
    - `down`: SignalWire ended the conference after a service interruption.
    - `stale`: SignalWire closed a conference that was still open but no longer active.

    The value can be empty when no reason was recorded.
    """)
  @example("last-participant-left")
  ReasonConferenceEnded?: string;

  @doc("""
    The unique identifier of the call whose departure ended the conference. Sent on `conference-end` only.
    It has no value when the conference was not ended by a participant leaving or being removed.
    """)
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  CallSidEndingConference?: string;

  // The audio statistics below are sent on `participant-call-quality` only, and
  // each one only when a value was measured.

  @doc("The participant's average audio round-trip time, in seconds. Sent on `participant-call-quality` only.")
  @example(0.05)
  AudioRttAvg?: float64;

  @doc("The participant's minimum audio round-trip time, in seconds. Sent on `participant-call-quality` only.")
  @example(0.03)
  AudioRttMin?: float64;

  @doc("The participant's maximum audio round-trip time, in seconds. Sent on `participant-call-quality` only.")
  @example(0.12)
  AudioRttMax?: float64;

  @doc("The average jitter of the audio stream SignalWire sends to the participant. Measured in RTP timestamp units, not milliseconds: divide by the codec's samples per millisecond (8 for PCMU and PCMA, 48 for Opus) to convert. Sent on `participant-call-quality` only.")
  @example(10)
  AudioOutJitterAvg?: int32;

  @doc("The minimum jitter of the audio stream SignalWire sends to the participant. Measured in RTP timestamp units, not milliseconds: divide by the codec's samples per millisecond (8 for PCMU and PCMA, 48 for Opus) to convert. Sent on `participant-call-quality` only.")
  @example(5)
  AudioOutJitterMin?: int32;

  @doc("The maximum jitter of the audio stream SignalWire sends to the participant. Measured in RTP timestamp units, not milliseconds: divide by the codec's samples per millisecond (8 for PCMU and PCMA, 48 for Opus) to convert. Sent on `participant-call-quality` only.")
  @example(15)
  AudioOutJitterMax?: int32;

  @doc("The number of audio RTP packets SignalWire sent to the participant that were reported lost. Sent on `participant-call-quality` only.")
  @example(0)
  AudioOutLost?: int32;
}
