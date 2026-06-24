import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { $channel } from "../dist/src/decorators.js";
import { asyncApiFor, Tester } from "./host.js";

export const SVC = `
  @service(#{ title: "Relay Calling" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  namespace Relay;
  namespace Relay.Calling {
    model DialParams { tag: string; }
    model DialResult { code: string; message: string; }
    @channel("calling.dial") op dial(...DialParams): DialResult;
  }
`;

describe("@channel", () => {
  it("places each operation on its own channel addressed at the WS root", async () => {
    const { doc } = await asyncApiFor(SVC);
    // the method name camelizes to the channel id; the channel sits at the WS root
    strictEqual(doc.channels.callingDial.address, "/");
    strictEqual(doc.channels.callingDial.title, "calling.dial");
    deepStrictEqual(doc.channels.callingDial.servers, [{ $ref: "#/servers/production" }]);
  });
});

describe("@channel — multiple sub-services under one @service", () => {
  it("emits one channel per command across sub-namespaces, all bound to the single server", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "SignalWire Relay" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        namespace Calling {
          model DialResult { code: string; }
          @channel("calling.dial") op dial(): DialResult;
          model StateParams { call_state: string; }
          @event("calling.call.state") model CallStateEvent { ...StateParams; }
        }
        namespace Messaging {
          model SendResult { code: string; }
          @channel("messaging.send") op send(): SendResult;
        }
      }
    `);
    // one server; one channel per command + one per central event
    deepStrictEqual(Object.keys(doc.servers), ["production"]);
    deepStrictEqual(Object.keys(doc.channels).sort(), ["callingCallState", "callingDial", "messagingSend"]);
    // each method routed to its own channel
    deepStrictEqual(doc.operations.callingDial.channel, { $ref: "#/channels/callingDial" });
    deepStrictEqual(doc.operations.messagingSend.channel, { $ref: "#/channels/messagingSend" });
    // channels carry only their own messages (no cross-contamination)
    strictEqual("callingDialRequest" in doc.channels.callingDial.messages, true);
    strictEqual("messagingSendRequest" in doc.channels.messagingSend.messages, true);
    strictEqual("messagingSendRequest" in doc.channels.callingDial.messages, false);
    // central event (not returned by any op) → its own receive-only channel
    strictEqual(doc.operations.onCallingCallState.action, "receive");
    deepStrictEqual(doc.operations.onCallingCallState.channel, { $ref: "#/channels/callingCallState" });
    // every channel bound to the single shared server
    deepStrictEqual(doc.channels.callingDial.servers, [{ $ref: "#/servers/production" }]);
    deepStrictEqual(doc.channels.messagingSend.servers, [{ $ref: "#/servers/production" }]);
    deepStrictEqual(doc.channels.callingCallState.servers, [{ $ref: "#/servers/production" }]);
  });
});

describe("@channel — per-command channels are the multi-mode default", () => {
  it("emits one channel per command (shared address '/'), with central events on their own channels", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model DialResult { code: string; }
        model PlayResult { code: string; }
        @channel("calling.dial") @summary("Dial out") op dial(): DialResult;
        @channel("calling.play") op play(): PlayResult;
        model StateParams { call_state: string; }
        @event("calling.call.state") model CallStateEvent { ...StateParams; }
      }
    `);

    // each command is its own channel, all at the WS root address
    strictEqual(doc.channels.callingDial.address, "/");
    strictEqual(doc.channels.callingPlay.address, "/");
    deepStrictEqual(doc.channels.callingDial.servers, [{ $ref: "#/servers/production" }]);
    // @summary flows to the per-command channel description
    strictEqual(doc.channels.callingDial.description, "Dial out");
    // per-command channel carries only its own messages (no cross-contamination)
    strictEqual("callingDialRequest" in doc.channels.callingDial.messages, true);
    strictEqual("callingDialResponse" in doc.channels.callingDial.messages, true);
    strictEqual("callingPlayRequest" in doc.channels.callingDial.messages, false);
    // the send operation references its own per-command channel
    deepStrictEqual(doc.operations.callingDial.channel, { $ref: "#/channels/callingDial" });
    deepStrictEqual(doc.operations.callingDial.messages, [
      { $ref: "#/channels/callingDial/messages/callingDialRequest" },
    ]);
    // the send op keeps the canonical, correlated reply (standards-correct AsyncAPI 3.0)
    deepStrictEqual(doc.operations.callingDial.reply.messages, [
      { $ref: "#/channels/callingDial/messages/callingDialResponse" },
    ]);
    // the response render-shim is its own labeled receive op on the same channel (dial has no
    // events, so it's the only receive op)
    strictEqual(doc.operations.onCallingDialResponse.action, "receive");
    strictEqual(doc.operations.onCallingDialResponse["x-fern-display-name"], "calling.dial response");
    deepStrictEqual(doc.operations.onCallingDialResponse.messages, [
      { $ref: "#/channels/callingDial/messages/callingDialResponse" },
    ]);
    // per-command channel gets WS bindings
    deepStrictEqual(doc.channels.callingDial.bindings, { ws: {} });

    // the central event gets its OWN receive-only channel (not pooled onto a command channel)
    strictEqual(doc.channels.callingCallState.title, "calling.call.state");
    deepStrictEqual(doc.operations.onCallingCallState.channel, { $ref: "#/channels/callingCallState" });
    strictEqual("callStateEvent" in doc.channels.callingCallState.messages, true);
    // commands are NOT on the event channel
    strictEqual("callingDialRequest" in doc.channels.callingCallState.messages, false);
  });
});

