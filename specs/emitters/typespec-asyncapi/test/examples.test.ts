import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

describe("@opExample / @example → JSON-RPC frame examples", () => {
  it("wraps @opExample parameters/returnType into request and reply message frame examples", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model SendParams { to: string; }
        model SendResult { code: string; message: string; }
        @rpcMethod("calling.send")
        @opExample(#{ parameters: #{ to: "+15551112222" }, returnType: #{ code: "200", message: "OK" } })
        op send(...SendParams): SendResult;
      }
    `);

    const reqEx = doc.components.messages.callingSendRequest.examples[0].payload;
    strictEqual(reqEx.jsonrpc, "2.0");
    strictEqual(reqEx.method, "calling.send");
    strictEqual(reqEx.params.to, "+15551112222");

    const resEx = doc.components.messages.callingSendResponse.examples[0].payload;
    strictEqual(resEx.jsonrpc, "2.0");
    strictEqual(resEx.result.code, "200");
    strictEqual(resEx.result.message, "OK");
  });

  it("wraps @example on an event model into a signalwire.event carrier frame example", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model DialResult { code: string; }
        @rpcMethod("calling.dial") op dial(): DialResult;

        @event("calling.call.state")
        @example(#{ call_state: "created" })
        model CallStateEvent { call_state: "created" | "ended"; }
      }
    `);

    const ex = doc.components.messages.callStateEvent.examples[0].payload;
    strictEqual(ex.method, "signalwire.event");
    strictEqual(ex.params.event_type, "calling.call.state");
    strictEqual(ex.params.params.call_state, "created");
  });

  it("omits the examples key when an op has no @opExample", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model SendResult { code: string; }
        @rpcMethod("calling.send") op send(): SendResult;
      }
    `);
    strictEqual(doc.components.messages.callingSendRequest.examples, undefined);
  });
});
