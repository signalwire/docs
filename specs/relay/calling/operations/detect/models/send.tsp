import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Which fax tone to listen for on the far end: `CED` (the answering fax's tone) or `CNG` (the calling fax's tone). Default `CED`.")
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
    If `false`, stop detection at the MACHINE event instead of waiting for the
    beep / end of the voicemail greeting. Default `true`.
    """)
  @example(true)
  detect_message_end?: boolean = true;
}

@doc("Configuration for the fax-tone detector.")
@summary("Fax-tone detector settings")
model DetectFaxParams {
  @doc("Fax detector only. Which fax tone to listen for on the far end. Default `CED`.")
  @example("CED")
  tone?: DetectFaxTone;
}

@doc("Configuration for the digit detector.")
@summary("Digit detector settings")
model DetectDigitParams {
  @doc("Digit detector only. Digits to detect. Default `0123456789#*`.")
  @example("0123456789#*")
  digits?: string;
}

@doc("""
  Optional tuning for the detector selected by `type`. Every field is optional and a
  sensible default applies when omitted. Which fields take effect depends on `type`:
  the `*_timeout`, `machine_*`, and `detect_*` fields tune the **machine** detector,
  `tone` applies to the **fax** detector, and `digits` applies to the **digit**
  detector.
  """)
@summary("Detector settings")
model DetectorParams {
  ...DetectMachineParams;
  ...DetectFaxParams;
  ...DetectDigitParams;
}

@doc("""
  The detector to start and its optional tuning. Set `type` to `machine`, `fax`, or
  `digit`, then supply that detector's settings in `params`. `type` is optional — omit
  it to default to `machine` (answering-machine detection).
  """)
@summary("Detector config")
model DetectConfig {
  @doc("""
    Which detector to run: `machine` (answering machine / voicemail), `fax` (fax tone),
    or `digit` (DTMF). Optional — defaults to `machine` when omitted.
    """)
  @example("machine")
  type?: "machine" | "fax" | "digit" = "machine";

  @doc("Optional per-detector tuning. Which fields apply depends on `type`; every field is optional and defaults are used when omitted.")
  params?: DetectorParams;
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
