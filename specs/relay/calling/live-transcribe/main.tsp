import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/transcribe.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Transcribes a call to text in real time, optionally on both legs at once. Unlike
  `calling.transcribe`, results stream live to your `webhook` while the call is
  still in progress, and you can request an AI summary at the end. Use the same
  method to start, stop, or summarize by setting the matching `action`. Live
  results also arrive as `calling.call.transcribe` events.
  """)
@channel("calling.live_transcribe")
@summary("Start or stop live transcription on a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    action: #{ start: #{ lang: "en-US", direction: #["remote-caller"] } },
  },
  returnType: #{ code: "200", message: "Live transcription started" },
})
op liveTranscribe(...LiveTranscribeParams): LiveTranscribeResult | CallTranscribeEvent;
