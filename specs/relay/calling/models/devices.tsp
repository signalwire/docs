import "@signalwire/typespec-asyncapi";

import "./core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Parameters for dialing or connecting a phone (PSTN) leg.")
@summary("Phone device parameters")
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

@doc("Parameters for dialing or connecting a SIP leg.")
@summary("SIP device parameters")
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

@doc("Parameters for dialing or connecting a Call Fabric resource-address leg.")
@summary("Call Fabric device parameters")
model FabricDeviceParams {
  @doc("Origination — E.164 or a resource address. When omitted, SignalWire fills in a caller ID.")
  @example("+15551230001")
  from?: string;

  @doc("Destination Call Fabric resource address, for example `/private/support`.")
  @example("/private/support")
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

@doc("Parameters for connecting to an existing call by reference (`calling.connect`, `call` device type).")
@summary("Call reference device parameters")
model CallRefDeviceParams {
  @doc("Opaque identifier that, paired with `call_id`, addresses the existing call. Echo back the value you received; treat it as opaque.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("Existing call id.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id: string;
}

@doc("Parameters for connecting to a call pulled from a queue (`calling.connect`, `queue` device type).")
@summary("Queue device parameters")
model QueueDeviceParams {
  @doc("Opaque identifier that, paired with the queue, addresses it. Echo back the value you received; treat it as opaque.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("Queue name.")
  @example("support")
  queue_name: string;

  @doc("Identifier of the queue, as an alternative to `queue_name`.")
  @example("q-1a2b3c4d")
  queue_id?: string;

  @doc("Destination to dial after the queued call is bridged.")
  @example("+15551230003")
  execute_after_queue?: string;
}

@doc("Parameters for connecting a call to a bidirectional audio stream over WebSocket (`calling.connect`, `stream` device type).")
@summary("Stream device parameters")
model StreamDeviceParams {
  @doc("Stream target — `wss://` required.")
  @example("wss://example.com/media")
  url: url;

  @doc("Optional stream name.")
  @example("agent-stream")
  name?: string;

  @doc("""
    Codec, optionally with rate/ptime modifiers — `@<ms>i` sets the packetization
    interval (how many milliseconds of audio per packet), `@<hz>h` sets the sample
    rate (e.g. `PCMU@40i`, `L16@24000h@40i`). One of `PCMU|PCMA|G722|L16`.
    Default `PCMU`.
    """)
  @example("PCMU")
  codec?: string = "PCMU";

  @doc("Webhook for stream status.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("HTTP method for `status_url`.")
  @example("POST")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("When `true`, stream audio in real time rather than buffered. Default `false`.")
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
  type: "phone" | "sip" | "fabric";
}

@doc("Dial a phone number over the PSTN.")
model DialPhoneDevice extends DialDevice {
  @example("phone")
  type: "phone";

  params: PhoneDeviceParams;
}

@doc("Dial a SIP endpoint.")
model DialSipDevice extends DialDevice {
  @example("sip")
  type: "sip";

  params: SipDeviceParams;
}

@doc("Dial a Call Fabric resource address.")
model DialFabricDevice extends DialDevice {
  @example("fabric")
  type: "fabric";

  params: FabricDeviceParams;
}

@doc("A device to connect to an active call (`calling.connect`). Discriminated on `type`.")
@discriminator("type")
model ConnectDevice {
  type: "phone" | "sip" | "fabric" | "call" | "queue" | "stream";
}

@doc("Connect to an existing call by reference.")
model ConnectCallDevice extends ConnectDevice {
  @example("call")
  type: "call";

  params: CallRefDeviceParams;
}

@doc("Connect to a call pulled from a queue.")
model ConnectQueueDevice extends ConnectDevice {
  @example("queue")
  type: "queue";

  params: QueueDeviceParams;
}

@doc("Connect to a phone number over the PSTN.")
model ConnectPhoneDevice extends ConnectDevice {
  @example("phone")
  type: "phone";

  params: PhoneDeviceParams;
}

@doc("Connect to a SIP endpoint.")
model ConnectSipDevice extends ConnectDevice {
  @example("sip")
  type: "sip";

  params: SipDeviceParams;
}

@doc("Connect to a Call Fabric resource address.")
model ConnectFabricDevice extends ConnectDevice {
  @example("fabric")
  type: "fabric";

  params: FabricDeviceParams;
}

@doc("Connect the call to a bidirectional audio stream over WebSocket.")
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

@doc("Play an audio file from a URL as ringback.")
model RingbackAudio extends Ringback {
  @example("audio")
  type: "audio";

  params: {
    @doc("Audio file URL.")
    @example("https://example.com/ringback.mp3")
    url: url;
  };
}

@doc("Speak text with text-to-speech as ringback.")
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

@doc("Play silence for a fixed duration as ringback.")
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

@doc("Play a country-specific ringtone as ringback.")
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

@doc("A phone (PSTN) leg, as reported in call events.")
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

@doc("A SIP leg, as reported in call events.")
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

@doc("A WebRTC leg, as reported in call events.")
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
