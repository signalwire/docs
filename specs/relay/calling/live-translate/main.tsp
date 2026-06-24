import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Translates speech on a call into another language in real time and speaks it back,
  so two parties can talk across a language barrier. Translation streams live to your
  `webhook` and is voiced into the call. Use the same method to start, stop, summarize,
  or inject a message by setting the matching `action`.
  """)
@channel("calling.live_translate")
@summary("Start or stop live translation on a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    action: #{ start: #{ from_lang: "en-US", to_lang: "es-ES", direction: #["remote-caller"] } },
    status_url: "https://example.com/translate-callback",
  },
  returnType: #{ code: "200", message: "Live translation started" },
})
op liveTranslate(...LiveTranslateParams): LiveTranslateResult;
