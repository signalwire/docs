import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

@doc("""
  The runtime configuration returned for your connector. For a `freeswitch`
  target, this contains the SIP profile your connector should run with.
  """)
model Configuration {
  @doc("""
    The FreeSWITCH SIP profile, rendered as an XML document. It embeds the gateway
    credentials your connector needs, including a plaintext SIP gateway password —
    treat this value as a secret and handle it over a secure channel.
    """)
  @example("<profile name=\"signalwire\"><settings><param name=\"sip-ip\" value=\"10.10.0.2\"/></settings></profile>")
  profile: string;
}

@doc("The provisioning result payload, carrying the rendered connector configuration.")
@summary("Connector configuration payload")
model ConfigureResult {
  @doc("The rendered connector configuration.")
  configuration: Configuration;
}
