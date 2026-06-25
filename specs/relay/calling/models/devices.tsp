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

@doc("`phone` device params.")
model PhoneDeviceParams {
  @doc("Origination number, E.164. When omitted, SignalWire fills in a caller ID.")
  from_number?: string;

  @doc("Destination number, E.164.")
  to_number: string;

  @doc("Seconds to ring before giving up.")
  @minValue(0)
  timeout?: int32 = 30;

  @doc("Webhook to receive call-state events for this leg.")
  call_state_url?: url;

  @doc("Which call states to deliver to `call_state_url`. Default `[\"ended\"]`.")
  call_state_events?: CallStateEventName[];

  @doc("""
    A prompt that must be confirmed before this leg is bridged. Provide a URL to a
    SWML document or an inline SWML document. See the SWML reference for details.
    """)
  confirm?: url | unknown[];

  @doc("Seconds to wait for the confirmation prompt to complete before giving up.")
  @minValue(0)
  confirm_timeout?: int32;
}

@doc("`sip` device params.")
model SipDeviceParams {
  @doc("Origination SIP URI / address. When omitted, SignalWire fills in a caller ID.")
  from?: string;

  @doc("Caller name to present.")
  from_name?: string;

  @doc("Destination SIP URI / address.")
  to: string;

  @doc("Seconds to ring before giving up.")
  @minValue(0)
  timeout?: int32 = 30;

  @doc("Custom `X-` SIP headers.")
  headers?: SipHeader[];

  @doc("Negotiable codecs (SignalWire-picked if unset).")
  codecs?: SipCodec[];

  @doc("Use WebRTC media for this leg.")
  webrtc_media?: boolean;

  @doc("Media encryption policy for the SIP leg.")
  encryption?: "forbidden" | "mandatory" | "optional";

  @doc("Username used to authenticate the SIP leg.")
  username?: string;

  @doc("Password used to authenticate the SIP leg.")
  password?: string;

  @doc("Seconds between SIP session-timer refreshes for this leg.")
  @minValue(0)
  session_timeout?: int32;

  @doc("Webhook to receive call-state events for this leg.")
  call_state_url?: url;

  @doc("Which call states to deliver to `call_state_url`. Default `[\"ended\"]`.")
  call_state_events?: CallStateEventName[];

  @doc("A confirmation prompt (SWML URL or inline SWML).")
  confirm?: url | unknown[];

  @doc("Seconds to wait for the confirmation prompt to complete before giving up.")
  @minValue(0)
  confirm_timeout?: int32;
}

@doc("`webrtc` device params.")
model WebrtcDeviceParams {
  @doc("Origination — E.164 or a registered endpoint URI. When omitted, SignalWire fills in a caller ID.")
  from?: string;

  @doc("Destination — a WebRTC endpoint URI / resource name.")
  to: string;

  @doc("Seconds to ring before giving up.")
  @minValue(0)
  timeout?: int32 = 30;

  @doc("Webhook to receive call-state events for this leg.")
  call_state_url?: url;

  @doc("Which call states to deliver to `call_state_url`. Default `[\"ended\"]`.")
  call_state_events?: CallStateEventName[];

  @doc("A confirmation prompt (SWML URL or inline SWML).")
  confirm?: url | unknown[];

  @doc("Seconds to wait for the confirmation prompt to complete before giving up.")
  @minValue(0)
  confirm_timeout?: int32;
}

@doc("`call` device params (connect only) — bridge to an existing call.")
model CallRefDeviceParams {
  @doc("Node of the existing call.")
  node_id: string;

  @doc("Existing call id.")
  call_id: string;
}

@doc("`queue` device params (connect only) — pull a call from a queue.")
model QueueDeviceParams {
  @doc("Node of the queue.")
  node_id: string;

  @doc("Queue name.")
  queue_name: string;

  @doc("Queue id.")
  queue_id?: string;

  @doc("Destination to execute after the queued call is bridged.")
  execute_after_queue?: string;
}

@doc("`stream` device params (connect only) — bidirectional audio to a WS endpoint.")
model StreamDeviceParams {
  @doc("Stream target — `wss://` required.")
  url: url;

  @doc("Optional stream name.")
  name?: string;

  @doc("""
    Codec, optionally with rate/ptime modifiers (e.g. `PCMU@40i`,
    `L16@24000h@40i`). One of `PCMU|PCMA|G722|L16`. Default `PCMU`.
    """)
  codec?: string = "PCMU";

  @doc("Webhook for stream status.")
  status_url?: url;

  @doc("HTTP method for `status_url`.")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("Stream realtime audio.")
  realtime?: boolean = false;

  @doc("Bearer token sent to the stream endpoint.")
  authorization_bearer_token?: string;

  @doc("Arbitrary custom parameters forwarded to the stream endpoint.")
  custom_parameters?: Record<unknown>;
}

// ═════════════════════════════════════════════════════════════════════════════
// Request device unions
//
// dial and connect use DISTINCT discriminated bases because the emitter emits
// every derived model of a base — dial accepts 3 variants, connect 6.
// ═════════════════════════════════════════════════════════════════════════════

@doc("A device to dial (`calling.dial`). Discriminated on `type`.")
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

@doc("A device to connect to an active call (`calling.connect`). Discriminated on `type`.")
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

@doc("Audio played to the caller while a connect is in progress. Discriminated on `type`.")
@discriminator("type")
model Ringback {
  type: string;
}

@example(#{ type: "audio", params: #{ url: "https://example.com/ringback.mp3" } })
model RingbackAudio extends Ringback {
  type: "audio";
  params: {
    @doc("Audio file URL.")
    url: url;
  };
}

@example(#{ type: "tts", params: #{ text: "Connecting your call.", language: "en-US", gender: "female" } })
model RingbackTts extends Ringback {
  type: "tts";
  params: {
    @doc("Text to speak (plain or SSML).")
    text: string;

    @doc("TTS language.")
    language?: string = "en-US";

    @doc("TTS voice gender.")
    gender?: TtsGender = "female";

    @doc("Specific voice to use. Highest precedence when selecting the TTS voice.")
    voice?: string;
  };
}

@example(#{ type: "silence", params: #{ duration: 1.5 } })
model RingbackSilence extends Ringback {
  type: "silence";
  params: {
    @doc("Seconds of silence.")
    @minValueExclusive(0)
    duration: float64;
  };
}

@example(#{ type: "ringtone", params: #{ name: "us", duration: 5 } })
model RingbackRingtone extends Ringback {
  type: "ringtone";
  params: {
    @doc("Tone name (country code).")
    name: ToneName;

    @doc("Seconds to play.")
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

@doc("The negotiated call leg reported in call events. Discriminated on `type`.")
@discriminator("type")
model CallDevice {
  type: string;
}

model CallPhoneDevice extends CallDevice {
  type: "phone";
  params: {
    @doc("Origination number, E.164.")
    from_number: string;

    @doc("Destination number, E.164.")
    to_number: string;

    @doc("Custom `X-` SIP headers carried on the leg, when present.")
    headers?: SipHeader[];
  };
}

model CallSipDevice extends CallDevice {
  type: "sip";
  params: {
    @doc("Origination SIP address.")
    from: string;

    @doc("Destination SIP address.")
    to: string;

    @doc("Custom `X-` SIP headers.")
    headers?: SipHeader[];
  };
}

model CallWebrtcDevice extends CallDevice {
  type: "webrtc";
  params: {
    @doc("Origination — the WebRTC endpoint the leg was placed from.")
    from: string;

    @doc("Destination — the WebRTC endpoint the leg was placed to.")
    to: string;
  };
}
