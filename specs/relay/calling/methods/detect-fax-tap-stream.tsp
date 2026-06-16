import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Detector subobject (calling.detect)
//
// `detect` carries a variant with a `type` and a per-type `params` body.
// Discriminated on `type` (machine|fax|digit), exactly like Device/Ringback.
// ═════════════════════════════════════════════════════════════════════════════

/** Tone the fax detector listens for (remote side only). */
union DetectFaxTone {
  "CED",
  "CNG",
}

/** `machine` detector params (answering-machine / voicemail detection). */
model DetectMachineParams {
  /** How long to wait (sec > 0) for initial voice before giving up. Default `4.5`. */
  @minValueExclusive(0)
  initial_timeout?: float64;

  /** How long to wait (sec > 0) for voice to finish. Default `1.0`. */
  @minValueExclusive(0)
  end_silence_timeout?: float64;

  /**
   * How long to wait (sec > 0) for voice to finish before firing the READY
   * event. Default is `end_silence_timeout`.
   */
  @minValueExclusive(0)
  machine_ready_timeout?: float64;

  /**
   * How much voice (sec > 0) to decide MACHINE. Default `1.25`. (Source says
   * "sec > 0" but the description says "in ms" — units to confirm.)
   */
  @minValueExclusive(0)
  machine_voice_threshold?: float64;

  /** How many words (count > 0) to count to decide MACHINE. Default `6`. */
  @minValueExclusive(0)
  machine_words_threshold?: int32;

  /**
   * If true, a NOT_READY event is fired if VAD detects speech after READY. This
   * lets the application restart message delivery to the answering machine.
   * Default `false`.
   */
  detect_interruptions?: boolean = false;

  /**
   * If false, stop detection on the machine event and don't wait on the beep /
   * end of the voicemail greeting. Default `true`.
   */
  detect_message_end?: boolean = true;
}

/** `fax` detector params. */
model DetectFaxParams {
  /** Tone to detect (remote side only). Default `CED`. */
  tone?: DetectFaxTone;
}

/** `digit` detector params. */
model DetectDigitParams {
  /** Digits to detect. Default `0123456789#*`. */
  digits?: string;
}

/** Detector to start. Discriminated on `type` (`machine`|`fax`|`digit`). */
@discriminator("type")
model DetectConfig {
  type: string;
}

model DetectMachine extends DetectConfig {
  type: "machine";
  params?: DetectMachineParams;
}

model DetectFax extends DetectConfig {
  type: "fax";
  params?: DetectFaxParams;
}

