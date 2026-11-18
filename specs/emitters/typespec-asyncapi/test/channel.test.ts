import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { $channel } from "../dist/src/decorators.js";
import { asyncApiFor, FRAMES, Tester } from "./host.js";

export const SVC = `
  @service(#{ title: "Relay Calling" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  namespace Relay;
  namespace Relay.Calling {
    ${FRAMES}
    model DialParams { tag: string; }
    model DialResult { code: string; message: string; }
    model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
    @reply model DialReply is JsonRpcResponse<DialResult>;
    @channel("calling.dial") op dial(...DialRequest): DialReply;
  }
`;

describe("@channel", () => {
  it("places each operation on its own channel addressed at the WS root", async () => {
    const { doc } = await asyncApiFor(SVC);
    strictEqual(doc.channels["calling.dial"].address, "/");
    strictEqual(doc.channels["calling.dial"].title, "calling.dial");
    deepStrictEqual(doc.channels["calling.dial"].servers, [{ $ref: "#/servers/production" }]);
  });
});

describe("@channel — multiple sub-services under one @service", () => {
  it("emits one channel per command across sub-namespaces, all bound to the single server", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "SignalWire Relay" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        ${FRAMES}
        namespace Calling {
          model DialParams { node_id: string; }
          model DialResult { code: string; }
          model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
          @reply model DialReply is JsonRpcResponse<DialResult>;
          model StateParams { call_state: string; }
          @summary("calling.call.state") model CallStateEvent is SignalwireEvent<"calling.call.state", StateParams>;
          @channel("calling.dial") op dial(...DialRequest): DialReply | CallStateEvent;
        }
        namespace Messaging {
          model SendParams { to: string; }
          model SendResult { code: string; }
          model SendRequest is JsonRpcRequest<"messaging.send", SendParams>;
          @reply model SendReply is JsonRpcResponse<SendResult>;
          @channel("messaging.send") op send(...SendRequest): SendReply;
        }
      }
    `);
    deepStrictEqual(Object.keys(doc.servers), ["production"]);
    // one channel per command (events ride their command's channel, not a separate channel)
    deepStrictEqual(Object.keys(doc.channels).sort(), ["calling.dial", "messaging.send"]);
    deepStrictEqual(doc.operations.callingDial.channel, { $ref: "#/channels/calling.dial" });
    deepStrictEqual(doc.operations.messagingSend.channel, { $ref: "#/channels/messaging.send" });
    // channels carry only their own messages (no cross-contamination)
    strictEqual("callingDialRequest" in doc.channels["calling.dial"].messages, true);
    strictEqual("messagingSendRequest" in doc.channels["messaging.send"].messages, true);
    strictEqual("messagingSendRequest" in doc.channels["calling.dial"].messages, false);
    // the unmarked return arm renders as a receive op on the command's channel
    strictEqual(doc.operations.onCallingDialCallStateEvent.action, "receive");
    deepStrictEqual(doc.operations.onCallingDialCallStateEvent.channel, { $ref: "#/channels/calling.dial" });
    // every channel bound to the single shared server
    deepStrictEqual(doc.channels["calling.dial"].servers, [{ $ref: "#/servers/production" }]);
    deepStrictEqual(doc.channels["messaging.send"].servers, [{ $ref: "#/servers/production" }]);
  });
});

describe("@channel — generic structural mapping (no synthesis)", () => {
  it("maps params→request message, @reply→reply, and emits the authored frames verbatim", async () => {
    const { doc } = await asyncApiFor(SVC);

    const op = doc.operations.callingDial;
    strictEqual(op.action, "send");
    deepStrictEqual(op.channel, { $ref: "#/channels/calling.dial" });
    deepStrictEqual(op.messages, [{ $ref: "#/channels/calling.dial/messages/callingDialRequest" }]);
    deepStrictEqual(op.reply.messages, [
      { $ref: "#/channels/calling.dial/messages/callingDialResponse" },
    ]);

    // response render-shim is its own labeled receive op (for renderers that ignore `reply`)
    const shim = doc.operations.onCallingDialResponse;
    strictEqual(shim.action, "receive");
    deepStrictEqual(shim.messages, [{ $ref: "#/channels/calling.dial/messages/callingDialResponse" }]);

    const reqMsg = doc.components.messages.callingDialRequest;
    deepStrictEqual(reqMsg.correlationId, { location: "$message.payload#/id" });

    // request payload is the authored request frame (a $ref), carrying the wire method const
    const reqRef = reqMsg.payload.$ref;
    strictEqual(reqRef.endsWith("DialRequest"), true);
    const reqSchema = doc.components.schemas[reqRef.split("/").pop()];
    const lit = (s: any) => (s.const !== undefined ? s.const : s.enum?.[0]);
    strictEqual(lit(reqSchema.properties.jsonrpc), "2.0");
    strictEqual(lit(reqSchema.properties.method), "calling.dial");

    // reply payload is the authored response frame
    const resRef = doc.components.messages.callingDialResponse.payload.$ref;
    strictEqual(resRef.endsWith("DialReply"), true);
  });

  it("emits distinct operations for multiple methods, each with its own channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model DialParams { node_id: string; }
        model AnswerParams { node_id: string; }
        model DialResult { code: string; }
        model AnswerResult { code: string; }
        model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
        model AnswerRequest is JsonRpcRequest<"calling.answer", AnswerParams>;
        @reply model DialReply is JsonRpcResponse<DialResult>;
        @reply model AnswerReply is JsonRpcResponse<AnswerResult>;
        @channel("calling.dial") op dial(...DialRequest): DialReply;
        @channel("calling.answer") op answer(...AnswerRequest): AnswerReply;
      }
    `);
    strictEqual(doc.operations.callingDial.action, "send");
    strictEqual(doc.operations.callingAnswer.action, "send");
    strictEqual(Object.keys(doc.channels["calling.dial"].messages).length, 2);
    strictEqual(Object.keys(doc.channels["calling.answer"].messages).length, 2);
  });
});

describe("@channel diagnostics", () => {
  it("errors when no operation is marked with @channel", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model R { code: string; }
        op dial(): R;
      }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("missing-channel")), true);
  });

  it("errors on duplicate @channel method names", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model R { code: string; }
        @channel("calling.dial") op dial(): R;
        @channel("calling.dial") op dialAgain(): R;
      }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("duplicate-channel")), true);
  });

  it("errors when @channel is applied to a non-operation", async () => {
    const { program } = await Tester.compile(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model R { code: string; }
        @channel("calling.dial") op dial(): R;
      }
    `);
    const before = program.diagnostics.length;
    const nonOp = program.getGlobalNamespaceType();
    $channel({ program } as any, nonOp as any, "calling.dial");
    const added = program.diagnostics.slice(before);
    strictEqual(added.some((d) => d.code.endsWith("channel-on-non-op")), true);
  });
});
