import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared mixins
// ═════════════════════════════════════════════════════════════════════════════

/** Identifies an active call on a node. Spread into nearly every method/event. */
model CallAddress {
  /** Node the call is on. */
  node_id: string;

  /** The call id. */
  call_id: string;
}

/**
 * The common Relay result envelope. `code` is a STRING (`"200"` on success);
 * errors are carried in-band via a non-`"200"` `code` plus `message` — there is
 * no JSON-RPC `error` object.
 */
model RelayResult {
  /** Result code (string), e.g. `"200"`, `"400"`, `"404"`. */
  code: string;

  /** Human-readable result message. */
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

/** Codecs negotiable when answering a call (documented superset across call types). */
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

/** Codecs selectable for SIP devices on dial/connect. */
union SipCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "G729",
  "G722",
  "VP8",
  "H264",
}

/** Codecs selectable for WebRTC devices on dial/connect. */
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
   * A confirmation prompt to require before bridging: a SWML URL string or an
   * inline compact SWML document. (Modeled loosely — SWML is documented
   * separately.)
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

/** A device to dial (`calling.dial` / `calling.begin`). Discriminated on `type`. */
@discriminator("type")
model DialDevice {
  type: string;
}

model DialPhoneDevice extends DialDevice {
  type: "phone";
  params: PhoneDeviceParams;
}

model DialSipDevice extends DialDevice {
  type: "sip";
  params: SipDeviceParams;
}

model DialWebrtcDevice extends DialDevice {
  type: "webrtc";
  params: WebrtcDeviceParams;
}

/** A device to connect to an active call (`calling.connect`). Discriminated on `type`. */
@discriminator("type")
model ConnectDevice {
  type: string;
}

model ConnectCallDevice extends ConnectDevice {
  type: "call";
  params: CallRefDeviceParams;
}

model ConnectQueueDevice extends ConnectDevice {
  type: "queue";
  params: QueueDeviceParams;
}

model ConnectPhoneDevice extends ConnectDevice {
  type: "phone";
  params: PhoneDeviceParams;
}

model ConnectSipDevice extends ConnectDevice {
  type: "sip";
  params: SipDeviceParams;
}

model ConnectWebrtcDevice extends ConnectDevice {
  type: "webrtc";
  params: WebrtcDeviceParams;
}

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

model RingbackAudio extends Ringback {
  type: "audio";
  params: {
    /** Audio file URL. */
    url: url;
  };
}

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

model RingbackSilence extends Ringback {
  type: "silence";
  params: {
    /** Seconds of silence. */
    duration: float64;
  };
}

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

  /** WebRTC device params (shapes not documented in the protocol reference). */
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

model PlayMediaAudio extends PlayMedia {
  type: "audio";
  params: {
    /** HTTP(s) URL to the audio resource to play. */
    url: url;
  };
}

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

model PlayMediaSilence extends PlayMedia {
  type: "silence";
  params: {
    /** Seconds of silence to play. */
    @minValueExclusive(0)
    duration: float64;
  };
}

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
