import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/denoise.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Starts noise reduction on a call, filtering background noise out of the audio. Use this on noisy connections to improve clarity. Stop it later with `calling.denoise.stop`.")
@channel("calling.denoise")
@summary("Start call noise reduction")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Denoiser on" },
})
op denoise(...DenoiseParams): DenoiseResult | CallDenoiseEvent;

@doc("Stops noise reduction previously started with `calling.denoise` on a call.")
@channel("calling.denoise.stop")
@summary("Stop call noise reduction")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Denoiser off" },
})
op denoiseStop(...DenoiseStopParams): DenoiseStopResult;
