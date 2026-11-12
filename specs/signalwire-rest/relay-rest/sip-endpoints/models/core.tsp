import "../../../types";

using TypeSpec.Http;
using Types;

model SipEndpointPathID {
  @doc("Unique ID of the SIP endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

@doc("Call handler to set on a SIP endpoint in create and update requests.")
enum SipEndpointCallHandlerRequest {
  default: "default",
  passthrough: "passthrough",
  block_pstn: "block-pstn",
  relay_context: "relay_context",
  relay_topic: "relay_topic",
  relay_application: "relay_application",
  relay_connector: "relay_connector",
  relay_script: "relay_script",
  laml_webhooks: "laml_webhooks",
  laml_application: "laml_application",
  dialogflow: "dialogflow",
  video_room: "video_room",
  call_flow: "call_flow",
  ai_agent: "ai_agent",
}

@doc("Call handler of a SIP endpoint, as returned in responses.")
enum SipEndpointCallHandler {
  default: "default",
  passthrough: "passthrough",
  block_pstn: "block-pstn",
  relay_context: "relay_context",
  relay_application: "relay_application",
  relay_connector: "relay_connector",
  relay_script: "relay_script",
  laml_webhook: "laml_webhook",
  laml_application: "laml_application",
  dialogflow: "dialogflow",
  video_room: "video_room",
  call_flow: "call_flow",
  ai_agent: "ai_agent",
}

@doc("SIP endpoint model.")
model SipEndpoint {
  @doc("A string representation of the type of object this record is.")
  @example("sip_endpoint")
  type: string;

  @doc("The unique identifier of the SIP endpoint.")
  @example("67075301-69b2-4fc3-8a2c-c95a69a5665e")
  id: uuid;

  @doc("The username for the SIP endpoint.")
  @example("c3p0")
  username: string;

  @doc("Friendly Caller ID used as the CNAM when dialing a phone number or the From when dialing another SIP Endpoint.")
  @example("C-3P0")
  caller_id: string | null;

  @doc("""
    The purchased or verified number this endpoint sends as its From number when dialing a PSTN phone
    number. When you set `send_as` to `random`, SignalWire picks one purchased or verified number from
    the project at the time of the request and stores it, so this field returns that number rather than
    `random`. When the endpoint has no `send_as` of its own, this field returns the SIP profile's
    `default_send_as`, which is `random` when that is not set either.
    """)
  @example("+15551234567")
  send_as: string;

  @doc("A list of encryption ciphers this endpoint will support.")
  ciphers: string[];

  @doc("A list of codecs this endpoint will support.")
  codecs: string[];

  @doc("Whether connections to this endpoint require encryption or if encryption is optional.")
  @example("required")
  encryption: "default" | "required" | "optional";

  @doc("""
    How SignalWire handles calls this SIP endpoint places. `default` uses the SIP profile's
    `default_outbound_policy`. `passthrough` connects the call to the dialed destination, including PSTN
    numbers, and `block-pstn` does the same but blocks calls to PSTN numbers. The other values hand the
    call to the named handler. A handler set as `laml_webhooks` is returned as `laml_webhook`, and one
    set as `relay_topic` is returned as `relay_context`.
    """)
  @example(SipEndpointCallHandler.ai_agent)
  call_handler: SipEndpointCallHandler | null;

  @doc("The unique identifier of the calling handler resource.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  calling_handler_resource_id: uuid | null;

  @doc("A string representing the LaML URL to access when a call is received. This is only used (and required) when call_handler is set to laml_webhooks.")
  call_request_url: string | null;

  @doc("A string representing the HTTP method to use with call_request_url. Valid values are GET and POST.")
  @example("POST")
  call_request_method: "GET" | "POST" | null;

  @doc("A string representing the LaML URL to access when the call to call_request_url fails. This is only used (and required) when call_handler is set to laml_webhooks.")
  call_fallback_url: string | null;

  @doc("A string representing the HTTP method to use with call_fallback_url. Valid values are GET and POST.")
  @example("POST")
  call_fallback_method: "GET" | "POST" | null;

  @doc("A string representing a URL to send status change messages to. This is only used (and required) when call_handler is set to laml_webhooks.")
  call_status_callback_url: string | null;

  @doc("A string representing the HTTP method to use with call_status_callback_url. Valid values are GET and POST.")
  @example("POST")
  call_status_callback_method: "GET" | "POST" | null;

  @doc("A string representing the ID of the LaML application to forward incoming calls to. This is only used (and required) when call_handler is set to laml_application.")
  call_laml_application_id: string | null;

  @doc("A string representing the ID of the Dialogflow agent to forward incoming calls to. This is only used (and required) when call_handler is set to dialogflow.")
  call_dialogflow_agent_id: string | null;

  @doc("A string representing the Relay topic to forward incoming calls to. This is only used (and required) when call_handler is set to relay_topic.")
  @example("office")
  call_relay_topic: string | null;

  @doc("A string representing a URL to send status change messages to. This is only used (and required) when call_handler is set to relay_topic.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_topic_status_callback_url: string | null;

  @doc("A string representing the Relay context to forward incoming calls to. This is only used (and required) when call_handler is set to relay_context.")
  call_relay_context: string | null;

  @doc("A string representing a URL to send status change messages to. This is only used (and required) when call_handler is set to relay_context.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_context_status_callback_url: string | null;

  @doc("A string representing the Relay application to forward incoming calls to. This is only used (and required) when call_handler is set to relay_application.")
  call_relay_application: string | null;

  @doc("A string representing the ID of the Video Room to forward incoming calls to. This is only used (and required) when call_handler is set to video_room.")
  call_video_room_id: uuid | null;

  @doc("A string representing a URL of a SWML script to respond to incoming calls. This is only used (and required) when call_handler is set to relay_script.")
  @example("https://dev.signalwire.com/relay-bins/f9d13f68-f71e-4042-95bb-b07b9e2f2f92")
  call_relay_script_url: string | null;
}
