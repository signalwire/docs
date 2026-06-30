import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor, FRAMES } from "./host.js";

describe("examples — emitted verbatim (frames are authored in-spec)", () => {
  it("emits @opExample parameters/returnType verbatim onto the request and reply messages", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model SendParams { to: string; }
        model SendResult { code: string; message: string; }
        model SendRequest is JsonRpcRequest<"calling.send", SendParams>;
        @reply model SendReply is JsonRpcResponse<SendResult>;
        @channel("calling.send")
        @opExample(#{
          parameters: #{ jsonrpc: "2.0", id: "550e8400-e29b-41d4-a716-446655440000", method: "calling.send", params: #{ to: "+15551112222" } },
          returnType: #{ jsonrpc: "2.0", id: "550e8400-e29b-41d4-a716-446655440000", result: #{ code: "200", message: "OK" } },
        })
        op send(...SendRequest): SendReply;
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

  it("emits @example on an event model verbatim onto the event message", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model DialResult { code: string; }
        model StateData { call_state: "created" | "ended"; }
        @reply model DialReply is JsonRpcResponse<DialResult>;
        @summary("calling.call.state")
        @example(#{
          jsonrpc: "2.0",
          id: "550e8400-e29b-41d4-a716-446655440000",
          method: "signalwire.event",
          params: #{ event_type: "calling.call.state", params: #{ call_state: "created" } },
        })
        model CallStateEvent is SignalwireEvent<"calling.call.state", StateData>;
        @channel("calling.dial") op dial(): DialReply | CallStateEvent;
      }
    `);

    const ex = doc.components.messages.callStateEvent.examples[0].payload;
    strictEqual(ex.method, "signalwire.event");
    strictEqual(ex.params.event_type, "calling.call.state");
    strictEqual(ex.params.params.call_state, "created");
  });

  it("omits the examples key when an op has no example", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model SendResult { code: string; }
        @reply model SendReply is JsonRpcResponse<SendResult>;
        @channel("calling.send") op send(): SendReply;
      }
    `);
    strictEqual(doc.components.messages.callingSendRequest.examples, undefined);
  });
});
