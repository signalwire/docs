import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Tone the fax detector listens for. Only the remote fax machine's tone can be detected.")
union DetectFaxTone {
  "CED",
  "CNG",
}

@doc("Configuration for the answering-machine (voicemail) detector.")
@summary("Answering-machine detector settings")
model DetectMachineParams {
  @doc("How many seconds to wait for initial voice before giving up. Must be greater than 0. Default `4.5`.")
  @minValueExclusive(0)
  @example(5.0)
  initial_timeout?: float64;

  @doc("How many seconds to wait for voice to finish. Must be greater than 0. Default `1.0`.")
  @minValueExclusive(0)
  @example(1.0)
  end_silence_timeout?: float64;

  @doc("""
    How many seconds to wait for voice to finish before firing the READY
    event. Must be greater than 0. Defaults to `end_silence_timeout`.
    """)
  @minValueExclusive(0)
  @example(1.0)
  machine_ready_timeout?: float64;

  @doc("How many seconds of continuous voice are required before the result is reported as MACHINE. Default `1.25`.")
  @minValueExclusive(0)
  @example(1.25)
  machine_voice_threshold?: float64;

  @doc("How many words must be counted before the result is reported as MACHINE. Default `6`.")
  @minValueExclusive(0)
  @example(6)
  machine_words_threshold?: int32;

  @doc("""
    If `true`, a NOT_READY event fires if voice activity is detected after READY.
    This lets your application restart message delivery to the answering machine.
    Default `false`.
    """)
  @example(false)
  detect_interruptions?: boolean = false;

  @doc("""
    If false, stop detection on the machine event and don't wait on the beep /
    end of the voicemail greeting. Default `true`.
    """)
  @example(true)
  detect_message_end?: boolean = true;
}

@doc("Configuration for the fax-tone detector.")
@summary("Fax-tone detector settings")
model DetectFaxParams {
  @doc("Tone to detect. Only the remote fax machine's tone can be detected. Default `CED`.")
  @example("CED")
  tone?: DetectFaxTone;
}

@doc("Configuration for the digit detector.")
@summary("Digit detector settings")
model DetectDigitParams {
  @doc("Digits to detect. Default `0123456789#*`.")
  @example("0123456789#*")
  digits?: string;
}

@doc("Detector to start. One of `machine`, `fax`, or `digit`.")
@summary("Detector config")
@discriminator("type")
model DetectConfig {
  type: "digit" | "fax" | "machine";
}

@summary("Answering-machine detector")
model DetectMachine extends DetectConfig {
  @example("machine")
  type: "machine";

  params?: DetectMachineParams;
}

@summary("Fax-tone detector")
model DetectFax extends DetectConfig {
  @example("fax")
  type: "fax";

  params?: DetectFaxParams;
}

@summary("Digit detector")
model DetectDigit extends DetectConfig {
  @example("digit")
  type: "digit";

  params?: DetectDigitParams;
}

model DetectParams {
  ...CallAddress;

  @doc("Identifier used to control the active detector.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Detector to run (variant keyed on `detect.type`).")
  detect: DetectConfig;

  @doc("Maximum time (sec >= 0) to run the detector. Default `30.0`.")
  @minValue(0)
  @example(30.0)
  timeout?: float64;

  @doc("HTTP(s) URL to POST detector events to.")
  status_url?: url;
}

model DetectStopParams {
  ...CallAddress;

  @doc("The detector `control_id` assigned in `calling.detect`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
