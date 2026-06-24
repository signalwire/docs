import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.denoise
// ─────────────────────────────────────────────────────────────────────────────

model CallDenoiseParams {
  ...CallAddress;

  /** Whether background noise reduction is now on (`true`) or off. */
  denoised: boolean;
}

/** Fires when background noise reduction is turned on or off for the call. Unlike most media events, this one carries no `control_id`. */
@event("calling.call.denoise")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  denoised: true,
})
model CallDenoiseEvent {
  ...CallDenoiseParams;
}
