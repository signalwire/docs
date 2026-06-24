import { $bearerAuth, $channel, $event, $globalEvents, $server } from "./decorators.js";

export { $lib } from "./lib.js";

/** @internal */
export const $decorators = {
  "SignalWire.AsyncAPI": {
    server: $server,
    channel: $channel,
    event: $event,
    globalEvents: $globalEvents,
    bearerAuth: $bearerAuth,
  },
};
