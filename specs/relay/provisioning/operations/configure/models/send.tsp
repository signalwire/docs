import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

@doc("The connector type. Currently only `freeswitch` is supported; additional connector types may be added in the future.")
union ConnectorTarget {
  string,

  @doc("A FreeSWITCH connector.")
  freeswitch: "freeswitch",
}

@doc("The target type, identity, and network endpoints of the connector requesting configuration.")
model ConfigureParams {
  @doc("The connector type to provision. Currently only `freeswitch` is supported.")
  @example("freeswitch")
  target: ConnectorTarget;

  @doc("The connector's local endpoint in `IP:PORT` form, e.g. `10.10.0.2:5060`.")
  @example("10.10.0.2:5060")
  local_endpoint: string;

  @doc("The connector's external (public) endpoint in `IP:PORT` form, e.g. `8.8.8.8:5060`.")
  @example("8.8.8.8:5060")
  external_endpoint: string;

  @doc("UUID of the Relay connector being configured.")
  @example("b6ef5331-dce8-4c56-890d-949039398361")
  relay_connector_id: string;
}
