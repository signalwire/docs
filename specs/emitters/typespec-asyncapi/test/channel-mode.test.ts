import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { parse } from "yaml";
import { outputsFor } from "./host.js";

const SVC = `
  @service(#{ title: "SignalWire Relay" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  namespace Relay {
    namespace Calling {
      model DialResult { code: string; }
      @channel("calling.dial") op dial(): DialResult;
      model PlayResult { code: string; }
      @event("calling.call.play") model CallPlayEvent { state: string; }
      @channel("calling.play") op play(): PlayResult | CallPlayEvent;
      model StateParams { call_state: string; }
      @event("calling.call.state") model CallStateEvent { ...StateParams; }
    }
    namespace Messaging {
      model SendResult { code: string; }
      @channel("messaging.send") op send(): SendResult;
    }
  }
`;

describe("channel-mode: single", () => {
  it("collapses every service onto ONE channel with all methods as operations", async () => {
    const outputs = await outputsFor(SVC, { "channel-mode": "single" });
    const doc = parse(outputs["asyncapi.yaml"]);

    // exactly one channel, at the WS root address
    deepStrictEqual(Object.keys(doc.channels), ["relay"]);
    strictEqual(doc.channels.relay.address, "/");

    // methods from BOTH services are operations on the one channel
    deepStrictEqual(doc.operations.callingDial.channel, { $ref: "#/channels/relay" });
    deepStrictEqual(doc.operations.messagingSend.channel, { $ref: "#/channels/relay" });

    // reply retained; the response shim is its own labeled receive op on the one channel
    deepStrictEqual(doc.operations.callingDial.reply.channel, { $ref: "#/channels/relay" });
    strictEqual(doc.operations.onCallingDialResponse.action, "receive");
    deepStrictEqual(doc.operations.onCallingDialResponse.channel, { $ref: "#/channels/relay" });

    // command-bound event = its own receive op on the channel; central event likewise
    deepStrictEqual(doc.operations.onCallingPlayCallPlayEvent.messages, [
      { $ref: "#/channels/relay/messages/callPlayEvent" },
    ]);
    deepStrictEqual(doc.operations.onRelayCallStateEvent.channel, { $ref: "#/channels/relay" });
  });

  it("default (multi) mode keeps multiple channels", async () => {
    const outputs = await outputsFor(SVC, {});
    const doc = parse(outputs["asyncapi.yaml"]);
    strictEqual(Object.keys(doc.channels).length > 1, true);
  });

  it("single mode emits a shared event ONCE on the channel, not once per command", async () => {
    const outputs = await outputsFor(
      `
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        @globalEvents(Calling.CallStateEvent)
        namespace Calling {
          model DialResult { code: string; }
          model AnswerResult { code: string; }
          @event("calling.call.state") model CallStateEvent { call_state: string; }
          @channel("calling.dial") op dial(): DialResult;
          @channel("calling.answer") op answer(): AnswerResult;
        }
      }
    `,
      { "channel-mode": "single" },
    );
    const doc = parse(outputs["asyncapi.yaml"]);
    // the global event is attached to both dial and answer, but on the single shared channel it
    // must render once — exactly one receive op references callStateEvent
    const stateOps = Object.values(doc.operations).filter(
      (o: any) => o.action === "receive" && (o.messages || []).some((m: any) => m.$ref.endsWith("/messages/callStateEvent")),
    );
    strictEqual(stateOps.length, 1);
    strictEqual((stateOps[0] as any)["x-fern-display-name"], "calling.call.state");
  });
});
