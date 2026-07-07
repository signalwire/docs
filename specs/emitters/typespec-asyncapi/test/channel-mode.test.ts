import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { parse } from "yaml";
import { FRAMES, outputsFor } from "./host.js";

const SVC = `
  @service(#{ title: "SignalWire Relay" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  namespace Relay {
    ${FRAMES}
    namespace Calling {
      model DialParams { node_id: string; }
      model DialResult { code: string; }
      model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
      @reply model DialReply is JsonRpcResponse<DialResult>;
      model PlayParams { node_id: string; }
      model PlayResult { code: string; }
      model PlayRequest is JsonRpcRequest<"calling.play", PlayParams>;
      @reply model PlayReply is JsonRpcResponse<PlayResult>;
      model PlayData { state: string; }
      @summary("calling.call.play") model CallPlayEvent is SignalwireEvent<"calling.call.play", PlayData>;
      @channel("calling.dial") op dial(...DialRequest): DialReply;
      @channel("calling.play") op play(...PlayRequest): PlayReply | CallPlayEvent;
    }
    namespace Messaging {
      model SendParams { to: string; }
      model SendResult { code: string; }
      model SendRequest is JsonRpcRequest<"messaging.send", SendParams>;
      @reply model SendReply is JsonRpcResponse<SendResult>;
      @channel("messaging.send") op send(...SendRequest): SendReply;
    }
  }
`;

describe("channel-mode: single", () => {
  it("collapses every service onto ONE channel with all methods as operations", async () => {
    const outputs = await outputsFor(SVC, { "channel-mode": "single" });
    const doc = parse(outputs["asyncapi.yaml"]);

    deepStrictEqual(Object.keys(doc.channels), ["relay"]);
    strictEqual(doc.channels.relay.address, "/");

    deepStrictEqual(doc.operations.callingDial.channel, { $ref: "#/channels/relay" });
    deepStrictEqual(doc.operations.messagingSend.channel, { $ref: "#/channels/relay" });

    // reply retained; the response shim is its own labeled receive op on the one channel
    deepStrictEqual(doc.operations.callingDial.reply.channel, { $ref: "#/channels/relay" });
    strictEqual(doc.operations.onCallingDialResponse.action, "receive");
    deepStrictEqual(doc.operations.onCallingDialResponse.channel, { $ref: "#/channels/relay" });

    // a command-bound event = its own receive op on the shared channel
    deepStrictEqual(doc.operations.onCallingPlayCallPlayEvent.messages, [
      { $ref: "#/channels/relay/messages/callPlayEvent" },
    ]);
  });

  it("default (multi) mode keeps multiple channels", async () => {
    const outputs = await outputsFor(SVC, {});
    const doc = parse(outputs["asyncapi.yaml"]);
    strictEqual(Object.keys(doc.channels).length > 1, true);
  });

  it("single mode emits an event shared by two commands ONCE on the channel", async () => {
    const outputs = await outputsFor(
      `
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      namespace Relay {
        namespace Calling {
          ${FRAMES}
          model DialParams { node_id: string; }
          model AnswerParams { node_id: string; }
          model DialResult { code: string; }
          model AnswerResult { code: string; }
          model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
          model AnswerRequest is JsonRpcRequest<"calling.answer", AnswerParams>;
          @reply model DialReply is JsonRpcResponse<DialResult>;
          @reply model AnswerReply is JsonRpcResponse<AnswerResult>;
          model StateData { call_state: string; }
          @summary("calling.call.state") model CallStateEvent is SignalwireEvent<"calling.call.state", StateData>;
          @channel("calling.dial") op dial(...DialRequest): DialReply | CallStateEvent;
          @channel("calling.answer") op answer(...AnswerRequest): AnswerReply | CallStateEvent;
        }
      }
    `,
      { "channel-mode": "single" },
    );
    const doc = parse(outputs["asyncapi.yaml"]);
    // the event is listed on both dial and answer, but on the single shared channel it must
    // render once — exactly one receive op references callStateEvent
    const stateOps = Object.values(doc.operations).filter(
      (o: any) => o.action === "receive" && (o.messages || []).some((m: any) => m.$ref.endsWith("/messages/callStateEvent")),
    );
    strictEqual(stateOps.length, 1);
    strictEqual((stateOps[0] as any).title, "calling.call.state");
  });
});
