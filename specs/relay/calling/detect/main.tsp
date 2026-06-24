import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/detect.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// NOTE: no @opExample here — the required `detect: DetectConfig` is a @discriminator
// union, and TypeSpec value-checking does not narrow a discriminated base to its variant,
// so an inline frame example can't carry real `params`. The DetectMachine/DetectFax/
// DetectDigit variant models carry schema-level @example values instead.
@doc("""
  Start a detector on an active call to listen for an answering machine,
  a fax tone, or DTMF digits. You can run several detectors at once on the
  same call. This call returns right away with an acknowledgement; the actual
  detection outcome arrives asynchronously as `calling.call.detect` events
  keyed on your `control_id`, not in this result.
  """)
@channel("calling.detect")
@summary("Start a detector (machine/fax/digit)")
op detect(...DetectParams): DetectResult | CallDetectEvent;

@doc("Stop an active detector.")
@channel("calling.detect.stop")
@summary("Stop a detector")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "detect-1",
  },
  returnType: #{
    code: "200",
    message: "Stopping detect",
    control_id: "detect-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op detectStop(...DetectStopParams): DetectStopResult;
