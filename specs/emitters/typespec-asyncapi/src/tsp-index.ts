import { $bearerAuth, $channel, $channelPerCommand, $event, $rpcMethod, $server } from "./decorators.js";

export { $lib } from "./lib.js";

/** @internal */
export const $decorators = {
  "SignalWire.AsyncAPI": {
    server: $server,
    channel: $channel,
    channelPerCommand: $channelPerCommand,
    rpcMethod: $rpcMethod,
    event: $event,
    bearerAuth: $bearerAuth,
  },
};
