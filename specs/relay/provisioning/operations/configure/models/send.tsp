import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

@doc("The connector type being provisioned. Currently only `freeswitch` is supported.")
union ConnectorTarget {
  string,

  @doc("A FreeSWITCH connector.")
  freeswitch: "freeswitch",
}

model ConfigureParams {
  @doc("The connector type to provision. Currently only `freeswitch` is supported.")
  target: ConnectorTarget;

  @doc("The connector's local endpoint, as an IPv4 address, e.g. `10.10.0.2`.")
  local_endpoint: string;

  @doc("The connector's external (public) endpoint as an IPv4 address, e.g. `8.8.8.8`.")
  external_endpoint: string;

  @doc("UUID of the Relay connector being configured.")
  relay_connector_id: string;
}
