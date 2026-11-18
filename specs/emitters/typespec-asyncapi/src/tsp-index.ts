import { $bearerAuth, $channel, $reply, $server } from "./decorators.js";

export { $lib } from "./lib.js";

/** @internal */
export const $decorators = {
  "SignalWire.AsyncAPI": {
    server: $server,
    channel: $channel,
    reply: $reply,
    bearerAuth: $bearerAuth,
  },
};
