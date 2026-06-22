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
    // events routed to the owning channel's receive op
    strictEqual(doc.operations.onCallingEvent.action, "receive");
    deepStrictEqual(doc.operations.onCallingEvent.channel, { $ref: "#/channels/calling" });
    // both channels bound to the single shared server
    deepStrictEqual(doc.channels.calling.servers, [{ $ref: "#/servers/production" }]);
    deepStrictEqual(doc.channels.messaging.servers, [{ $ref: "#/servers/production" }]);
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

    const reqMsg = doc.components.messages.callingDialRequest;
    deepStrictEqual(reqMsg.correlationId, { location: "$message.payload#/id" });

    const reqSchema = doc.components.schemas.CallingDialRequest;
    strictEqual(reqSchema.properties.jsonrpc.const, "2.0");
    strictEqual(reqSchema.properties.method.const, "calling.dial");
    strictEqual(reqSchema.properties.params.$ref, "#/components/schemas/DialParams");

    const resSchema = doc.components.schemas.CallingDialResponse;
    strictEqual(resSchema.properties.result.$ref, "#/components/schemas/DialResult");
  });

  it("emits distinct operations/schemas/messages for multiple methods and one receive op for all events", async () => {
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
    // a single receive op carrying both events
    strictEqual(doc.operations.onCallingEvent.action, "receive");
    strictEqual(doc.operations.onCallingEvent.messages.length, 2);
  });
});
