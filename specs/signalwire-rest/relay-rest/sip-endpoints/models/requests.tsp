import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a SIP endpoint.")
model CreateSipEndpointRequest {
  @doc("String representing the username portion of the endpoint. Must be unique across your project and must not contain white space characters or @.")
  @example("c3p0")
  username: string;

  @doc("A password to authenticate registrations to this endpoint.")
  @example("yavinOrBust")
  password: string;

  @doc("Friendly Caller ID used as the CNAM when dialing a phone number or the From when dialing another SIP Endpoint.")
  @example("C-3P0")
  caller_id?: string;

  @doc("""
    The purchased or verified number, in E.164 format, to send as the From number when this endpoint
    dials a PSTN phone number. Set `random` to have SignalWire pick one purchased or verified number from
    the project. The pick happens once, when this request is processed, and that number is stored and
    returned in `send_as`; it is not re-chosen for each call. Omit it to use the SIP profile's
    `default_send_as`. Returns `422` when the number is not purchased or verified in the project, or
    when `random` is set and the project has no such number.
    """)
  @example("+15551234567")
  send_as?: string;

  @doc("A list of encryption ciphers this endpoint will support.")
  ciphers?: string[];

  @doc("A list of codecs this endpoint will support.")
  codecs?: string[];

  @doc("Specifies the encryption requirements for connections to this endpoint.")
  @example("required")
  encryption?: "default" | "required" | "optional";

  @doc("""
    How SignalWire handles calls this SIP endpoint places. `default` uses the SIP profile's
    `default_outbound_policy`. `passthrough` connects the call to the dialed destination, including PSTN
    numbers, and `block-pstn` does the same but blocks calls to PSTN numbers. The other values hand the
    call to the named handler. Responses return `laml_webhooks` as `laml_webhook` and `relay_topic` as
    `relay_context`.
    """)
  @example(SipEndpointCallHandlerRequest.ai_agent)
  call_handler?: SipEndpointCallHandlerRequest = SipEndpointCallHandlerRequest.default;

  @doc("The LaML URL to access when a call is received. Required when call_handler is laml_webhooks.")
  call_request_url?: string;

  @doc("The HTTP method to use with call_request_url.")
  @example("POST")
  call_request_method?: "GET" | "POST";

  @doc("The LaML URL to access when the call to call_request_url fails. Required when call_handler is laml_webhooks.")
  call_fallback_url?: string;

  @doc("The HTTP method to use with call_fallback_url.")
  @example("POST")
  call_fallback_method?: "GET" | "POST";

  @doc("A URL to send status change messages to. Required when call_handler is laml_webhooks.")
  call_status_callback_url?: string;

  @doc("The HTTP method to use with call_status_callback_url.")
  @example("POST")
  call_status_callback_method?: "GET" | "POST";

  @doc("The ID of the LaML application to forward incoming calls to. Required when call_handler is laml_application.")
  call_laml_application_id?: string;

  @doc("The ID of the Dialogflow agent to forward incoming calls to. Required when call_handler is dialogflow.")
  call_dialogflow_agent_id?: string;

  @doc("The Relay topic to forward incoming calls to. Required when call_handler is relay_topic.")
  @example("office")
  call_relay_topic?: string;

  @doc("A URL to send status change messages to. Required when call_handler is relay_topic.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_topic_status_callback_url?: string;

  @doc("The Relay context to forward incoming calls to. Required when call_handler is relay_context.")
  @example("office")
  call_relay_context?: string;

  @doc("A URL to send status change messages to. Required when call_handler is relay_context.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_context_status_callback_url?: string;

  @doc("The Relay application to forward incoming calls to. Required when call_handler is relay_application.")
  @example("my-relay-app")
  call_relay_application?: string;

  @doc("The ID of the Video Room to forward incoming calls to. Required when call_handler is video_room.")
  call_video_room_id?: uuid;

  @doc("The ID of the Call Flow to forward incoming calls to. Required when call_handler is call_flow.")
  call_flow_id?: uuid;

  @doc("The version of the Call Flow to use. Valid values are 'working_copy' or 'current_deployed'.")
  call_flow_version?: string;

  @doc("The ID of the AI Agent to forward incoming calls to. Required when call_handler is ai_agent.")
  call_ai_agent_id?: uuid;

  @doc("A URL of a SWML script to respond to incoming calls. Required when call_handler is relay_script.")
  @example("https://dev.signalwire.com/relay-bins/f9d13f68-f71e-4042-95bb-b07b9e2f2f92")
  call_relay_script_url?: string;
}

@doc("Request body for updating a SIP endpoint.")
model UpdateSipEndpointRequest {
  @doc("String representing the username portion of the endpoint. Must be unique across your project and must not contain white space characters or @.")
  @example("c3p0")
  username?: string;

  @doc("A password to authenticate registrations to this endpoint.")
  @example("yavinOrBust")
  password?: string;

  @doc("Friendly Caller ID used as the CNAM when dialing a phone number or the From when dialing another SIP Endpoint.")
  @example("C-3P0")
  caller_id?: string;

  @doc("""
    The purchased or verified number, in E.164 format, to send as the From number when this endpoint
    dials a PSTN phone number. Set `random` to have SignalWire pick one purchased or verified number from
    the project. The pick happens once, when this request is processed, and that number is stored and
    returned in `send_as`; it is not re-chosen for each call. Returns `422` when the number is not
    purchased or verified in the project, or when `random` is set and the project has no such number.
    """)
  @example("+15551234567")
  send_as?: string;

  @doc("A list of encryption ciphers this endpoint will support.")
  ciphers?: string[];

  @doc("A list of codecs this endpoint will support.")
  codecs?: string[];

  @doc("Specifies the encryption requirements for connections to this endpoint.")
  @example("required")
  encryption?: "default" | "required" | "optional";

  @doc("""
    How SignalWire handles calls this SIP endpoint places. `default` uses the SIP profile's
    `default_outbound_policy`. `passthrough` connects the call to the dialed destination, including PSTN
    numbers, and `block-pstn` does the same but blocks calls to PSTN numbers. The other values hand the
    call to the named handler. Responses return `laml_webhooks` as `laml_webhook` and `relay_topic` as
    `relay_context`.
    """)
  @example(SipEndpointCallHandlerRequest.ai_agent)
  call_handler?: SipEndpointCallHandlerRequest;

  @doc("The LaML URL to access when a call is received. Required when call_handler is laml_webhooks.")
  call_request_url?: string;

  @doc("The HTTP method to use with call_request_url.")
  @example("POST")
  call_request_method?: "GET" | "POST";

  @doc("The LaML URL to access when the call to call_request_url fails. Required when call_handler is laml_webhooks.")
  call_fallback_url?: string;

  @doc("The HTTP method to use with call_fallback_url.")
  @example("POST")
  call_fallback_method?: "GET" | "POST";

  @doc("A URL to send status change messages to. Required when call_handler is laml_webhooks.")
  call_status_callback_url?: string;

  @doc("The HTTP method to use with call_status_callback_url.")
  @example("POST")
  call_status_callback_method?: "GET" | "POST";

  @doc("The ID of the LaML application to forward incoming calls to. Required when call_handler is laml_application.")
  call_laml_application_id?: string;

  @doc("The ID of the Dialogflow agent to forward incoming calls to. Required when call_handler is dialogflow.")
  call_dialogflow_agent_id?: string;

  @doc("The Relay topic to forward incoming calls to. Required when call_handler is relay_topic.")
  @example("office")
  call_relay_topic?: string;

  @doc("A URL to send status change messages to. Required when call_handler is relay_topic.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_topic_status_callback_url?: string;

  @doc("The Relay context to forward incoming calls to. Required when call_handler is relay_context.")
  @example("office")
  call_relay_context?: string;

  @doc("A URL to send status change messages to. Required when call_handler is relay_context.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_context_status_callback_url?: string;

  @doc("The Relay application to forward incoming calls to. Required when call_handler is relay_application.")
  @example("my-relay-app")
  call_relay_application?: string;

  @doc("The ID of the Video Room to forward incoming calls to. Required when call_handler is video_room.")
  call_video_room_id?: uuid;

  @doc("The ID of the Call Flow to forward incoming calls to. Required when call_handler is call_flow.")
  call_flow_id?: uuid;

  @doc("The version of the Call Flow to use. Valid values are 'working_copy' or 'current_deployed'.")
  call_flow_version?: string;

  @doc("The ID of the AI Agent to forward incoming calls to. Required when call_handler is ai_agent.")
  call_ai_agent_id?: uuid;

  @doc("A URL of a SWML script to respond to incoming calls. Required when call_handler is relay_script.")
  @example("https://dev.signalwire.com/relay-bins/f9d13f68-f71e-4042-95bb-b07b9e2f2f92")
  call_relay_script_url?: string;
}
