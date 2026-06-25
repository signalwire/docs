import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.refer
//
// SIP REFER transfer. `device` is a discriminated union but only the `sip`
// variant is valid, modeled as a `@discriminator("type")` base + variant.
// ─────────────────────────────────────────────────────────────────────────────

@doc("Where to send a SIP call when transferring it with `calling.refer`.")
model ReferSipDeviceParams {
  @doc("SIP URI to transfer the call to, for example `userb@example.com`.")
  to: string;

  @doc("Username for authenticating against the destination SIP endpoint, if it requires credentials.")
  username?: string;

  @doc("Password for authenticating against the destination SIP endpoint, if it requires credentials.")
  password?: string;
}

@doc("Where to transfer the call. Set `type` to `sip` and supply the SIP destination in `params`.")
@discriminator("type")
model ReferDevice {
  @doc("The transfer destination type. Only `sip` is supported.")
  type: string;
}

@example(#{ type: "sip", params: #{ to: "userb@example.com", username: "foo", password: "bar" } })
model ReferSipDevice extends ReferDevice {
  @doc("Always `sip`.")
  type: "sip";

  params: ReferSipDeviceParams;
}

model ReferParams {
  ...CallAddress;

  @doc("Where to transfer the call. Only SIP destinations are supported (`type: \"sip\"`).")
  device: ReferDevice;

  @doc("HTTPS URL where SignalWire POSTs the outcome of the transfer.")
  status_url?: url;
}
