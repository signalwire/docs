import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

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

  /** How much voice (sec > 0) to decide MACHINE. Default `1.25`. */
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

@example(#{ type: "machine", params: #{ initial_timeout: 5.0 } })
model DetectMachine extends DetectConfig {
  type: "machine";
  params?: DetectMachineParams;
}

@example(#{ type: "fax", params: #{ tone: "CED" } })
model DetectFax extends DetectConfig {
  type: "fax";
  params?: DetectFaxParams;
}

@example(#{ type: "digit", params: #{ digits: "0123456789#*" } })
model DetectDigit extends DetectConfig {
  type: "digit";
  params?: DetectDigitParams;
}

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

model DetectStopParams {
  ...CallAddress;

  /** The detector `control_id` assigned in `calling.detect`. */
  control_id: string;
}
