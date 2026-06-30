import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Which side of the conversation to capture in a recording.")
union RecordAudioDirection {
  @doc("Record what the remote party hears (audio sent to them).")
  "listen",

  @doc("Record what the remote party says (audio from them).")
  "speak",

  @doc("Record both sides of the conversation.")
  "both",
}

@doc("Audio recording settings, passed under `record.audio`.")
model RecordAudio {
  @doc("Play a beep before recording starts. Default `false`.")
  beep?: boolean = false;

  @doc("Output file format. Default `mp3`.")
  format?: "mp3" | "wav" = "mp3";

  @doc("Record the two call directions on separate channels. Default `false`.")
  stereo?: boolean = false;

  @doc("Which audio direction(s) to capture. Default `speak`.")
  direction?: RecordAudioDirection = "speak";

  @doc("""
    Seconds to wait until something is heard before giving up. Disable with `0`.
    Default `5.0`.
    """)
  @minValue(0)
  initial_timeout?: float64 = 5.0;

  @doc("""
    Seconds of silence to wait after the call party stops speaking before ending
    the recording. Disable with `0`. Default `1.0`.
    """)
  @minValue(0)
  end_silence_timeout?: float64 = 1.0;

  @doc("DTMF digits that end the recording. Default `#*`.")
  terminators?: string = "#*";

  @doc("""
    Input sensitivity: `0` = hear nothing, `100` = hear everything. Default
    `44`.
    """)
  @minValue(0)
  @maxValue(100)
  input_sensitivity?: float64 = 44.0;

  @doc("Maximum recording length, in seconds. Use `0` for no limit. Default `0`.")
  @minValue(0)
  max_length?: float64 = 0;
}

@doc("What to record. Audio is currently the only supported type — put its settings under `audio`.")
model RecordSpec {
  @doc("Audio recording settings.")
  audio: RecordAudio;
}

model RecordParams {
  ...CallAddress;

  @doc("Your own identifier for this recording. Use it to pause, resume, or stop the recording later, and it comes back on recording events so you can correlate them.")
  control_id: string;

  @doc("What to record. Currently audio is the only option — set its parameters under `audio`.")
  record: RecordSpec;

  @doc("HTTPS URL where SignalWire POSTs recording status updates.")
  status_url?: url;
}

@doc("How an active recording behaves while paused.")
union RecordPauseBehavior {
  @doc("Omit the paused span from the recording.")
  "skip",

  @doc("Include the paused span as silence in the recording.")
  "silence",
}

model RecordPauseParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the recording with `calling.record`.")
  control_id: string;

  @doc("Whether the paused stretch is dropped from the recording (`skip`) or kept as silence (`silence`). Default `skip`.")
  behavior?: RecordPauseBehavior = "skip";
}

model RecordResumeParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the recording with `calling.record`.")
  control_id: string;
}

model RecordStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the recording with `calling.record`.")
  control_id: string;
}
