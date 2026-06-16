import { $channel, $event, $rpcMethod, $server } from "./decorators.js";

export { $lib } from "./lib.js";

/** @internal */
export const $decorators = {
  "SignalWire.AsyncAPI": {
    server: $server,
    channel: $channel,
    rpcMethod: $rpcMethod,
    event: $event,
  },
};
