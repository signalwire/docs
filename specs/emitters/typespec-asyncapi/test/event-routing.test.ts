import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { parse } from "yaml";
import { asyncApiFor, outputsFor } from "./host.js";

describe("event routing via operation return type", () => {
  it("an @event in an op's return union renders as a receive op on that command's channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model PlayParams { node_id: string; }
        model PlayResult { code: string; }
        @event("calling.call.play") model CallPlayEvent { state: string; }
        @channel("calling.play") op play(...PlayParams): PlayResult | CallPlayEvent;
      }
    `);

    // response: canonical reply always kept
    deepStrictEqual(doc.operations.callingPlay.reply.messages, [
      { $ref: "#/channels/callingPlay/messages/callingPlayResponse" },
    ]);

    // one labeled receive op PER message on the command's channel: the event + (shim) the response
    const evOp = doc.operations.onCallingPlayCallPlayEvent;
    strictEqual(evOp.action, "receive");
    strictEqual(evOp["x-fern-display-name"], "calling.call.play");
    deepStrictEqual(evOp.channel, { $ref: "#/channels/callingPlay" });
    deepStrictEqual(evOp.messages, [{ $ref: "#/channels/callingPlay/messages/callPlayEvent" }]);
    const shim = doc.operations.onCallingPlayResponse;
    strictEqual(shim.action, "receive");
    strictEqual(shim["x-fern-display-name"], "calling.play response");
    strictEqual("callPlayEvent" in doc.channels.callingPlay.messages, true);

    // the response result is built ONLY from the non-event arm
    strictEqual(
      doc.components.schemas.CallingPlayResponse.properties.result.$ref,
      "#/components/schemas/Relay.Calling.PlayResult",
    );
    // event component message defined once
    strictEqual(typeof doc.components.messages.callPlayEvent, "object");
  });

  it("an event in two op returns appears on both channels but is defined once", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model FaxResult { code: string; }
        @event("calling.call.fax") model CallFaxEvent { direction: string; }
        @channel("calling.send_fax") op sendFax(): FaxResult | CallFaxEvent;
        @channel("calling.receive_fax") op receiveFax(): FaxResult | CallFaxEvent;
      }
    `);

    // the shared event gets its own labeled receive op on each command's channel
    deepStrictEqual(doc.operations.onCallingSendFaxCallFaxEvent.channel, {
      $ref: "#/channels/callingSendFax",
    });
    deepStrictEqual(doc.operations.onCallingReceiveFaxCallFaxEvent.channel, {
      $ref: "#/channels/callingReceiveFax",
    });
    deepStrictEqual(doc.operations.onCallingSendFaxCallFaxEvent.messages, [
      { $ref: "#/channels/callingSendFax/messages/callFaxEvent" },
    ]);
    strictEqual("callFaxEvent" in doc.channels.callingSendFax.messages, true);
    strictEqual("callFaxEvent" in doc.channels.callingReceiveFax.messages, true);
    // component schema + message defined exactly once
    strictEqual(typeof doc.components.messages.callFaxEvent, "object");
    strictEqual(typeof doc.components.schemas.CallFaxEventFrame, "object");
  });

  it("an @event assigned to no op gets its own receive-only channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model PlayResult { code: string; }
        @event("calling.call.play") model CallPlayEvent { state: string; }
        @event("calling.error") model CallErrorEvent { code: string; }
        @channel("calling.play") op play(): PlayResult | CallPlayEvent;
      }
    `);

    // the unassigned error becomes its own root-addressed receive-only channel
    strictEqual(doc.channels.callingError.title, "calling.error");
    strictEqual(doc.channels.callingError.address, "/");
    deepStrictEqual(doc.operations.onCallingError.channel, { $ref: "#/channels/callingError" });
    strictEqual(doc.operations.onCallingError.title, "calling.error");
    strictEqual("callErrorEvent" in doc.channels.callingError.messages, true);
    // the play event is mapped to its command's channel, NOT a central event channel
    strictEqual("callPlayError" in doc.channels, false);
    strictEqual("callPlayEvent" in doc.channels.callingPlay.messages, true);
  });

  it("@globalEvents are merged into every command's receive union, not a separate channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        @globalEvents(Calling.CallStateEvent, Calling.CallErrorEvent)
        namespace Calling {
          model DialResult { code: string; }
          model PlayResult { code: string; }
          @event("calling.call.play") model CallPlayEvent { state: string; }
          @event("calling.call.state") model CallStateEvent { call_state: string; }
          @event("calling.error") model CallErrorEvent { code: string; }
          @channel("calling.dial") op dial(): DialResult;
          @channel("calling.play") op play(): PlayResult | CallPlayEvent;
        }
      }
    `);

    // every command gets a labeled receive op for each global event…
    for (const cmd of ["onCallingDial", "onCallingPlay"]) {
      strictEqual(doc.operations[`${cmd}CallStateEvent`].action, "receive");
      strictEqual(doc.operations[`${cmd}CallStateEvent`]["x-fern-display-name"], "calling.call.state");
      strictEqual(doc.operations[`${cmd}CallErrorEvent`].action, "receive");
    }
    // play also keeps its own command-specific event op
    strictEqual(doc.operations.onCallingPlayCallPlayEvent.action, "receive");
    // the global events are referenced by commands, so they are NOT stranded on their own
    // central event channels
    strictEqual("callingCallState" in doc.channels, false);
    strictEqual("callingError" in doc.channels, false);
    strictEqual("onCallingCallState" in doc.operations, false);
  });

  it("an event defined in one service but attached to another service's op is not re-stranded centrally", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "SignalWire Relay" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        namespace Calling {
          model DialResult { code: string; }
          @event("calling.call.receive") model CallReceiveEvent { call_id: string; }
          @channel("calling.dial") op dial(): DialResult;
        }
        namespace Signalwire {
          model Ack { code: string; }
          @channel("signalwire.receive") op receive(): Ack | Relay.Calling.CallReceiveEvent;
        }
      }
    `);

    // the inbound event gets its own labeled receive op on the subscribing op's channel…
    deepStrictEqual(doc.operations.onSignalwireReceiveCallReceiveEvent.messages, [
      { $ref: "#/channels/signalwireReceive/messages/callReceiveEvent" },
    ]);
    // …and is NOT re-emitted as a stranded central event channel (two-pass, shared referenced
    // set across services)
    strictEqual("callingCallReceive" in doc.channels, false);
    strictEqual("onCallingCallReceive" in doc.operations, false);
  });

  it("response-receive-shim:false omits the shim but keeps the canonical reply", async () => {
    const outputs = await outputsFor(
      `
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model DialResult { code: string; }
        @channel("calling.dial") op dial(): DialResult;
      }
    `,
      { "response-receive-shim": false },
    );
    const doc = parse(outputs["asyncapi.yaml"]);
    // shim off + no events → no receive op at all; response lives only in the canonical reply
    strictEqual("onCallingDialResponse" in doc.operations, false);
    deepStrictEqual(doc.operations.callingDial.reply.messages, [
      { $ref: "#/channels/callingDial/messages/callingDialResponse" },
    ]);
  });
});