model DetectDigit extends DetectConfig {
  type: "digit";
  params?: DetectDigitParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.detect
// ─────────────────────────────────────────────────────────────────────────────

model DetectParams {
  ...CallAddress;

  /** Identifier used to control the active detector. */
  control_id: string;

  /** Detector to run (variant keyed on `detect.type`). */
  detect: DetectConfig;

  /** Maximum time (sec >= 0) to run the detector. Default `30.0`. */
  @minValue(0)
  timeout?: float64;

  /** HTTP(s) URL to POST detector events to. */
  status_url?: url;
}

model DetectResult {
  ...RelayResult;

  /** Echo of the detector `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/** Start a detector on an active call. May run multiple in parallel. */
@rpcMethod("calling.detect")
@summary("Start a detector (machine/fax/digit)")
op detect(...DetectParams): DetectResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.detect.stop
// ─────────────────────────────────────────────────────────────────────────────

model DetectStopParams {
  ...CallAddress;

  /** The detector `control_id` assigned in `calling.detect`. */
  control_id: string;
}

model DetectStopResult {
  ...RelayResult;

  /** Echo of the detector `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/** Stop an active detector. */
@rpcMethod("calling.detect.stop")
@summary("Stop a detector")
op detectStop(...DetectStopParams): DetectStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.send_fax
// ─────────────────────────────────────────────────────────────────────────────

model SendFaxParams {
  ...CallAddress;

  /** Identifier used to control the active faxing. */
  control_id: string;

  /** Location of the fax document to send. PDF format only. */
  document: url;

  /** Identity to display on the receiving fax. Default is the SignalWire DID. */
  identity?: string;

  /**
   * Custom info added to the header of each fax page (alongside identity, date,
   * and page number). `SignalWire` is the default. Set to empty string to
   * disable sending any header.
   */
  header_info?: string = "SignalWire";

  /** HTTP(s) URL to POST fax events to. */
  status_url?: url;
}

model SendFaxResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/**
 * Send a fax. Can only be executed on a one-legged call that is not executing
 * anything else.
 */
@rpcMethod("calling.send_fax")
@summary("Send a PDF fax")
op sendFax(...SendFaxParams): SendFaxResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.send_fax.stop
// ─────────────────────────────────────────────────────────────────────────────

model SendFaxStopParams {
  ...CallAddress;

  /** The send-fax `control_id` assigned in `calling.send_fax`. */
  control_id: string;
}

model SendFaxStopResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/** Stop sending a fax. */
@rpcMethod("calling.send_fax.stop")
@summary("Stop sending a fax")
op sendFaxStop(...SendFaxStopParams): SendFaxStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.receive_fax
// ─────────────────────────────────────────────────────────────────────────────

model ReceiveFaxParams {
  ...CallAddress;

  /** Identifier used to control the active faxing. */
  control_id: string;

  /** HTTP(s) URL to POST fax events to. */
  status_url?: url;
}

model ReceiveFaxResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/**
 * Receive a fax. Can only be executed on a one-legged call that is not executing
 * anything else.
 */
@rpcMethod("calling.receive_fax")
@summary("Receive a fax")
op receiveFax(...ReceiveFaxParams): ReceiveFaxResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.receive_fax.stop
// ─────────────────────────────────────────────────────────────────────────────

model ReceiveFaxStopParams {
  ...CallAddress;

  /** The fax `control_id` assigned in `calling.receive_fax`. */
  control_id: string;
}

model ReceiveFaxStopResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/** Stop receiving a fax. */
@rpcMethod("calling.receive_fax.stop")
@summary("Stop receiving a fax")
op receiveFaxStop(...ReceiveFaxStopParams): ReceiveFaxStopResult;

// ═════════════════════════════════════════════════════════════════════════════
// Tap subobjects (calling.tap)
//
// `tap` carries the media-selection variant (keyed on `tap.type`); `device`
// carries the delivery-target variant (keyed on `device.type`). Both are
// discriminated bases with `extends` variants. The same TapDevice shape is
// echoed back in the result as `source_device` with all params resolved.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Which side of the call to tap. `listen` = what the call party hears; `speak`
 * = what the call party says.
 */
union TapDirection {
  "listen",
  "speak",
  "both",
}

/**
 * Audio codec for the tapped media. Open-ended list — it will match the tapped
 * audio if not set.
 */
union TapCodec {
  "OPUS",
  "PCMA",
  "PCMU",
}

/** `audio` tap params. */
model TapAudioParams {
  /** Side of the call to tap. Default `speak`. */
  direction?: TapDirection = "speak";
}

/** Media to intercept. Discriminated on `type` (documented value `audio`). */
@discriminator("type")
model TapConfig {
  type: string;
}

model TapAudio extends TapConfig {
  type: "audio";
  params: TapAudioParams;
}

/** `rtp` device params (delivery target). */
model TapRtpDeviceParams {
  /**
   * RTP IPv4 address. Must be an IP owned by the customer or expecting our
   * traffic; specifying a private IP or a SignalWire-owned public IP is
   * forbidden.
   */
  addr: string;

  /** RTP port. */
  port: int32;

  /** Codec — matches the tapped audio if not set. */
  codec?: TapCodec;

  /** Packetization time in ms — matches the tapped audio if not set. */
  ptime?: int32;

  /** Sample rate in Hz (present in the resolved `source_device` echo). */
  rate?: int32;
}

/** `ws` device params (delivery target). */
model TapWsDeviceParams {
  /** WebSocket URI. */
  uri: string;

  /** Codec — matches the tapped audio if not set. */
  codec?: TapCodec;

  /** Sample rate in Hz — matches the tapped audio if not set. */
  rate?: int32;
}

/**
 * Device to receive the tapped media. Discriminated on `type` (`rtp`|`ws`;
 * future: `phone`|`webrtc`|`sip`). Echoed back fully-resolved as the result's
 * `source_device`.
 */
@discriminator("type")
model TapDevice {
  type: string;
}

model TapRtpDevice extends TapDevice {
  type: "rtp";
  params: TapRtpDeviceParams;
}

model TapWsDevice extends TapDevice {
  type: "ws";
  params: TapWsDeviceParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.tap
// ─────────────────────────────────────────────────────────────────────────────

model TapParams {
  ...CallAddress;

  /** Identifier used to control the active tap. */
  control_id: string;

  /** Media to intercept (variant keyed on `tap.type`). */
  tap: TapConfig;

  /** Device to receive the tapped media (variant keyed on `device.type`). */
  device: TapDevice;

  /** HTTP(s) URL to POST tap events to. */
  status_url?: url;
}

model TapResult {
  ...RelayResult;

  /** The call id. */
  call_id?: string;

  /** Echo of the tap `control_id`. */
  control_id?: string;

  /**
   * The source device with all params filled in, so the destination knows what
   * is being delivered (offer/answer model).
   */
  source_device?: TapDevice;
}

/**
 * Intercept call media and stream it to an external device. Transcoding and
 * resampling are available on request.
 */
@rpcMethod("calling.tap")
@summary("Tap call media to an external device")
op tap(...TapParams): TapResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.tap.stop
// ─────────────────────────────────────────────────────────────────────────────

model TapStopParams {
  ...CallAddress;

  /** The tap `control_id` assigned in `calling.tap`. */
  control_id: string;
}

model TapStopResult {
  ...RelayResult;

  /** Echo of the tap `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/** Stop an active call tap. */
@rpcMethod("calling.tap.stop")
@summary("Stop a call tap")
op tapStop(...TapStopParams): TapStopResult;

// ═════════════════════════════════════════════════════════════════════════════
// calling.stream
//
// Flat params (no nested tap/device union). NOTE: the result echoes `node_id`,
// unlike sibling methods that echo `call_id`.
// ═════════════════════════════════════════════════════════════════════════════

/** Which audio track to stream. */
union StreamTrack {
  "inbound_track",
  "outbound_track",
  "both_tracks",
}

model StreamParams {
  ...CallAddress;

  /** Identifier used to control the active stream. */
  control_id: string;

  /** WebSocket URI (`wss://`) to stream audio to. */
  url: url;

  /** A friendly name for the stream. */
  name?: string;

  /** Codec for the streamed audio. Default is the call's native codec. */
  codec?: string;

  /**
   * Which audio track to stream. `inbound_track` (what the caller says),
   * `outbound_track` (what the caller hears), or `both_tracks`. Default
   * `inbound_track`.
   */
  track?: StreamTrack = "inbound_track";

  /** HTTP(s) URL to POST stream status events to. */
  status_url?: url;

  /** HTTP method for `status_url`. Default `POST`. */
  status_url_method?: "GET" | "POST" = "POST";

  /** Bearer token to include in the WebSocket connection. */
  authorization_bearer_token?: string;

  /**
   * JSON object of custom key-value pairs sent to the WebSocket endpoint on
   * connect.
   */
  custom_parameters?: Record<unknown>;
}

model StreamResult {
  ...RelayResult;

  /** Echo of the stream `control_id`. */
  control_id?: string;

  /** Node the call is on (this method echoes `node_id`, not `call_id`). */
  node_id?: string;
}

/** Start streaming call audio to a WebSocket endpoint. */
@rpcMethod("calling.stream")
@summary("Stream call audio to a WebSocket endpoint")
op stream(...StreamParams): StreamResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.stream.stop
// ─────────────────────────────────────────────────────────────────────────────

model StreamStopParams {
  ...CallAddress;

  /** The stream `control_id` assigned in `calling.stream`. */
  control_id: string;
}

model StreamStopResult {
  ...RelayResult;

  /** Echo of the stream `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

/** Stop an active call stream. */
@rpcMethod("calling.stream.stop")
@summary("Stop a call stream")
op streamStop(...StreamStopParams): StreamStopResult;
