@service(#{ title: "Relay Kitchen Sink" })
@server("production", #{ host: "relay.signalwire.com", protocol: "wss", pathname: "/api/relay/wss" })
@bearerAuth("JWT")
namespace Relay;

namespace Relay.Calling {
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

  @channel("calling.dial")
  @summary("Dial outbound call(s); first to answer wins")
  op dial(...DialParams): DialResult;

  model CallStateParams {
    node_id: string;
    call_id: string;
    call_state: "created" | "ringing" | "answered" | "ending" | "ended";
  }

  @event("calling.call.state")
  model CallStateEvent {
    ...CallStateParams;
  }
}
