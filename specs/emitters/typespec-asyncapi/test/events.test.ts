import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

describe("@event", () => {
  it("wraps event payload in the signalwire.event carrier + a receive op", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model DialResult { code: string; }
        @rpcMethod("calling.dial") op dial(): DialResult;

        model CallStateParams { node_id: string; call_state: "created" | "ended"; }
        @event("calling.call.state") model CallStateEvent { ...CallStateParams; }
      }
    `);

    // An event not returned by any op is a central event: its own receive op on the channel.
    const op = doc.operations.onCallingCallStateEvent;
    strictEqual(op.action, "receive");
    strictEqual(op.title, "calling.call.state");
    strictEqual(op.messages[0].$ref, "#/channels/calling/messages/callStateEvent");

    const frame = doc.components.schemas.CallStateEventFrame;
    strictEqual(frame.properties.method.const, "signalwire.event");
    strictEqual(frame.properties.params.properties.event_type.const, "calling.call.state");
  });
});
