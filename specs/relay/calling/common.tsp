import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared mixins
// ═════════════════════════════════════════════════════════════════════════════

/** Identifies a specific active call. Nearly every method and event includes it. */
model CallAddress {
  /** Identifier of the node handling the call. Pair it with `call_id` to address the call. */
  node_id: string;

  /** Unique identifier of the call. */
  call_id: string;
}

/**
 * The result returned by calling methods. Check `code`: `"200"` means success;
 * anything else means the request failed, and `message` explains why. Failures are
 * reported through these fields rather than thrown as a separate error.
 */
model RelayResult {
  /** Result code as a string, e.g. `"200"` (success), `"400"`, `"404"`. */
  code: string;

  /** Human-readable description of the result. On failure, explains what went wrong. */
  message: string;
}

/** A SIP header. Only `X-`-prefixed custom headers are permitted. */
model SipHeader {
  /** Header name (must start with `X-`). */
  name: string;

  /** Header value. */
  value: string;
}

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums
// ═════════════════════════════════════════════════════════════════════════════

/** Lifecycle states of a Relay-controlled call (`calling.call.state`). */
union CallState {
  "created",
  "ringing",
  "answered",
  "ending",
  "ended",
}

/** Subset of call states a device may be asked to report via `call_state_events`. */
union CallStateEventName {
  "created",
  "ringing",
  "answered",
  "ended",
}

/** Reason an outbound/active call is ended (`calling.end`). */
union CallEndReason {
  "hangup",
  "cancel",
  "busy",
  "noAnswer",
  "decline",
  "error",
}

/** Text-to-speech voice gender. */
union TtsGender {
  "male",
  "female",
}

/** Codecs you can negotiate when answering a call, across all call types. */
union AnswerCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "G729",
  "G722",
  "AMR-WB",
  "VP8",
  "H264",
}

/** Codecs you can request for a SIP device when you dial or connect. */
union SipCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "G729",
  "G722",
  "VP8",
  "H264",
}

/** Codecs you can request for a WebRTC device when you dial or connect. */
union WebrtcCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "VP8",
  "H264",
}

/**
 * Ringtone names (ITU-T country tone codes) usable by the `ringtone` ringback /
 * play element.
 */
union ToneName {
  "at", "au", "bg", "br", "be", "ch", "cl", "cn", "cz", "de", "dk", "ee", "es",
  "fi", "fr", "gr", "hu", "il", "in", "it", "lt", "jp", "mx", "my", "nl", "no",
  "nz", "ph", "pl", "pt", "ru", "se", "sg", "th", "uk", "us", "tw", "ve", "za",
}

// ═════════════════════════════════════════════════════════════════════════════
// Request device params (shared by dial & connect)
//
// Each device's `params` body. dial and connect accept near-identical phone/sip/
// webrtc shapes (minor documented per-context omissions are not modeled
// separately); connect additionally accepts call/queue/stream devices.
// ═════════════════════════════════════════════════════════════════════════════

/** `phone` device params. */
model PhoneDeviceParams {
  /** Origination number, E.164. */
  from_number: string;

  /** Destination number, E.164. */
  to_number: string;

  /** Seconds to ring before giving up. */
  @minValue(0)
  timeout?: int32 = 30;

  /** Maximum call duration in seconds. */
  @minValue(0)
  max_duration?: int32;

  /** Webhook to receive call-state events for this leg. */
  call_state_url?: url;

  /** Which call states to deliver to `call_state_url`. Default `["ended"]`. */
  call_state_events?: CallStateEventName[];

  /**
   * A prompt that must be confirmed before this leg is bridged. Provide a URL to a
   * SWML document or an inline SWML document. See the SWML reference for details.
   */
  confirm?: unknown;
}

/** `sip` device params. */
model SipDeviceParams {
  /** Origination SIP URI / address. */
  from: string;

  /** Caller name to present. */
  from_name?: string;

  /** Destination SIP URI / address. */
  to: string;

  /** Seconds to ring before giving up. */
  @minValue(0)
  timeout?: int32 = 30;

  /** Maximum call duration in seconds. */
  @minValue(0)
  max_duration?: int32;

  /** Custom `X-` SIP headers. */
  headers?: SipHeader[];

  /** Negotiable codecs (SignalWire-picked if unset). */
  codecs?: SipCodec[];

  /** Use WebRTC media for this leg. */
  webrtc_media?: boolean;

  /** Webhook to receive call-state events for this leg. */
  call_state_url?: url;

  /** Which call states to deliver to `call_state_url`. Default `["ended"]`. */
  call_state_events?: CallStateEventName[];

  /** A confirmation prompt (SWML URL or inline SWML). */
  confirm?: unknown;
}

