import "../../../../_shared/webhook/decorator.tsp";
import "../../../types";

namespace SignalWireAPI.Fabric.SWMLWebhooks;

@summary("Inbound message media item")
@doc("A single MMS media attachment included on an inbound message.")
model InboundMessageMediaItem {
  @doc("URL to download the media file.")
  @example("https://example.com/media/abc123.jpg")
  url: url;

  @doc("MIME type of the media file.")
  @example("image/jpeg")
  content_type: string;

  @doc("File size in bytes.")
  @example(48213)
  size: int32;
}

@summary("Inbound message")
@doc("Information about the inbound message that triggered the SWML document fetch.")
model InboundMessageContext {
  @doc("Unique identifier for the inbound message.")
  @example("c2d3e4f5-a6b7-8901-cdef-234567890abc")
  message_id: uuid;

  @doc("The Project ID this message belongs to.")
  @example("b2c3d4e5-f6a7-8901-bcde-f12345678901")
  project_id: uuid;

  @doc("The Space ID this message belongs to.")
  @example("d3e4f5a6-b7c8-9012-defa-345678901bcd")
  space_id: uuid;

  @doc("Direction of the message. Always `inbound` for messages handled by an SWML messaging script.")
  @example("inbound")
  direction: "inbound";

  @doc("The kind of message.")
  @example("sms")
  type: "sms" | "mms";

  @doc("Phone number that sent the message.")
  @example("+15551231234")
  from: string;

  @doc("Phone number that received the message.")
  @example("+15553214321")
  to: string;

  @doc("The text content of the message. Null on media-only MMS where the carrier did not include a text body.")
  @example("Hello, I need help")
  body: string | null;

  @doc("MMS media attachments. Empty when the message has no attachments.")
  @example(#[])
  media: InboundMessageMediaItem[];

  @doc("Number of SMS segments the message body was split into.")
  @example(1)
  segments: int32;

  @doc("Timestamp in UTC (ISO 8601, seconds precision) of when the message was received.")
  @example(utcDateTime.fromISO("2024-01-15T10:30:00Z"))
  timestamp: utcDateTime;
}

@summary("SWML inbound message webhook")
@doc("""
  Payload sent by SignalWire to a SWML messaging webhook URL when an inbound SMS or MMS message arrives on a phone number configured with a SWML message handler. The same payload shape is also used when the SWML messaging `transfer` method targets an external URL — in that case, `params` carries the values supplied to the `transfer` step and `vars` carries the propagated runtime variables from the originating document.

  The webhook URL is expected to respond with the SWML document to execute for the inbound message.
  """)
model InboundMessageWebhookPayload {
  @doc("The inbound message that triggered this fetch.")
  message: InboundMessageContext;

  @doc("Script-scope variables propagated from the SWML document that issued a `transfer` step. Absent on the initial inbound-message fetch; present (possibly empty) on fetches driven by a `transfer` step inside a full-mode SWML document. Common keys include `request_result`, `request_response`, `request_response_code`, `request_response_body`, `reply_result`, and `reply_message_id`.")
  @example(#{
    request_result: "success",
    reply_result: "queued",
  })
  vars?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Parameters passed via a SWML messaging `transfer` step. An empty object on the initial document fetch.")
  @example(#{})
  params: {
    ...TypeSpec.Record<unknown>;
  };
}

@summary("Call header")
@doc("A single header associated with the call.")
model InboundCallHeader {
  @doc("The name of the header.")
  @example("X-Custom-Header")
  name: string;

  @doc("The value of the header.")
  @example("custom-value")
  value: string;
}

@summary("Inbound call SIP data")
@doc("SIP-specific data for SIP calls. Only present when `call.type` is `sip`.")
model InboundCallSipData {
  @doc("The host portion of the SIP request URI.")
  @example("yourdomain.com")
  sip_req_host: string;

  @doc("The full SIP request URI.")
  @example("destination@yourdomain.com")
  sip_req_uri: string;

  @doc("The user portion of the SIP request URI.")
  @example("destination")
  sip_req_user: string;

  @doc("The host portion of the SIP From header.")
  @example("example.com")
  sip_from_host: string;

  @doc("The full URI from the SIP From header.")
  @example("user@example.com")
  sip_from_uri: string;

  @doc("The user portion of the SIP From header.")
  @example("user")
  sip_from_user: string;

  @doc("The host portion of the SIP To header.")
  @example("yourdomain.com")
  sip_to_host: string;

  @doc("The full URI from the SIP To header.")
  @example("destination@yourdomain.com")
  sip_to_uri: string;

  @doc("The user portion of the SIP To header.")
  @example("destination")
  sip_to_user: string;

  @doc("The user portion of the SIP Contact header.")
  @example("user")
  sip_contact_user: string;

  @doc("The port from the SIP Contact header.")
  @example("5060")
  sip_contact_port: string;

  @doc("The full URI from the SIP Contact header.")
  @example("user@192.168.1.100:5060")
  sip_contact_uri: string;

  @doc("The host portion of the SIP Contact header.")
  @example("192.168.1.100")
  sip_contact_host: string;

  @doc("Additional parameters from the SIP Contact header.")
  @example(#{})
  sip_contact_params: {
    ...TypeSpec.Record<unknown>;
  };
}

@summary("Parent call")
@doc("The call that created this call. Present only when this call has a parent — for example, a leg created by a `connect` or transfer.")
model InboundCallParent {
  @doc("The device type of the parent call.")
  @example("phone")
  device_type: "sip" | "phone" | "webrtc";

  @doc("A unique identifier for the parent call.")
  @example("a1b2c3d4-1111-2222-3333-444455556666")
  call_id: string;

  @doc("A unique identifier for the node handling the parent call.")
  @example("a1b2c3d4-1111-2222-3333-444455556666")
  node_id: string;
}

@summary("Peer call")
@doc("The call this call is bridged to. Present only when this call has a peer.")
model InboundCallPeer {
  @doc("A unique identifier for the peer call.")
  @example("a1b2c3d4-1111-2222-3333-444455556666")
  call_id: string;

  @doc("A unique identifier for the node handling the peer call.")
  @example("a1b2c3d4-1111-2222-3333-444455556666")
  node_id: string;
}

@summary("Inbound call")
@doc("Information about the call that triggered the SWML document fetch.")
model InboundCallContext {
  @doc("A unique identifier for the call.")
  @example("c2d3e4f5-a6b7-8901-cdef-234567890abc")
  call_id: string;

  @doc("A unique identifier for the node handling the call.")
  @example("a1b2c3d4-1111-2222-3333-444455556666")
  node_id: string;

  @doc("A unique identifier for the current call segment.")
  @example("d3e4f5a6-b7c8-9012-defa-345678901bcd")
  segment_id: string;

  @doc("The tag you assigned to this call when it was created, if any.")
  @example("support-queue")
  tag?: string;

  @doc("The current state of the call.")
  @example("created")
  call_state: string;

  @doc("The direction of the call.")
  @example("inbound")
  direction: "inbound" | "outbound";

  @doc("The type of call.")
  @example("sip")
  type: "sip" | "phone" | "webrtc";

  @doc("The number/URI that initiated this call.")
  @example("sip:user@example.com")
  from: string;

  @doc("The number/URI of the destination of this call.")
  @example("sip:destination@yourdomain.com")
  to: string;

  @doc("The phone number that initiated this call. Present for phone calls (`type` is `phone`); SIP and WebRTC calls expose the originator through `from` instead.")
  @example("+12223334444")
  from_number?: string;

  @doc("The destination phone number of this call. Present for phone calls (`type` is `phone`); SIP and WebRTC calls expose the destination through `to` instead.")
  @example("+12223334445")
  to_number?: string;

  @doc("Set to `\"true\"` when this call won a parallel dial. Omitted otherwise.")
  @example("true")
  dial_winner?: "true";

  @doc("The headers associated with this call.")
  @example(#[])
  headers: InboundCallHeader[];

  @doc("The call that created this call. Present only when this call has a parent.")
  parent?: InboundCallParent;

  @doc("The call this call is bridged to. Present only when this call has a peer.")
  peer?: InboundCallPeer;

  @doc("SIP-specific data. Present only when `type` is `sip`.")
  sip_data?: InboundCallSipData;

  @doc("The Project ID this call belongs to.")
  @example("b2c3d4e5-f6a7-8901-bcde-f12345678901")
  project_id: uuid;

  @doc("The Space ID this call belongs to.")
  @example("d3e4f5a6-b7c8-9012-defa-345678901bcd")
  space_id: uuid;
}

@summary("SWML inbound call webhook")
@doc("""
  Payload sent by SignalWire to a SWML calling webhook URL when SWML is fetched for a call. This includes inbound calls arriving on a phone number configured with a SWML calling handler, and outbound REST-initiated calls that point at a SWML URL. The same payload shape is also used when the SWML calling `transfer` or `execute` method targets an external URL — in those cases, the `params` object carries the values supplied to that step.

  The webhook URL is expected to respond with the SWML document to execute for the call.
  """)
model InboundCallWebhookPayload {
  @doc("The call that triggered this fetch.")
  call: InboundCallContext;

  @doc("Script-scope variables for this call session. Empty on the initial document fetch.")
  @example(#{ user_selection: "1" })
  vars: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("""
    Environment variables available to this call's SWML document, which you can reference as `\${envs.<key>}`. Combines the variables you've configured at the account or project level with any `custom_variables` you passed on the outbound [Call commands](/docs/apis/rest/calls/call-commands) request.

    Keys are case-sensitive. When a `custom_variables` key exactly matches an account- or project-level variable, including case, the value from the request wins; if they differ only in case, both are kept as separate variables.
    """)
  @example(#{
    api_key: "<YOUR_API_KEY>",
    webhook_url: "https://example.com/webhook",
    id: "12345",
    case_number: "54321",
  })
  envs: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Parameters passed via a SWML calling `execute` or `transfer` step. An empty object on the initial document fetch.")
  @example(#{ department: "sales" })
  params: {
    ...TypeSpec.Record<unknown>;
  };
}
