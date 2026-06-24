import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("A single active conference you can join.")
model Conference {
  @doc("The node hosting this conference. Use it as the `node_id` when you join.")
  node_id: string;

  @doc("The conference's UUID.")
  conference_id: string;

  @doc("Human-readable conference name (e.g. `Awesome Room!`).")
  name: string;

  @doc("The extension to dial to reach the conference.")
  extension: string;

  @doc("When the conference was created or last active, in seconds since the epoch (with fractional seconds).")
  timestamp: float64;
}

model ConferenceListResult {
  ...Result;

  @doc("The active conferences you can join.")
  data: Conference[];
}
