import "@signalwire/typespec-asyncapi";

import "./core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

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
