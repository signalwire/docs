import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Which fax tone to listen for on the far end: `CED` (the answering fax's tone) or `CNG` (the calling fax's tone). Case-insensitive. Default `CED`.")
union DetectFaxTone {
  "CED",
  "CNG",
  "ced",
  "cng",
}

@doc("Configuration for the answering-machine (voicemail) detector.")
@summary("Answering-machine detector settings")
model DetectMachineParams {
  @doc("How many seconds to wait for initial voice before giving up. Must be at least `1`. Default `4.5`.")
  @minValue(1)
  @example(5.0)
  initial_timeout?: float64;

  @doc("How many seconds to wait for voice to finish. Must be at least `1`. Default `1.0`.")
  @minValue(1)
  @example(1.0)
  end_silence_timeout?: float64;

  @doc("""
    How many seconds to wait for voice to finish before firing the READY
    event. Must be at least `1`. Defaults to `end_silence_timeout`.
    """)
  @minValue(1)
  @example(1.0)
  machine_ready_timeout?: float64;

  @doc("How many seconds of continuous voice are required before the result is reported as MACHINE. Must be at least `1`. Default `1.25`.")
  @minValue(1)
  @example(1.25)
  machine_voice_threshold?: float64;

  @doc("How many words must be counted before the result is reported as MACHINE. Must be at least `1`. Default `6`.")
  @minValue(1)
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
    If `false`, stop detection at the MACHINE event instead of waiting for the
    beep / end of the voicemail greeting. Default `true`.
    """)
  @example(true)
  detect_message_end?: boolean = true;
}

@doc("Configuration for the fax-tone detector.")
@summary("Fax-tone detector settings")
model DetectFaxParams {
  @doc("Which fax tone to listen for on the far end. Default `CED`.")
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

@doc("""
  Run the answering-machine (voicemail) detector. This is the default when `type`
  is omitted.
  """)
@summary("Machine detector")
model DetectConfigMachine {
  @doc("`machine` (answering machine / voicemail). Optional — omitting `type` selects this detector.")
  @example("machine")
  type?: "machine" = "machine";

  @doc("Optional tuning for the machine detector. Every field is optional and defaults are used when omitted.")
  params?: DetectMachineParams;
}

@doc("Run the fax-tone detector.")
@summary("Fax detector")
model DetectConfigFax {
  @doc("`fax` (fax tone).")
  @example("fax")
  type: "fax";

  @doc("Optional tuning for the fax detector. Only `tone` is accepted.")
  params?: DetectFaxParams;
}

@doc("Run the DTMF digit detector.")
@summary("Digit detector")
model DetectConfigDigit {
  @doc("`digit` (DTMF).")
  @example("digit")
  type: "digit";

  @doc("Optional tuning for the digit detector. Only `digits` is accepted.")
  params?: DetectDigitParams;
}

@doc("""
  The detector to start and its optional tuning. Set `type` to `machine`, `fax`, or
  `digit` (omit it for `machine`), then supply that detector's settings in `params`.
  When `type` is set, `params` accepts only that detector's fields; a field that
  belongs to another detector is rejected with a `400`.
  """)
@summary("Detector config")
union DetectConfig {
  machine: DetectConfigMachine,
  fax: DetectConfigFax,
  digit: DetectConfigDigit,
}

model DetectParams {
  ...CallAddress;

  @doc("Your own identifier for this detector. It's attached to the `calling.call.detect` events so you can correlate them, and you pass it to `calling.detect.stop` to stop the detector.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("The detector to run. Set `type` to `machine`, `fax`, or `digit`, then supply that detector's `params`.")
  detect: DetectConfig;

  @doc("Maximum time, in seconds, to run the detector before it stops on its own. Default `30.0`.")
  @minValue(0)
  @example(30.0)
  timeout?: float64;

  @doc("HTTP(s) URL to POST detector events to.")
  status_url?: url;
}

model DetectStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the detector with `calling.detect`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
