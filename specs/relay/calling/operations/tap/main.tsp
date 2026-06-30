import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/tap.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingTap = "calling.tap";
const callingTapResponse = "${callingTap} response";

model TapRequest is JsonRpcRequest<typeof callingTap, TapParams>;
@extension("x-fern-display-name", callingTapResponse)
@reply model TapReply is JsonRpcResponse<TapResult>;

// NOTE: no @opExample here — the required `tap: TapConfig` and `device: TapDevice` are
// @discriminator unions, and TypeSpec value-checking does not narrow a discriminated base
// to its variant, so an inline frame example can't carry real `params`. The TapAudio /
// TapRtpDevice / TapWsDevice variant models carry schema-level @example values instead.
@doc("""
  Fork a copy of the call's audio and deliver it in real time to an external
  device over RTP or a WebSocket, while the call continues normally. Choose
  which side of the call to capture with `tap`, and where to send it with
  `device`; set a `codec` or `ptime` on the device to have the audio transcoded
  or resampled for you. The result echoes your `device` back as
  `source_device` with every field filled in, so the receiver knows exactly
  what is coming. Tap lifecycle events arrive as `calling.call.tap` events
  keyed on your `control_id`.
  """)
@channel(callingTap)
@summary("Tap call media to an external device")
@extension("x-fern-display-name", callingTap)
op tap(...TapRequest): TapReply | CallTapEvent;

const callingTapStop = "calling.tap.stop";
const callingTapStopResponse = "${callingTapStop} response";

model TapStopRequest is JsonRpcRequest<typeof callingTapStop, TapStopParams>;
@extension("x-fern-display-name", callingTapStopResponse)
@reply model TapStopReply is JsonRpcResponse<TapStopResult>;

@doc("Stop an active call tap.")
@channel(callingTapStop)
@summary("Stop a call tap")
@extension("x-fern-display-name", callingTapStop)
op tapStop(...TapStopRequest): TapStopReply;
