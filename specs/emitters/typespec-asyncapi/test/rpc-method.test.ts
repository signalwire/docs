import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

export const SVC = `
  @service(#{ title: "Relay Calling" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  @channel("calling")
  namespace Relay.Calling {
    model DialParams { tag: string; }
    model DialResult { code: string; message: string; }
    @rpcMethod("calling.dial") op dial(...DialParams): DialResult;
  }
`;

describe("@channel", () => {
  it("emits a single channel addressed at the WS root", async () => {
    const { doc } = await asyncApiFor(SVC);
    strictEqual(doc.channels.calling.address, "/");
    deepStrictEqual(doc.channels.calling.servers, [{ $ref: "#/servers/production" }]);
  });
});

describe("@channel — multiple sub-services under one @service", () => {
  it("emits one channel per @channel sub-namespace, all bound to the single server", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "SignalWire Relay" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        @channel("calling")
        namespace Calling {
          model DialResult { code: string; }
          @rpcMethod("calling.dial") op dial(): DialResult;
          model StateParams { call_state: string; }
          @event("calling.call.state") model CallStateEvent { ...StateParams; }
        }
        @channel("messaging")
        namespace Messaging {
          model SendResult { code: string; }
          @rpcMethod("messaging.send") op send(): SendResult;
        }
      }
    `);
    // one server, one channel per sub-service
    deepStrictEqual(Object.keys(doc.servers), ["production"]);
    deepStrictEqual(Object.keys(doc.channels).sort(), ["calling", "messaging"]);
    // each method routed to its own channel
    deepStrictEqual(doc.operations.callingDial.channel, { $ref: "#/channels/calling" });
    deepStrictEqual(doc.operations.messagingSend.channel, { $ref: "#/channels/messaging" });
    // channels carry only their own messages (no cross-contamination)
    strictEqual("callingDialRequest" in doc.channels.calling.messages, true);
    strictEqual("messagingSendRequest" in doc.channels.messaging.messages, true);
    strictEqual("messagingSendRequest" in doc.channels.calling.messages, false);
    // central event (not returned by any op) → its own receive op on the owning channel
    strictEqual(doc.operations.onCallingCallStateEvent.action, "receive");
    deepStrictEqual(doc.operations.onCallingCallStateEvent.channel, { $ref: "#/channels/calling" });
    // both channels bound to the single shared server
    deepStrictEqual(doc.channels.calling.servers, [{ $ref: "#/servers/production" }]);
    deepStrictEqual(doc.channels.messaging.servers, [{ $ref: "#/servers/production" }]);
  });
});

describe("@channelPerCommand", () => {
  it("emits one channel per command (shared address '/'), with central events on the umbrella 'Events' channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      @channelPerCommand
      namespace Relay.Calling {
        model DialResult { code: string; }
        model PlayResult { code: string; }
        @rpcMethod("calling.dial") @summary("Dial out") op dial(): DialResult;
        @rpcMethod("calling.play") op play(): PlayResult;
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
    // the response render-shim: a receive op mirroring the response on the same channel
    strictEqual(doc.operations.onCallingDialResponse.action, "receive");
    deepStrictEqual(doc.operations.onCallingDialResponse.messages, [
      { $ref: "#/channels/callingDial/messages/callingDialResponse" },
    ]);
    // per-command channel gets WS bindings
    deepStrictEqual(doc.channels.callingDial.bindings, { ws: {} });

    // umbrella channel is the "Events" page holding central events (not commands)
    strictEqual(doc.channels.calling.title, "Events");
    deepStrictEqual(doc.operations.onCallingCallStateEvent.channel, { $ref: "#/channels/calling" });
    strictEqual("callStateEvent" in doc.channels.calling.messages, true);
    // commands are NOT on the umbrella channel
    strictEqual("callingDialRequest" in doc.channels.calling.messages, false);
  });
});

describe("@rpcMethod", () => {
  it("synthesizes request envelope, response envelope, send op, and reply", async () => {
    const { doc } = await asyncApiFor(SVC);

    const op = doc.operations.callingDial;
    strictEqual(op.action, "send");
    deepStrictEqual(op.channel, { $ref: "#/channels/calling" });
    deepStrictEqual(op.messages, [{ $ref: "#/channels/calling/messages/callingDialRequest" }]);
    deepStrictEqual(op.reply.messages, [
      { $ref: "#/channels/calling/messages/callingDialResponse" },
    ]);

    // response render-shim mirrors the response as a receive op (for renderers that ignore `reply`)
    const shim = doc.operations.onCallingDialResponse;
    strictEqual(shim.action, "receive");
    deepStrictEqual(shim.messages, [{ $ref: "#/channels/calling/messages/callingDialResponse" }]);

    const reqMsg = doc.components.messages.callingDialRequest;
    deepStrictEqual(reqMsg.correlationId, { location: "$message.payload#/id" });

    const reqSchema = doc.components.schemas.CallingDialRequest;
    strictEqual(reqSchema.properties.jsonrpc.const, "2.0");
    strictEqual(reqSchema.properties.method.const, "calling.dial");
    strictEqual(reqSchema.properties.params.$ref, "#/components/schemas/DialParams");

    const resSchema = doc.components.schemas.CallingDialResponse;
    strictEqual(resSchema.properties.result.$ref, "#/components/schemas/DialResult");
  });

  it("emits distinct operations/schemas/messages for multiple methods and a separate receive op per central event", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model DialResult { code: string; }
        model AnswerResult { code: string; }
        @rpcMethod("calling.dial") op dial(): DialResult;
        @rpcMethod("calling.answer") op answer(): AnswerResult;

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
    // 2 messages per method (req+resp) + 1 per event = 6 channel messages, none overwritten
    strictEqual(Object.keys(doc.channels.calling.messages).length, 6);
    // each central event gets its own labeled receive op (separate entries, not pooled)
    strictEqual(doc.operations.onCallingCallStateEvent.action, "receive");
    strictEqual(doc.operations.onCallingCallStateEvent.title, "calling.call.state");
    strictEqual(doc.operations.onCallingCallReferEvent.action, "receive");
    strictEqual(doc.operations.onCallingCallReferEvent.title, "calling.call.refer");
  });
});
