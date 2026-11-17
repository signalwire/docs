@service(#{ title: "Relay Kitchen Sink" })
@server("production", #{ host: "relay.signalwire.com", protocol: "wss", pathname: "/api/relay/wss" })
@bearerAuth("JWT")
namespace Relay;

namespace Relay.Calling {
  // JSON-RPC framing is authored in-spec as base model templates; the emitter emits these
  // payloads verbatim and synthesizes nothing.
  model JsonRpcRequest<Method extends string, Params> {
    jsonrpc: "2.0";
    id: string;
    method: Method;
    params: Params;
  }
  model JsonRpcResponse<Result> {
    jsonrpc: "2.0";
    id: string;
    result: Result;
  }
  model SignalwireEvent<EventType extends string, Data> {
    jsonrpc: "2.0";
    id: string;
    method: "signalwire.event";
    params: {
      event_type: EventType;
      event_channel?: string;
      timestamp?: float64;
      project_id?: string;
      space_id?: string;
      params: Data;
    };
  }

  @discriminator("type")
  model Device {
    type: string;
  }
  model PhoneDevice extends Device {
    type: "phone";
    params: {
      from_number: string;
      to_number: string;
      @minValue(0) timeout?: int32 = 30;
    };
  }
  model SipDevice extends Device {
    type: "sip";
    params: {
      from: string;
      to: string;
    };
  }

  model DialParams {
    /** Identifier added to all call and dial events. */
    tag: string;
    region?: string;
    devices: Device[][];
  }
  model DialResult {
    code: string;
    message: string;
    call_id?: string;
    node_id?: string;
  }

  model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
  @reply model DialReply is JsonRpcResponse<DialResult>;

  model CallStateParams {
    node_id: string;
    call_id: string;
    call_state: "created" | "ringing" | "answered" | "ending" | "ended";
  }
  @summary("calling.call.state")
  model CallStateEvent is SignalwireEvent<"calling.call.state", CallStateParams>;

  @channel("calling.dial")
  @summary("Dial outbound call(s); first to answer wins")
  op dial(...DialRequest): DialReply | CallStateEvent;
}
