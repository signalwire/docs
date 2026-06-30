import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/detect.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingDetect = "calling.detect";
const callingDetectResponse = "${callingDetect} response";

model DetectRequest is JsonRpcRequest<typeof callingDetect, DetectParams>;

@extension("x-fern-display-name", callingDetectResponse)
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
@channel(callingDetect)
@summary("Start a detector (machine/fax/digit)")
@extension("x-fern-display-name", callingDetect)
op detect(...DetectRequest): DetectReply | CallDetectEvent;

const callingDetectStop = "calling.detect.stop";
const callingDetectStopResponse = "${callingDetectStop} response";

model DetectStopRequest is JsonRpcRequest<typeof callingDetectStop, DetectStopParams>;

@extension("x-fern-display-name", callingDetectStopResponse)
@reply model DetectStopReply is JsonRpcResponse<DetectStopResult>;

@doc("Stop an active detector.")
@channel(callingDetectStop)
@summary("Stop a detector")
@extension("x-fern-display-name", callingDetectStop)
op detectStop(...DetectStopRequest): DetectStopReply;
