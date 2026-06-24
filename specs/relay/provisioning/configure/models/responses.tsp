import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

@doc("""
  The runtime configuration returned for your connector. For a `freeswitch`
  target, this contains the SIP profile your connector should run with.
  """)
model Configuration {
  @doc("The FreeSWITCH SIP profile, rendered as an XML document.")
  profile: string;
}

model ConfigureResult {
  ...Result;

  @doc("The rendered connector configuration.")
  configuration: Configuration;
}
