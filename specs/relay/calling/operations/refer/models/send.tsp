import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Where to send a SIP call when transferring it with `calling.refer`.")
model ReferSipDeviceParams {
  @doc("SIP URI to transfer the call to. Must be a `sip:` or `sips:` URI, for example `sip:userb@example.com`.")
  @example("sip:userb@example.com")
  to: string;

  @doc("SIP URI for the referral From address; must begin with `sip:` or `sips:`.")
  @example("sip:alice@example.com")
  from?: string;

  @doc("Username for authenticating against the destination SIP endpoint, if it requires credentials.")
  @example("foo")
  username?: string;

  @doc("Password for authenticating against the destination SIP endpoint, if it requires credentials.")
  @example("bar")
  password?: string;
}

@doc("Where to transfer the call. Set `type` to `sip` and supply the SIP destination in `params`.")
@discriminator("type")
model ReferDevice {
  @doc("The transfer destination type. Only `sip` is supported.")
  type: "sip";
}

model ReferSipDevice extends ReferDevice {
  @doc("Always `sip`.")
  @example("sip")
  type: "sip";

  params: ReferSipDeviceParams;
}

model ReferParams {
  ...CallAddress;

  @doc("Where to transfer the call. Only SIP destinations are supported (`type: \"sip\"`).")
  device: ReferDevice;

  @doc("HTTPS URL where SignalWire POSTs the outcome of the transfer.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}
