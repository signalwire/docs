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
model ConfigureResult {
  @doc("The rendered connector configuration.")
  configuration: Configuration;
}

@doc("""
  The result envelope for a provisioning request. The connector configuration is
  carried in the nested `result`.
  """)
model ConfigureExecuteResult {
  @doc("UUID of the node that requested the configuration.")
  @example("a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  requester_nodeid: string;

  @doc("UUID of the node that produced the configuration.")
  @example("f6e5d4c3-b2a1-0f9e-8d7c-6b5a4f3e2d1c")
  responder_nodeid: string;

  @doc("The provisioning result payload.")
  result: ConfigureResult;
}
