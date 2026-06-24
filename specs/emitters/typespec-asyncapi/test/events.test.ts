import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

describe("@event", () => {
  it("wraps event payload in the signalwire.event carrier + a receive op", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model DialResult { code: string; }
        @channel("calling.dial") op dial(): DialResult;

        model CallStateParams { node_id: string; call_state: "created" | "ended"; }
        @event("calling.call.state") model CallStateEvent { ...CallStateParams; }
      }
    `);

    // An event not returned by any op is a central event: in multi mode it gets its OWN
    // receive-only channel keyed by the event type, with a single receive op.
    const op = doc.operations.onCallingCallState;
    strictEqual(op.action, "receive");
    strictEqual(op.title, "calling.call.state");
    strictEqual(op.messages[0].$ref, "#/channels/callingCallState/messages/callStateEvent");
    strictEqual(doc.channels.callingCallState.title, "calling.call.state");

    const frame = doc.components.schemas.CallStateEventFrame;
    strictEqual(frame.properties.method.const, "signalwire.event");
    strictEqual(frame.properties.params.properties.event_type.const, "calling.call.state");
  });
});
