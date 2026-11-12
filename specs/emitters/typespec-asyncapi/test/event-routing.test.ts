import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { parse } from "yaml";
import { asyncApiFor, FRAMES, outputsFor } from "./host.js";

describe("event routing via operation return type", () => {
  it("an unmarked return arm renders as a receive op on that command's channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model PlayParams { node_id: string; }
        model PlayResult { code: string; }
        model PlayData { state: string; }
        model PlayRequest is JsonRpcRequest<"calling.play", PlayParams>;
        @reply model PlayReply is JsonRpcResponse<PlayResult>;
        @summary("calling.call.play") model CallPlayEvent is SignalwireEvent<"calling.call.play", PlayData>;
        @channel("calling.play") op play(...PlayRequest): PlayReply | CallPlayEvent;
      }
    `);

    // canonical reply always kept
    deepStrictEqual(doc.operations.callingPlay.reply.messages, [
      { $ref: "#/channels/calling.play/messages/callingPlayResponse" },
    ]);

    // one labeled receive op PER message on the command's channel: the event + (shim) the response
    const evOp = doc.operations.onCallingPlayCallPlayEvent;
    strictEqual(evOp.action, "receive");
    strictEqual(evOp.title, "calling.call.play");
    deepStrictEqual(evOp.channel, { $ref: "#/channels/calling.play" });
    deepStrictEqual(evOp.messages, [{ $ref: "#/channels/calling.play/messages/callPlayEvent" }]);
    const shim = doc.operations.onCallingPlayResponse;
    strictEqual(shim.action, "receive");
    strictEqual(shim.title, "calling.play response");
    strictEqual("callPlayEvent" in doc.channels["calling.play"].messages, true);

    // event component message defined once
    strictEqual(typeof doc.components.messages.callPlayEvent, "object");
  });

  it("an event in two op returns appears on both channels but is defined once", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model SendFaxParams { node_id: string; }
        model ReceiveFaxParams { node_id: string; }
        model FaxResult { code: string; }
        model FaxData { direction: string; }
        model SendFaxRequest is JsonRpcRequest<"calling.send_fax", SendFaxParams>;
        model ReceiveFaxRequest is JsonRpcRequest<"calling.receive_fax", ReceiveFaxParams>;
        @reply model FaxReply is JsonRpcResponse<FaxResult>;
        @summary("calling.call.fax") model CallFaxEvent is SignalwireEvent<"calling.call.fax", FaxData>;
        @channel("calling.send_fax") op sendFax(...SendFaxRequest): FaxReply | CallFaxEvent;
        @channel("calling.receive_fax") op receiveFax(...ReceiveFaxRequest): FaxReply | CallFaxEvent;
      }
    `);

    deepStrictEqual(doc.operations.onCallingSendFaxCallFaxEvent.channel, {
      $ref: "#/channels/calling.send_fax",
    });
    deepStrictEqual(doc.operations.onCallingReceiveFaxCallFaxEvent.channel, {
      $ref: "#/channels/calling.receive_fax",
    });
    deepStrictEqual(doc.operations.onCallingSendFaxCallFaxEvent.messages, [
      { $ref: "#/channels/calling.send_fax/messages/callFaxEvent" },
    ]);
    strictEqual("callFaxEvent" in doc.channels["calling.send_fax"].messages, true);
    strictEqual("callFaxEvent" in doc.channels["calling.receive_fax"].messages, true);
    // component message defined exactly once
    strictEqual(typeof doc.components.messages.callFaxEvent, "object");
  });

  it("an @error arm is a reply (error response), not a received event", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model DialParams { node_id: string; }
        model DialResult { code: string; }
        model DialErr { code: string; message: string; }
        model StateData { call_state: string; }
        model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
        @reply model DialReply is JsonRpcResponse<DialResult>;
        @error model DialError is JsonRpcResponse<DialErr>;
        @summary("calling.call.state") model CallStateEvent is SignalwireEvent<"calling.call.state", StateData>;
        @channel("calling.dial") op dial(...DialRequest): DialReply | DialError | CallStateEvent;
      }
    `);

    // both @reply and @error arms land in reply.messages (two reply messages)
    strictEqual(doc.operations.callingDial.reply.messages.length, 2);
    // the only received event is the unmarked CallStateEvent
    strictEqual(doc.operations.onCallingDialCallStateEvent.action, "receive");
    strictEqual("onCallingDialDialError" in doc.operations, false);
  });

  it("an event in no operation's return type is not emitted", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model DialParams { node_id: string; }
        model DialResult { code: string; }
        model OrphanData { x: string; }
        model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
        @reply model DialReply is JsonRpcResponse<DialResult>;
        @summary("calling.orphan") model OrphanEvent is SignalwireEvent<"calling.orphan", OrphanData>;
        @channel("calling.dial") op dial(...DialRequest): DialReply;
      }
    `);
    strictEqual("orphanEvent" in (doc.components.messages ?? {}), false);
    strictEqual("onCallingDialOrphanEvent" in doc.operations, false);
  });

  it("response-receive-shim:false omits the shim but keeps the canonical reply", async () => {
    const outputs = await outputsFor(
      `
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        ${FRAMES}
        model DialParams { node_id: string; }
        model DialResult { code: string; }
        model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
        @reply model DialReply is JsonRpcResponse<DialResult>;
        @channel("calling.dial") op dial(...DialRequest): DialReply;
      }
    `,
      { "response-receive-shim": false },
    );
    const doc = parse(outputs["asyncapi.yaml"]);
    // shim off + no events → no receive op at all; response lives only in the canonical reply
    strictEqual("onCallingDialResponse" in doc.operations, false);
    deepStrictEqual(doc.operations.callingDial.reply.messages, [
      { $ref: "#/channels/calling.dial/messages/callingDialResponse" },
    ]);
  });
});