/** `webrtc` device params. */
model WebrtcDeviceParams {
  /** Origination — E.164 or a registered endpoint URI. */
  from: string;

  /** Destination — a WebRTC endpoint URI / resource name. */
  to: string;

  /** Seconds to ring before giving up. */
  @minValue(0)
  timeout?: int32 = 30;

  /** Maximum call duration in seconds. */
  @minValue(0)
  max_duration?: int32;

  /** Negotiable codecs (SignalWire-picked if unset). */
  codecs?: WebrtcCodec[];

  /** Webhook to receive call-state events for this leg. */
  call_state_url?: url;

  /** Which call states to deliver to `call_state_url`. Default `["ended"]`. */
  call_state_events?: CallStateEventName[];

  /** A confirmation prompt (SWML URL or inline SWML). */
  confirm?: unknown;
}

/** `call` device params (connect only) — bridge to an existing call. */
model CallRefDeviceParams {
  /** Node of the existing call. */
  node_id: string;

  /** Existing call id. */
  call_id: string;
}

/** `queue` device params (connect only) — pull a call from a queue. */
model QueueDeviceParams {
  /** Node of the queue. */
  node_id: string;

  /** Queue name. */
  queue_name: string;

  /** Queue id. */
  queue_id?: string;
}

/** `stream` device params (connect only) — bidirectional audio to a WS endpoint. */
model StreamDeviceParams {
  /** Stream target — `wss://` required. */
  url: url;

  /** Optional stream name. */
  name?: string;

  /**
   * Codec, optionally with rate/ptime modifiers (e.g. `PCMU@40i`,
   * `L16@24000h@40i`). One of `PCMU|PCMA|G722|L16`. Default `PCMU`.
   */
  codec?: string = "PCMU";

  /** Webhook for stream status. */
  status_url?: url;

  /** HTTP method for `status_url`. */
  status_url_method?: "GET" | "POST" = "POST";

  /** Stream realtime audio. */
  realtime?: boolean = false;

  /** Bearer token sent to the stream endpoint. */
  authorization_bearer_token?: string;

  /** Arbitrary custom parameters forwarded to the stream endpoint. */
  custom_parameters?: Record<unknown>;
}

// ═════════════════════════════════════════════════════════════════════════════
// Request device unions
//
// dial and connect use DISTINCT discriminated bases because the emitter emits
// every derived model of a base — dial accepts 3 variants, connect 6.
// ═════════════════════════════════════════════════════════════════════════════

/** A device to dial (`calling.dial`). Discriminated on `type`. */
@discriminator("type")
model DialDevice {
  type: string;
}

