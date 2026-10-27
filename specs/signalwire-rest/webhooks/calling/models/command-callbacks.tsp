import "../../../types";
import "../../../calling-api/calls/models/requests.tsp";
import "./inbound-call.tsp";

namespace SignalWireAPI.Webhooks.Calling;

// Events that a Calling API command (`dial`, `calling.play`, `calling.record`, …)
// posts to the `status_url` it was given. Every event shares one envelope; only
// `event_type` and `params` differ.

@doc("Fields shared by every event a Calling API command sends to its `status_url`.")
model CallingEventEnvelope {
  @doc("The channel the event was delivered on.")
  @example("swml:451ed9ff-e568-4222-8af9-4f9ab7428d09")
  event_channel: string;

  @doc("When the event was sent, as a Unix timestamp in seconds.")
  @example(1777565701.5623918)
  timestamp: float;

  @doc("Your project ID.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id: uuid;

  @doc("Your Space ID.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id: uuid;
}

@doc("Identifies the call an event is about.")
model CallingEventCallIds {
  @doc("ID of the call.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: uuid;

  @doc("ID of the node the call is on.")
  @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
  node_id: string;
}

@doc("Segment and tag fields included on most call events.")
model CallingEventSegment {
  @doc("ID of the call segment. Present when the call has one.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  segment_id?: uuid;

  @doc("The tag associated with the call. Present only when a tag was set on the call.")
  @example("my-tag")
  tag?: string;
}

// ============================================
// calling.call.state
// ============================================

@doc("The device on one end of the call.")
model CallStateDevice {
  @doc("The device type.")
  @example("phone")
  type: "phone" | "sip" | "webrtc";

  @doc("""
    The device's addresses. Phone devices report `from_number` and `to_number`; SIP and WebRTC
    devices report `from` and `to`. `headers` is included for phone and SIP devices when the call
    has headers.
    """)
  @example(#{ from_number: "+15551234567", to_number: "+15559876543" })
  params: {
    @doc("The number that initiated the call. Phone devices only.")
    @example("+15551234567")
    from_number?: string;

    @doc("The number the call was placed to. Phone devices only.")
    @example("+15559876543")
    to_number?: string;

    @doc("The address that initiated the call. SIP and WebRTC devices only.")
    @example("sip:alice@example.com")
    from?: string;

    @doc("The address the call was placed to. SIP and WebRTC devices only.")
    @example("sip:bob@example.com")
    to?: string;

    @doc("Headers associated with the call. Phone and SIP devices only, when the call has headers.")
    headers?: InboundCallHeader[];
  };
}

model CallStateStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.state` for call state callbacks.")
  @example("calling.call.state")
  event_type: "calling.call.state";

  ...CallingEventEnvelope;

  @doc("The call and its new state.")
  params: {
    ...CallingEventCallIds;
    ...CallingEventSegment;

    @doc("The state the call has entered.")
    @example("answered")
    call_state: "created" | "ringing" | "answered" | "ending" | "ended";

    @doc("The direction of the call.")
    @example("outbound")
    direction: "inbound" | "outbound";

    @doc("The device on the other end of the call.")
    device: CallStateDevice;

    @doc("When the call was created, in milliseconds since the Unix epoch. `0` until set.")
    @example(1777565690123)
    start_time: integer;

    @doc("When the call was answered, in milliseconds since the Unix epoch. `0` until the call is answered.")
    @example(1777565695456)
    answer_time: integer;

    @doc("When the call ended, in milliseconds since the Unix epoch. `0` until the call ends.")
    @example(0)
    end_time: integer;

    @doc("Why the call ended. Present once the call has an end reason.")
    @example("hangup")
    end_reason?:
      | "hangup"
      | "cancel"
      | "busy"
      | "noAnswer"
      | "decline"
      | "error"
      | "abandoned"
      | "maxDuration"
      | "notFound";

    @doc("Which side ended the call. Present together with `end_reason`.")
    @example("outbound")
    end_source?: "none" | "inbound" | "outbound";

    @doc("The call that created this call. Present only when this call has a parent.")
    parent?: InboundCallParent;

    @doc("The call this call is bridged to. Present only when this call has a peer.")
    peer?: InboundCallPeer;

    @doc("Set to `\"true\"` when this call won a parallel dial. Omitted otherwise.")
    @example("true")
    dial_winner?: "true";

    @doc("SIP-specific data. Present only for SIP devices.")
    sip_data?: InboundCallSipData;

    @doc("The call's inbound audio quality as a mean opinion score. Present once measured.")
    @example(4.4)
    audio_in_mos?: float;

    @doc("ID of the Fabric address involved in the call. Fabric calls only.")
    @example("b1c2d3e4-5d07-413d-9668-55542992eec0")
    address_id?: string;

    @doc("ID of the Fabric subscriber involved in the call. Fabric calls only.")
    @example("c1d2e3f4-5d07-413d-9668-55542992eec0")
    subscriber_id?: string;

    @doc("Name of the Fabric subscriber involved in the call. Fabric calls only.")
    @example("Alice")
    subscriber_name?: string;
  };
}

// ============================================
// calling.call.play
// ============================================

model PlayStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.play` for play status callbacks.")
  @example("calling.call.play")
  event_type: "calling.call.play";

  ...CallingEventEnvelope;

  @doc("The play operation and its new state.")
  params: {
    ...CallingEventCallIds;

    @doc("The control ID of the play operation, as set in `calling.play`.")
    @example("play-control-1")
    control_id: string;

    @doc("""
      The playback state. `playing` when playback starts or resumes, `paused` when it is paused,
      `finished` when it ends or is stopped, and `error` when it fails.
      """)
    @example("playing")
    state: "playing" | "paused" | "finished" | "error";
  };
}

// ============================================
// calling.call.record
// ============================================

model RecordStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.record` for record status callbacks.")
  @example("calling.call.record")
  event_type: "calling.call.record";

  ...CallingEventEnvelope;

  @doc("The recording and its new state.")
  params: {
    ...CallingEventCallIds;
    ...CallingEventSegment;

    @doc("The control ID of the record operation, as set in `calling.record`.")
    @example("record-control-1")
    control_id: string;

    @doc("""
      The recording state. `recording` when recording starts or resumes, `paused` when it is
      paused, `finished` when it ends, and `no_input` when it ended because no audio was heard
      before the initial timeout.
      """)
    @example("finished")
    state: "recording" | "paused" | "finished" | "no_input";

    @doc("The recording settings in effect.")
    record: {
      @doc("Audio recording settings.")
      audio: {
        @doc("The audio format of the recording.")
        @example("mp3")
        format: string;

        @doc("The direction of audio being recorded.")
        @example("both")
        direction: string;

        @doc("Whether the recording is stereo.")
        @example(false)
        stereo: boolean;
      };
    };

    @doc("The URL of the recording file.")
    @example("https://example.com/recordings/41e9c1b0-5d07-413d-9668-55542992eec0.mp3")
    url?: string;

    @doc("ID of the recording.")
    @example("41e9c1b0-5d07-413d-9668-55542992eec0")
    recording_id?: string;

    @doc("How paused audio is handled, as set in `calling.record.pause`. Present only when `state` is `paused`.")
    @example("skip")
    pause_behavior?: "skip" | "silence";

    @doc("Size of the recording file in bytes. Present only when `state` is `finished` or `no_input`.")
    @example(48000)
    size?: integer;

    @doc("Length of the recording in seconds. Present only when `state` is `finished` or `no_input`.")
    @example(12)
    duration?: integer;

    @doc("When the recording started, as a Unix timestamp in seconds. Present when the recording has ended.")
    @example(1777565690.123)
    start_time?: float;

    @doc("When the recording ended, as a Unix timestamp in seconds. Present when the recording has ended.")
    @example(1777565702.456)
    end_time?: float;

    @doc("When the first audio frame was recorded, as a Unix timestamp in seconds. Present when known.")
    @example(1777565690.173)
    first_frame_time?: float;
  };
}

// ============================================
// calling.call.collect
// ============================================

model CollectStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.collect` for collect status callbacks.")
  @example("calling.call.collect")
  event_type: "calling.call.collect";

  ...CallingEventEnvelope;

  @doc("The collect operation and its result.")
  params: {
    ...CallingEventCallIds;

    @doc("The control ID of the collect operation, as set in `calling.collect`.")
    @example("collect-control-1")
    control_id: string;

    @doc("""
      The collect result. `type` is `digit` or `speech` when input was collected, with the input
      in `params`. Other values (`no_input`, `no_match`, `start_of_input`, `finished`, `error`)
      carry no `params`.
      """)
    @example(#{ type: "digit", params: #{ digits: "1234", terminator: "#" } })
    result: {
      @doc("The result type.")
      @example("digit")
      type: string;

      @doc("""
        The collected input. For `digit`: `digits` and `terminator`, both strings. For `speech`:
        `text` (string) and `confidence` (number).
        """)
      @example(#{ digits: "1234", terminator: "#" })
      params?: Record<unknown>;
    };

    @doc("""
      Whether this is the final result. Present when `partial_results` is enabled: `false` for a
      partial result, `true` for the final one.
      """)
    @example(true)
    final?: boolean;

    @doc("The state of a `continuous` collect. Present only for continuous collects.")
    @example("collecting")
    state?: "collecting" | "finished" | "error";
  };
}

// ============================================
// calling.call.detect
// ============================================

model DetectStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.detect` for detect status callbacks.")
  @example("calling.call.detect")
  event_type: "calling.call.detect";

  ...CallingEventEnvelope;

  @doc("The detect operation and what it detected.")
  params: {
    ...CallingEventCallIds;
    ...CallingEventSegment;

    @doc("The control ID of the detect operation, as set in `calling.detect`.")
    @example("detect-control-1")
    control_id: string;

    @doc("The detection result.")
    @example(#{ type: "machine", params: #{ event: "HUMAN" } })
    detect: {
      @doc("The type of detection, as set in `calling.detect`.")
      @example("machine")
      type: "machine" | "fax" | "digit";

      @doc("The detected event.")
      params: {
        @doc("""
          What was detected. For `machine`: `MACHINE`, `HUMAN`, `UNKNOWN`, `READY`, or `NOT_READY`.
          For `digit`: the DTMF digit pressed. For `fax`: the fax tone detected. `finished` when the
          detector stops.
          """)
        @example("HUMAN")
        event: string;

        @doc("`true` when a beep was detected. Machine detection only.")
        @example(true)
        beep?: boolean;
      };
    };
  };
}

// ============================================
// calling.call.tap
// ============================================

model TapStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.tap` for tap status callbacks.")
  @example("calling.call.tap")
  event_type: "calling.call.tap";

  ...CallingEventEnvelope;

  @doc("The tap operation and its new state.")
  params: {
    ...CallingEventCallIds;
    ...CallingEventSegment;

    @doc("The control ID of the tap operation, as set in `calling.tap`.")
    @example("tap-control-1")
    control_id: string;

    @doc("The tap state. `tapping` when the tap starts, `finished` when it ends.")
    @example("tapping")
    state: "tapping" | "finished";

    @doc("The `tap` configuration, as sent in `calling.tap`.")
    tap: SignalWireAPI.Calling.TapConfig;

    @doc("The `device` configuration, as sent in `calling.tap`.")
    device: SignalWireAPI.Calling.TapDevice;
  };
}

// ============================================
// calling.call.transcribe
// ============================================

model TranscribeStateStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.transcribe` for transcribe state callbacks.")
  @example("calling.call.transcribe")
  event_type: "calling.call.transcribe";

  ...CallingEventEnvelope;

  @doc("The transcription operation and its new state.")
  params: {
    ...CallingEventCallIds;
    ...CallingEventSegment;

    @doc("The control ID of the transcription operation, as set in `calling.transcribe`.")
    @example("transcribe-control-1")
    control_id: string;

    @doc("The transcription state. `transcribing` when it starts, `finished` when it ends.")
    @example("transcribing")
    state: "transcribing" | "finished";

    @doc("The URL of the audio recorded for transcription.")
    @example("https://example.com/recordings/abd9c1b0-5d07-413d-9668-55542992eec0.wav")
    url?: string;

    @doc("ID of the recording made for transcription.")
    @example("abd9c1b0-5d07-413d-9668-55542992eec0")
    recording_id?: string;

    @doc("The `status_url` set in `calling.transcribe`.")
    @example("https://example.com/transcribe-status")
    status_url?: string;

    @doc("Size of the recorded audio in bytes. Present only when `state` is `finished`.")
    @example(96000)
    size?: integer;

    @doc("Length of the recorded audio in seconds. Present only when `state` is `finished`.")
    @example(12)
    duration?: integer;

    @doc("When the transcription started, as a Unix timestamp in seconds. Present only when `state` is `finished`.")
    @example(1777565690.123)
    start_time?: float;

    @doc("When the transcription ended, as a Unix timestamp in seconds. Present only when `state` is `finished`.")
    @example(1777565702.456)
    end_time?: float;
  };
}
