import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/record.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Records the audio of an active call. The result confirms recording started and the recording's URL arrives on a recording event when it finishes. You can run several recordings on the same call at once — give each its own `control_id`.")
@channel("calling.record")
@summary("Record a call")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
    record: #{
      audio: #{
        beep: false,
        format: "mp3",
        stereo: false,
        direction: "speak",
        initial_timeout: 5.0,
        end_silence_timeout: 1.0,
        terminators: "#*",
        input_sensitivity: 44.0,
      },
    },
    status_url: "https://example.com/recording-webhook",
  },
  returnType: #{
    code: "200",
    message: "Recording",
    control_id: "record-1",
    url: "https://example.com/recordings/record-1.mp3",
  },
})
op recordCall(...RecordParams): RecordResult | CallRecordEvent;

@doc("Pauses a recording you started with `calling.record`, identified by its `control_id`. Audio captured while paused is either dropped or kept as silence depending on `behavior`. Resume it later with `calling.record.resume`.")
@channel("calling.record.pause")
@summary("Pause an active recording")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
    behavior: "silence",
  },
  returnType: #{ code: "200", message: "Pausing recording", control_id: "record-1" },
})
op recordPause(...RecordPauseParams): RecordPauseResult;

@doc("Resumes a recording you paused with `calling.record.pause`, identified by its `control_id`. Audio capture picks back up where it left off.")
@channel("calling.record.resume")
@summary("Resume a paused recording")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
  },
  returnType: #{ code: "200", message: "Recording", control_id: "record-1" },
})
op recordResume(...RecordResumeParams): RecordResumeResult;

@doc("Stops a recording you started with `calling.record`, identified by its `control_id`. Once stopped, the recording is finalized and its URL becomes available on the recording event.")
@channel("calling.record.stop")
@summary("Stop an active recording")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
  },
  returnType: #{ code: "200", message: "Stopping recording", control_id: "record-1" },
})
op recordStop(...RecordStopParams): RecordStopResult;