@example(#{ type: "phone", params: #{ from_number: "+15551230001", to_number: "+15551230002", timeout: 30 } })
model DialPhoneDevice extends DialDevice {
  type: "phone";
  params: PhoneDeviceParams;
}

@example(#{ type: "sip", params: #{ from: "sip:alice@example.com", to: "sip:bob@example.com", timeout: 30 } })
model DialSipDevice extends DialDevice {
  type: "sip";
  params: SipDeviceParams;
}

@example(#{ type: "webrtc", params: #{ from: "+15551230001", to: "wss://example.com/endpoint", timeout: 30 } })
model DialWebrtcDevice extends DialDevice {
  type: "webrtc";
  params: WebrtcDeviceParams;
}

/** A device to connect to an active call (`calling.connect`). Discriminated on `type`. */
@discriminator("type")
model ConnectDevice {
  type: string;
}

@example(#{ type: "call", params: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." } })
model ConnectCallDevice extends ConnectDevice {
  type: "call";
  params: CallRefDeviceParams;
}

@example(#{ type: "queue", params: #{ node_id: "a3e1b2c4-...", queue_name: "support" } })
model ConnectQueueDevice extends ConnectDevice {
  type: "queue";
  params: QueueDeviceParams;
}

@example(#{ type: "phone", params: #{ from_number: "+15551230001", to_number: "+15551230002", timeout: 30 } })
model ConnectPhoneDevice extends ConnectDevice {
  type: "phone";
  params: PhoneDeviceParams;
}

@example(#{ type: "sip", params: #{ from: "sip:alice@example.com", to: "sip:bob@example.com", timeout: 30 } })
model ConnectSipDevice extends ConnectDevice {
  type: "sip";
  params: SipDeviceParams;
}

@example(#{ type: "webrtc", params: #{ from: "+15551230001", to: "agent-1", timeout: 30 } })
model ConnectWebrtcDevice extends ConnectDevice {
  type: "webrtc";
  params: WebrtcDeviceParams;
}

@example(#{ type: "stream", params: #{ url: "wss://example.com/stream", codec: "PCMU" } })
model ConnectStreamDevice extends ConnectDevice {
  type: "stream";
  params: StreamDeviceParams;
}

// ═════════════════════════════════════════════════════════════════════════════
// Ringback union (calling.connect)
// ═════════════════════════════════════════════════════════════════════════════

/** Audio played to the caller while a connect is in progress. Discriminated on `type`. */
@discriminator("type")
model Ringback {
  type: string;
}

@example(#{ type: "audio", params: #{ url: "https://example.com/ringback.mp3" } })
model RingbackAudio extends Ringback {
  type: "audio";
  params: {
    /** Audio file URL. */
    url: url;
  };
}

@example(#{ type: "tts", params: #{ text: "Connecting your call.", language: "en-US", gender: "female" } })
model RingbackTts extends Ringback {
  type: "tts";
  params: {
    /** Text to speak (plain or SSML). */
    text: string;

    /** TTS language. */
    language?: string = "en-US";

    /** TTS voice gender. */
    gender?: TtsGender = "female";
  };
}

@example(#{ type: "silence", params: #{ duration: 1.5 } })
model RingbackSilence extends Ringback {
  type: "silence";
  params: {
    /** Seconds of silence. */
    duration: float64;
  };
}

@example(#{ type: "ringtone", params: #{ name: "us", duration: 5 } })
model RingbackRingtone extends Ringback {
  type: "ringtone";
  params: {
    /** Tone name (country code). */
    name: ToneName;

    /** Seconds to play. */
    @minValueExclusive(0)
    duration?: float64;
  };
}

// ═════════════════════════════════════════════════════════════════════════════
// Negotiated call device (events)
//
// The device reported in events — the negotiated leg, with simpler params than
// the request device. Discriminated on `type`.
// ═════════════════════════════════════════════════════════════════════════════

/** The negotiated call leg reported in call events. Discriminated on `type`. */
@discriminator("type")
model CallDevice {
  type: string;
}

model CallPhoneDevice extends CallDevice {
  type: "phone";
  params: {
    /** Origination number, E.164. */
    from_number: string;

    /** Destination number, E.164. */
    to_number: string;
  };
}

model CallSipDevice extends CallDevice {
  type: "sip";
  params: {
    /** Origination SIP address. */
    from: string;

    /** Destination SIP address. */
    to: string;

    /** Custom `X-` SIP headers. */
    headers?: SipHeader[];
  };
}

model CallWebrtcDevice extends CallDevice {
  type: "webrtc";

  /** Parameters of the negotiated WebRTC leg. */
  params: Record<unknown>;
}

// ═════════════════════════════════════════════════════════════════════════════
// Play media union (calling.play / calling.play_and_collect `play[]`)
//
// Discriminated on `type`. Mirrors Ringback, but the `tts` variant additionally
// accepts a `voice` field. Shared by calling.play and calling.play_and_collect.
// ═════════════════════════════════════════════════════════════════════════════

/** A media element to play. Discriminated on `type`. */
@discriminator("type")
model PlayMedia {
  type: string;
}

@example(#{ type: "audio", params: #{ url: "https://example.com/welcome.mp3" } })
model PlayMediaAudio extends PlayMedia {
  type: "audio";
  params: {
    /** HTTP(s) URL to the audio resource to play. */
    url: url;
  };
}

@example(#{ type: "tts", params: #{ text: "Please hold while we connect you.", language: "en-US", gender: "female" } })
model PlayMediaTts extends PlayMedia {
  type: "tts";
  params: {
    /** Text to speak — plain text or SSML markup. */
    text: string;

    /** TTS language (e.g. `en-US`). Default `en-US`. */
    language?: string = "en-US";

    /** TTS voice gender. Default `female`. */
    gender?: TtsGender = "female";

    /** Specific voice to use. Highest precedence when selecting the TTS voice. */
    voice?: string;
  };
}

@example(#{ type: "silence", params: #{ duration: 2.5 } })
model PlayMediaSilence extends PlayMedia {
  type: "silence";
  params: {
    /** Seconds of silence to play. */
    duration: float64;
  };
}

@example(#{ type: "ringtone", params: #{ name: "us", duration: 5 } })
model PlayMediaRingtone extends PlayMedia {
  type: "ringtone";
  params: {
    /** Built-in ringtone name (country code). */
    name: ToneName;

    /** Seconds of ringtone to play. */
    @minValueExclusive(0)
    duration?: float64;
  };
}
