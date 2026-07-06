import "@signalwire/typespec-asyncapi";

import "./core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("`phone` device params.")
model PhoneDeviceParams {
  @doc("Origination number, E.164. When omitted, SignalWire fills in a caller ID.")
  @example("+15551230001")
  from_number?: string;

  @doc("Destination number, E.164.")
  @example("+15551230002")
  to_number: string;

  @doc("Seconds to ring before giving up.")
  @minValue(0)
  @example(30)
  timeout?: int32 = 30;

  @doc("Webhook to receive call-state events for this leg.")
  @example("https://example.com/webhooks/relay")
  call_state_url?: url;

  @doc("Which call states to deliver to `call_state_url`. Default `[\"ended\"]`.")
  @example(#["ended"])
  call_state_events?: CallStateEventName[];

  @doc("""
    A prompt that must be confirmed before this leg is bridged. Provide a URL to a
    SWML document or an inline SWML document. See the SWML reference for details.
    """)
  confirm?: url | unknown[];

  @doc("Seconds to wait for the confirmation prompt to complete before giving up.")
  @minValue(0)
  @example(30)
  confirm_timeout?: int32;
}

@doc("`sip` device params.")
model SipDeviceParams {
  @doc("Origination SIP URI / address. When omitted, SignalWire fills in a caller ID.")
  @example("sip:alice@example.com")
  from?: string;

  @doc("Caller name to present.")
  @example("Alice")
  from_name?: string;

  @doc("Destination SIP URI / address.")
  @example("sip:bob@example.com")
  to: string;

  @doc("Seconds to ring before giving up.")
  @minValue(0)
  @example(30)
  timeout?: int32 = 30;

  @doc("Custom `X-` SIP headers.")
  headers?: SipHeader[];

  @doc("Negotiable codecs (SignalWire-picked if unset).")
  @example(#["PCMU", "PCMA"])
  codecs?: SipCodec[];

  @doc("Use WebRTC media for this leg.")
  @example(false)
  webrtc_media?: boolean;

  @doc("Media encryption policy for the SIP leg.")
  @example("optional")
  encryption?: "forbidden" | "mandatory" | "optional";

  @doc("Username used to authenticate the SIP leg.")
  @example("alice")
  username?: string;

  @doc("Password used to authenticate the SIP leg.")
  @example("s3cret")
  password?: string;

  @doc("Seconds between SIP session-timer refreshes for this leg.")
  @minValue(0)
  @example(1800)
  session_timeout?: int32;

  @doc("Webhook to receive call-state events for this leg.")
  @example("https://example.com/webhooks/relay")
  call_state_url?: url;

  @doc("Which call states to deliver to `call_state_url`. Default `[\"ended\"]`.")
  @example(#["ended"])
  call_state_events?: CallStateEventName[];

  @doc("A confirmation prompt (SWML URL or inline SWML).")
  confirm?: url | unknown[];

  @doc("Seconds to wait for the confirmation prompt to complete before giving up.")
  @minValue(0)
  @example(30)
  confirm_timeout?: int32;
}

@doc("`webrtc` device params.")
model WebrtcDeviceParams {
  @doc("Origination — E.164 or a registered endpoint URI. When omitted, SignalWire fills in a caller ID.")
  @example("+15551230001")
  from?: string;

  @doc("Destination — a WebRTC endpoint URI / resource name.")
  @example("agent-1")
  to: string;

  @doc("Seconds to ring before giving up.")
  @minValue(0)
  @example(30)
  timeout?: int32 = 30;

  @doc("Webhook to receive call-state events for this leg.")
  @example("https://example.com/webhooks/relay")
  call_state_url?: url;

  @doc("Which call states to deliver to `call_state_url`. Default `[\"ended\"]`.")
  @example(#["ended"])
  call_state_events?: CallStateEventName[];

  @doc("A confirmation prompt (SWML URL or inline SWML).")
  confirm?: url | unknown[];

  @doc("Seconds to wait for the confirmation prompt to complete before giving up.")
  @minValue(0)
  @example(30)
  confirm_timeout?: int32;
}

@doc("`call` device params (connect only) — bridge to an existing call.")
model CallRefDeviceParams {
  @doc("Node of the existing call.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("Existing call id.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id: string;
}

@doc("`queue` device params (connect only) — pull a call from a queue.")
model QueueDeviceParams {
  @doc("Node of the queue.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("Queue name.")
  @example("support")
  queue_name: string;

  @doc("Queue id.")
  @example("q-1a2b3c4d")
  queue_id?: string;

  @doc("Destination to execute after the queued call is bridged.")
  @example("+15551230003")
  execute_after_queue?: string;
}

@doc("`stream` device params (connect only) — bidirectional audio to a WS endpoint.")
model StreamDeviceParams {
  @doc("Stream target — `wss://` required.")
  @example("wss://example.com/media")
  url: url;

  @doc("Optional stream name.")
  @example("agent-stream")
  name?: string;

  @doc("""
    Codec, optionally with rate/ptime modifiers (e.g. `PCMU@40i`,
    `L16@24000h@40i`). One of `PCMU|PCMA|G722|L16`. Default `PCMU`.
    """)
  @example("PCMU")
  codec?: string = "PCMU";

  @doc("Webhook for stream status.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("HTTP method for `status_url`.")
  @example("POST")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("Stream realtime audio.")
  @example(false)
  realtime?: boolean = false;

  @doc("Bearer token sent to the stream endpoint.")
  @example("Bearer eyJhbGciOiJIUzI1NiJ9")
  authorization_bearer_token?: string;

  @doc("Arbitrary custom parameters forwarded to the stream endpoint.")
  custom_parameters?: Record<unknown>;
}

@doc("A device to dial (`calling.dial`). Discriminated on `type`.")
@discriminator("type")
model DialDevice {
  type: "phone" | "sip" | "webrtc";
}

model DialPhoneDevice extends DialDevice {
  @example("phone")
  type: "phone";

  params: PhoneDeviceParams;
}

model DialSipDevice extends DialDevice {
  @example("sip")
  type: "sip";

  params: SipDeviceParams;
}

model DialWebrtcDevice extends DialDevice {
  @example("webrtc")
  type: "webrtc";

  params: WebrtcDeviceParams;
}

@doc("A device to connect to an active call (`calling.connect`). Discriminated on `type`.")
@discriminator("type")
model ConnectDevice {
  type: "phone" | "sip" | "webrtc" | "call" | "queue" | "stream";
}

model ConnectCallDevice extends ConnectDevice {
  @example("call")
  type: "call";

  params: CallRefDeviceParams;
}

model ConnectQueueDevice extends ConnectDevice {
  @example("queue")
  type: "queue";

  params: QueueDeviceParams;
}

model ConnectPhoneDevice extends ConnectDevice {
  @example("phone")
  type: "phone";

  params: PhoneDeviceParams;
}

model ConnectSipDevice extends ConnectDevice {
  @example("sip")
  type: "sip";

  params: SipDeviceParams;
}

model ConnectWebrtcDevice extends ConnectDevice {
  @example("webrtc")
  type: "webrtc";

  params: WebrtcDeviceParams;
}

model ConnectStreamDevice extends ConnectDevice {
  @example("stream")
  type: "stream";

  params: StreamDeviceParams;
}

@doc("Audio played to the caller while a connect is in progress. Discriminated on `type`.")
@discriminator("type")
model Ringback {
  type: "audio" | "tts" | "silence" | "ringtone";
}

model RingbackAudio extends Ringback {
  @example("audio")
  type: "audio";

  params: {
    @doc("Audio file URL.")
    @example("https://example.com/ringback.mp3")
    url: url;
  };
}

model RingbackTts extends Ringback {
  @example("tts")
  type: "tts";

  params: {
    @doc("Text to speak (plain or SSML).")
    @example("Connecting your call.")
    text: string;

    @doc("TTS language.")
    @example("en-US")
    language?: string = "en-US";

    @doc("TTS voice gender.")
    @example("female")
    gender?: TtsGender = "female";

    @doc("Specific voice to use. Highest precedence when selecting the TTS voice.")
    @example("en-US-Standard-C")
    voice?: string;
  };
}

model RingbackSilence extends Ringback {
  @example("silence")
  type: "silence";

  params: {
    @doc("Seconds of silence.")
    @minValueExclusive(0)
    @example(1.5)
    duration: float64;
  };
}

model RingbackRingtone extends Ringback {
  @example("ringtone")
  type: "ringtone";

  params: {
    @doc("Tone name (country code).")
    @example("us")
    name: ToneName;

    @doc("Seconds to play.")
    @minValueExclusive(0)
    @example(5)
    duration?: float64;
  };
}

@doc("The negotiated call leg reported in call events. Discriminated on `type`.")
@discriminator("type")
model CallDevice {
  type: "phone" | "sip" | "webrtc";
}

model CallPhoneDevice extends CallDevice {
  @example("phone")
  type: "phone";

  params: {
    @doc("Origination number, E.164.")
    @example("+15551230001")
    from_number: string;

    @doc("Destination number, E.164.")
    @example("+15551230002")
    to_number: string;

    @doc("Custom `X-` SIP headers carried on the leg, when present.")
    headers?: SipHeader[];
  };
}

model CallSipDevice extends CallDevice {
  @example("sip")
  type: "sip";

  params: {
    @doc("Origination SIP address.")
    @example("sip:alice@example.com")
    from: string;

    @doc("Destination SIP address.")
    @example("sip:bob@example.com")
    to: string;

    @doc("Custom `X-` SIP headers.")
    headers?: SipHeader[];
  };
}

model CallWebrtcDevice extends CallDevice {
  @example("webrtc")
  type: "webrtc";

  params: {
    @doc("Origination — the WebRTC endpoint the leg was placed from.")
    @example("agent-1")
    from: string;

    @doc("Destination — the WebRTC endpoint the leg was placed to.")
    @example("agent-2")
    to: string;
  };
}
