import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { parse } from "yaml";
import { asyncApiFor, outputsFor } from "./host.js";

describe("event routing via operation return type", () => {
  it("an @event in an op's return union renders as a receive op on that command's channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      @channelPerCommand
      namespace Relay.Calling {
        model PlayParams { node_id: string; }
        model PlayResult { code: string; }
        @event("calling.call.play") model CallPlayEvent { state: string; }
        @rpcMethod("calling.play") op play(...PlayParams): PlayResult | CallPlayEvent;
      }
    `);

    // response: canonical reply kept + render shim added
    deepStrictEqual(doc.operations.callingPlay.reply.messages, [
      { $ref: "#/channels/callingPlay/messages/callingPlayResponse" },
    ]);
    strictEqual(doc.operations.onCallingPlayResponse.action, "receive");

    // the event is a receive op on the command's own channel
    const evOp = doc.operations.onCallingPlayCallPlayEvent;
    strictEqual(evOp.action, "receive");
    strictEqual(evOp.title, "calling.call.play");
    deepStrictEqual(evOp.channel, { $ref: "#/channels/callingPlay" });
    strictEqual("callPlayEvent" in doc.channels.callingPlay.messages, true);

    // the response result is built ONLY from the non-event arm
    strictEqual(
      doc.components.schemas.CallingPlayResponse.properties.result.$ref,
      "#/components/schemas/PlayResult",
    );
    // event component message defined once
    strictEqual(typeof doc.components.messages.callPlayEvent, "object");
  });

  it("an event in two op returns appears on both channels but is defined once", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      @channelPerCommand
      namespace Relay.Calling {
        model FaxResult { code: string; }
        @event("calling.call.fax") model CallFaxEvent { direction: string; }
        @rpcMethod("calling.send_fax") op sendFax(): FaxResult | CallFaxEvent;
        @rpcMethod("calling.receive_fax") op receiveFax(): FaxResult | CallFaxEvent;
      }
    `);

    deepStrictEqual(doc.operations.onCallingSendFaxCallFaxEvent.channel, {
      $ref: "#/channels/callingSendFax",
    });
    deepStrictEqual(doc.operations.onCallingReceiveFaxCallFaxEvent.channel, {
      $ref: "#/channels/callingReceiveFax",
    });
    strictEqual("callFaxEvent" in doc.channels.callingSendFax.messages, true);
    strictEqual("callFaxEvent" in doc.channels.callingReceiveFax.messages, true);
    // component schema + message defined exactly once
    strictEqual(typeof doc.components.messages.callFaxEvent, "object");
    strictEqual(typeof doc.components.schemas.CallFaxEventFrame, "object");
  });

  it("an @event assigned to no op lands on the central 'Events' channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      @channelPerCommand
      namespace Relay.Calling {
        model PlayResult { code: string; }
        @event("calling.call.play") model CallPlayEvent { state: string; }
        @event("calling.error") model CallErrorEvent { code: string; }
        @rpcMethod("calling.play") op play(): PlayResult | CallPlayEvent;
      }
    `);

    // umbrella becomes the "Events" page; the unassigned error lands there
    strictEqual(doc.channels.calling.title, "Events");
    deepStrictEqual(doc.operations.onCallingCallErrorEvent.channel, { $ref: "#/channels/calling" });
    strictEqual(doc.operations.onCallingCallErrorEvent.title, "calling.error");
    // the play event is mapped to its command, NOT duplicated on the umbrella
    strictEqual("callPlayEvent" in doc.channels.calling.messages, false);
    strictEqual("callErrorEvent" in doc.channels.calling.messages, true);
  });

  it("response-receive-shim:false omits the shim but keeps the canonical reply", async () => {
    const outputs = await outputsFor(
      `
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model DialResult { code: string; }
        @rpcMethod("calling.dial") op dial(): DialResult;
      }
    `,
      { "response-receive-shim": false },
    );
    const doc = parse(outputs["asyncapi.yaml"]);
    strictEqual("onCallingDialResponse" in doc.operations, false);
    deepStrictEqual(doc.operations.callingDial.reply.messages, [
      { $ref: "#/channels/calling/messages/callingDialResponse" },
    ]);
  });
});
