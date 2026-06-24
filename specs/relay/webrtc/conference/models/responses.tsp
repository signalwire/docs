import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

/** A single active conference you can join. */
model Conference {
  /** The node hosting this conference. Use it as the `node_id` when you join. */
  node_id: string;

  /** The conference's UUID. */
  conference_id: string;

  /** Human-readable conference name (e.g. `Awesome Room!`). */
  name: string;

  /** The extension to dial to reach the conference. */
  extension: string;

  /** When the conference was created or last active, in seconds since the epoch (with fractional seconds). */
  timestamp: float64;
}

model ConferenceListResult {
  ...Result;

  /** The active conferences you can join. */
  data: Conference[];
}
