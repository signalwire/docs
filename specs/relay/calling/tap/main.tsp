import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/tap.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// NOTE: no @opExample here — the required `tap: TapConfig` and `device: TapDevice` are
// @discriminator unions, and TypeSpec value-checking does not narrow a discriminated base
// to its variant, so an inline frame example can't carry real `params`. The TapAudio /
// TapRtpDevice / TapWsDevice variant models carry schema-level @example values instead.
/**
 * Fork a copy of the call's audio and deliver it in real time to an external
 * device over RTP or a WebSocket, while the call continues normally. Choose
 * which side of the call to capture with `tap`, and where to send it with
 * `device`; set a `codec` or `ptime` on the device to have the audio transcoded
 * or resampled for you. The result echoes your `device` back as
 * `source_device` with every field filled in, so the receiver knows exactly
 * what is coming. Tap lifecycle events arrive as `calling.call.tap` events
 * keyed on your `control_id`.
 */
@channel("calling.tap")
@summary("Tap call media to an external device")
op tap(...TapParams): TapResult | CallTapEvent;

/** Stop an active call tap. */
@channel("calling.tap.stop")
@summary("Stop a call tap")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "tap-1",
  },
  returnType: #{
    code: "200",
    message: "Stopping tap",
    control_id: "tap-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op tapStop(...TapStopParams): TapStopResult;
