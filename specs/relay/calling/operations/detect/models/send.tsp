import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Tone the fax detector listens for (remote side only).")
union DetectFaxTone {
  "CED",
  "CNG",
}

@doc("`machine` detector params (answering-machine / voicemail detection).")
model DetectMachineParams {
  @doc("How long to wait (sec > 0) for initial voice before giving up. Default `4.5`.")
  @minValueExclusive(0)
  @example(5.0)
  initial_timeout?: float64;

  @doc("How long to wait (sec > 0) for voice to finish. Default `1.0`.")
  @minValueExclusive(0)
  @example(1.0)
  end_silence_timeout?: float64;

  @doc("""
    How long to wait (sec > 0) for voice to finish before firing the READY
    event. Default is `end_silence_timeout`.
    """)
  @minValueExclusive(0)
  @example(1.0)
  machine_ready_timeout?: float64;

  @doc("How much voice (sec > 0) to decide MACHINE. Default `1.25`.")
  @minValueExclusive(0)
  @example(1.25)
  machine_voice_threshold?: float64;

  @doc("How many words (count > 0) to count to decide MACHINE. Default `6`.")
  @minValueExclusive(0)
  @example(6)
  machine_words_threshold?: int32;

  @doc("""
    If true, a NOT_READY event is fired if VAD detects speech after READY. This
    lets the application restart message delivery to the answering machine.
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

@doc("`fax` detector params.")
model DetectFaxParams {
  @doc("Tone to detect (remote side only). Default `CED`.")
  @example("CED")
  tone?: DetectFaxTone;
}

@doc("`digit` detector params.")
model DetectDigitParams {
  @doc("Digits to detect. Default `0123456789#*`.")
  @example("0123456789#*")
  digits?: string;
}

@doc("Detector to start. Discriminated on `type` (`machine`|`fax`|`digit`).")
@discriminator("type")
model DetectConfig {
  type: "digit" | "fax" | "machine";
}

model DetectMachine extends DetectConfig {
  @example("machine")
  type: "machine";

  params?: DetectMachineParams;
}

model DetectFax extends DetectConfig {
  @example("fax")
  type: "fax";

  params?: DetectFaxParams;
}

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
