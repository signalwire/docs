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
  @example(false)
  beep?: boolean = false;

  @doc("Output file format. Default `mp3`.")
  @example("mp3")
  format?: "mp3" | "wav" | "mp4" = "mp3";

  @doc("Record the two call directions on separate channels. Default `false`.")
  @example(false)
  stereo?: boolean = false;

  @doc("Which audio direction(s) to capture. Default `speak`.")
  @example("speak")
  direction?: RecordAudioDirection = "speak";

  @doc("""
    Seconds to wait for speech before giving up. Defaults to `0` — continuous
    recording, which runs until the call ends or you send `calling.record.stop`.
    Set this together with `end_silence_timeout` for voicemail-style recording
    that stops on its own.
    """)
  @minValue(0)
  @example(0)
  initial_timeout?: float64 = 0;

  @doc("""
    Seconds of trailing silence before the recording auto-stops. Defaults to `0` —
    continuous recording. Set this together with `initial_timeout` for
    voicemail-style recording.
    """)
  @minValue(0)
  @example(0)
  end_silence_timeout?: float64 = 0;

  @doc("DTMF (touch-tone) digits that stop the recording. Default `#`.")
  @example("#")
  terminators?: string = "#";

  @doc("""
    Input sensitivity: `0` = hear nothing, `100` = hear everything. Default
    `44.0`.
    """)
  @minValue(0)
  @maxValue(100)
  @example(44.0)
  input_sensitivity?: float64 = 44.0;

  @doc("Maximum recording length, in seconds. Use `0` for no limit. Default `0`.")
  @minValue(0)
  @example(0)
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
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("What to record. Currently audio is the only option — set its parameters under `audio`.")
  record: RecordSpec;

  @doc("HTTPS URL that status events are POSTed to.")
  @example("https://example.com/webhooks/relay")
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
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether the paused stretch is dropped from the recording (`skip`) or kept as silence (`silence`). Default `skip`.")
  @example("skip")
  behavior?: RecordPauseBehavior = "skip";
}

model RecordResumeParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the recording with `calling.record`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model RecordStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the recording with `calling.record`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