describe("@channel — JSON-RPC envelope synthesis", () => {
  it("synthesizes request envelope, response envelope, send op, and reply", async () => {
    const { doc } = await asyncApiFor(SVC);

    const op = doc.operations.callingDial;
    strictEqual(op.action, "send");
    deepStrictEqual(op.channel, { $ref: "#/channels/callingDial" });
    deepStrictEqual(op.messages, [{ $ref: "#/channels/callingDial/messages/callingDialRequest" }]);
    deepStrictEqual(op.reply.messages, [
      { $ref: "#/channels/callingDial/messages/callingDialResponse" },
    ]);

    // response render-shim is its own labeled receive op (for renderers that ignore `reply`)
    const shim = doc.operations.onCallingDialResponse;
    strictEqual(shim.action, "receive");
    deepStrictEqual(shim.messages, [{ $ref: "#/channels/callingDial/messages/callingDialResponse" }]);

    const reqMsg = doc.components.messages.callingDialRequest;
    deepStrictEqual(reqMsg.correlationId, { location: "$message.payload#/id" });

    const reqSchema = doc.components.schemas.CallingDialRequest;
    strictEqual(reqSchema.properties.jsonrpc.const, "2.0");
    strictEqual(reqSchema.properties.method.const, "calling.dial");
    strictEqual(reqSchema.properties.params.$ref, "#/components/schemas/Relay.Calling.DialParams");

    const resSchema = doc.components.schemas.CallingDialResponse;
    strictEqual(resSchema.properties.result.$ref, "#/components/schemas/Relay.Calling.DialResult");
  });

  it("emits distinct operations/schemas/messages for multiple methods and a separate receive channel per central event", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model DialResult { code: string; }
        model AnswerResult { code: string; }
        @channel("calling.dial") op dial(): DialResult;
        @channel("calling.answer") op answer(): AnswerResult;

        model StateParams { call_state: string; }
        model ReferParams { sip_refer_to: string; }
        @event("calling.call.state") model CallStateEvent { ...StateParams; }
        @event("calling.call.refer") model CallReferEvent { ...ReferParams; }
      }
    `);

    // distinct send operations per method
    strictEqual(doc.operations.callingDial.action, "send");
    strictEqual(doc.operations.callingAnswer.action, "send");
    // distinct request schemas per method (no collision)
    strictEqual(typeof doc.components.schemas.CallingDialRequest, "object");
    strictEqual(typeof doc.components.schemas.CallingAnswerRequest, "object");
    // each command's own channel carries exactly its req+resp pair
    strictEqual(Object.keys(doc.channels.callingDial.messages).length, 2);
    strictEqual(Object.keys(doc.channels.callingAnswer.messages).length, 2);
    // each central event gets its own receive-only channel + labeled receive op
    strictEqual(doc.operations.onCallingCallState.action, "receive");
    strictEqual(doc.operations.onCallingCallState.title, "calling.call.state");
    strictEqual(doc.operations.onCallingCallRefer.action, "receive");
    strictEqual(doc.operations.onCallingCallRefer.title, "calling.call.refer");
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
    // The `extern dec channel(target: Operation, ...)` signature makes the compiler reject a
    // non-op target up front, so the decorator implementation's own guard is exercised by
    // invoking it directly against a non-operation type (here, the global namespace).
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
