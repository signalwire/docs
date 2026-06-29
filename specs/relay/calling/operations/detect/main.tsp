import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/detect.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DetectRequest is JsonRpcRequest<"calling.detect", DetectParams>;
@reply model DetectReply is JsonRpcResponse<DetectResult>;

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
op detect(...DetectRequest): DetectReply | CallDetectEvent;

model DetectStopRequest is JsonRpcRequest<"calling.detect.stop", DetectStopParams>;
@reply model DetectStopReply is JsonRpcResponse<DetectStopResult>;

@doc("Stop an active detector.")
@channel("calling.detect.stop")
@summary("Stop a detector")
op detectStop(...DetectStopRequest): DetectStopReply;
