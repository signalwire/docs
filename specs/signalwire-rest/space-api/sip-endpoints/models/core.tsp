import "../../../types";

using TypeSpec.Http;
using Types;

model SipEndpointPathID {
  @doc("Unique ID of the SIP endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

@doc("SIP endpoint model.")
model SipEndpoint {
  @doc("The unique identifier of the SIP endpoint.")
  @example("67075301-69b2-4fc3-8a2c-c95a69a5665e")
  @format("uuid")
  id: uuid;

  @doc("The username for the SIP endpoint.")
  @example("c3p0")
  username: string;

  @doc("Friendly Caller ID used as the CNAM when dialing a phone number or the From when dialing another SIP Endpoint.")
  @example("C-3P0")
  caller_id?: string;

  @doc("When dialing a PSTN phone number, you must send it From a number you have purchased or verified. send_as indicates which number this endpoint has set as its origination. random indicates it will randomly choose a purchased or verified number from within the project.")
  @example("random")
  send_as?: string;

  @doc("A list of encryption ciphers this endpoint will support.")
  ciphers?: string[];

  @doc("A list of codecs this endpoint will support.")
  codecs?: string[];

  @doc("A string representing whether connections to this endpoint require encryption or if encryption is optional. Possible values are default, required, optional.")
  @example("required")
  encryption?: "default" | "required" | "optional";

  @doc("What type of handler you want to run on inbound calls.")
  @example("ai_agent")
  call_handler?: "relay_context" | "relay_topic" | "relay_script" | "laml_webhooks" | "laml_application" | "dialogflow" | "video_room" | "call_flow" | "ai_agent";

  @doc("A string representing the LaML URL to access when a call is received. This is only used (and required) when call_handler is set to laml_webhooks.")
  call_request_url?: string;

  @doc("A string representing the HTTP method to use with call_request_url. Valid values are GET and POST.")
  @example("POST")
  call_request_method?: "GET" | "POST";

  @doc("A string representing the LaML URL to access when the call to call_request_url fails. This is only used (and required) when call_handler is set to laml_webhooks.")
  call_fallback_url?: string;

  @doc("A string representing the HTTP method to use with call_fallback_url. Valid values are GET and POST.")
  @example("POST")
  call_fallback_method?: "GET" | "POST";

  @doc("A string representing a URL to send status change messages to. This is only used (and required) when call_handler is set to laml_webhooks.")
  call_status_callback_url?: string;

  @doc("A string representing the HTTP method to use with call_status_callback_url. Valid values are GET and POST.")
  @example("POST")
  call_status_callback_method?: "GET" | "POST";

  @doc("A string representing the ID of the LaML application to forward incoming calls to. This is only used (and required) when call_handler is set to laml_application.")
  call_laml_application_id?: string;

  @doc("A string representing the Relay topic to forward incoming calls to. This is only used (and required) when call_handler is set to relay_topic.")
  @example("office")
  call_relay_topic?: string;

  @doc("A string representing a URL to send status change messages to. This is only used (and required) when call_handler is set to relay_topic.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_topic_status_callback_url?: string;

  @doc("A string representing the Relay context to forward incoming calls to. This is only used (and required) when call_handler is set to relay_context.")
  call_relay_context?: string;

  @doc("A string representing a URL to send status change messages to. This is only used (and required) when call_handler is set to relay_context.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_context_status_callback_url?: string;

  @doc("A string representing the ID of the Video Room to forward incoming calls to. This is only used (and required) when call_handler is set to video_room.")
  @format("uuid")
  call_video_room_id?: string;

  @doc("A string representing the ID of the Call Flow to forward incoming calls to. This is only used (and required) when call_handler is set to call_flow.")
  @format("uuid")
  call_flow_id?: string;

  @doc("A string representing the ID of the AI Agent to forward incoming calls to. This is only used (and required) when call_handler is set to ai_agent.")
  @format("uuid")
  call_ai_agent_id?: string;

  @doc("A string representing a URL of a SWML script to respond to incoming calls. This is only used (and required) when call_handler is set to relay_script.")
  @example("https://dev.signalwire.com/relay-bins/f9d13f68-f71e-4042-95bb-b07b9e2f2f92")
  call_relay_script_url?: string;
}
