import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

// The JSON-RPC framing is now authored in-spec as base model templates; the emitter synthesizes
// nothing and emits these payloads verbatim.
const FRAMES = `
  model JsonRpcRequest<Method extends string, Params> {
    jsonrpc: "2.0"; id: string; method: Method; params: Params;
  }
  model JsonRpcResponse<Result> { jsonrpc: "2.0"; id: string; result: Result; }
  model SignalwireEvent<EventType extends string, Data> {
    jsonrpc: "2.0"; id: string; method: "signalwire.event";
    params: {
      event_type: EventType;
      event_channel?: string; timestamp?: float64; project_id?: string; space_id?: string;
      params: Data;
    };
  }
`;

describe("generic emitter — in-spec frames, @reply, unmarked = events", () => {
  it("maps an op to send+reply, and an unmarked return arm to a channel receive", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model DialParams { to_number: string; }
        model DialResult { code: string; message: string; }
        model CallStateData { call_id: string; call_state: "created" | "ended"; }

        model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
        @reply model DialReply is JsonRpcResponse<DialResult>;
        @summary("calling.call.state")
        model CallStateEvent is SignalwireEvent<"calling.call.state", CallStateData>;

        @channel("calling.dial")
        op dial(...DialRequest): DialReply | CallStateEvent;
      }
    `);

    // send op + reply
    const send = doc.operations.callingDial;
    strictEqual(send.action, "send");
    strictEqual(send.messages[0].$ref, "#/channels/callingDial/messages/callingDialRequest");
    strictEqual(send.reply.messages[0].$ref, "#/channels/callingDial/messages/callingDialResponse");

    // unmarked arm → a receive op on the SAME channel, labeled by @summary
    const recv = doc.operations.onCallingDialCallStateEvent;
    strictEqual(recv.action, "receive");
    strictEqual(recv.channel.$ref, "#/channels/callingDial");
    strictEqual(recv["x-fern-display-name"], "calling.call.state");

    // request/response message payloads are the AUTHORED frames (refs), not synthesized inline frames.
    // Follow the $ref rather than hardcoding the (namespace-qualified) component name.
    const schemaOf = (ref: string) => doc.components.schemas[ref.split("/").pop()!];
    // Our schema-emitter renders a string-literal type as a single-value `enum` (equivalent to `const`).
    const literal = (s: any) => (s.const !== undefined ? s.const : s.enum?.[0]);
    const reqRef = doc.components.messages.callingDialRequest.payload.$ref;
    const resRef = doc.components.messages.callingDialResponse.payload.$ref;
    strictEqual(reqRef.endsWith("DialRequest"), true);
    strictEqual(resRef.endsWith("DialReply"), true);

    // the request frame carries the wire method const from the spec template (not emitter-injected)
    const reqSchema = schemaOf(reqRef);
    strictEqual(literal(reqSchema.properties.method), "calling.dial");
    strictEqual(literal(reqSchema.properties.jsonrpc), "2.0");

    // the event frame carries event_type, lifted from the SignalwireEvent template literal
    const evRef = doc.components.messages.callStateEvent.payload.$ref;
    const evSchema = schemaOf(evRef);
    strictEqual(literal(evSchema.properties.method), "signalwire.event");
    strictEqual(literal(evSchema.properties.params.properties.event_type), "calling.call.state");
  });

  it("an op with no @reply arm emits no reply (fire-and-forget is valid AsyncAPI)", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Messaging {
        ${FRAMES}
        model FireParams { x: string; }
        model FireRequest is JsonRpcRequest<"messaging.fire", FireParams>;
        @channel("messaging.fire")
        op fire(...FireRequest): void;
      }
    `);
    const send = doc.operations.messagingFire;
    strictEqual(send.action, "send");
    strictEqual(send.reply, undefined);
  });
});
