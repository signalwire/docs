import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

/**
 * The runtime configuration returned for your connector. For a `freeswitch`
 * target, this contains the SIP profile your connector should run with.
 */
model Configuration {
  /** The FreeSWITCH SIP profile, rendered as an XML document. */
  profile: string;
}

model ConfigureResult {
  ...Result;

  /** The rendered connector configuration. */
  configuration: Configuration;
}
