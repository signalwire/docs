import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

using SignalWire.AsyncAPI;

@TypeSpec.OpenAPI.info(#{ version: "2.4.0" })
@service(#{ title: "Relay Calling" })
@server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
namespace Relay;

namespace Relay.Calling {
  @channel("calling.ping") op ping(): { code: string; message: string; };
}
