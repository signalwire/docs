import "../../../types";

using TypeSpec.Http;

model SipEndpointPathID {
  @doc("Unique ID of a SIP Endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model SipEndpointID {
  @doc("Unique ID of a SIP Endpoint.")
  sip_endpoint_id: uuid
}

model SipEndpoint {
  @doc("Username for the SIP endpoint")
  @example("123456")
  username: string;

  @doc("Password for the SIP endpoint")
  @example("123456")
  password: string;

  @doc("Caller ID")
  @example("123456")
  caller_id: string;

  @doc("Send as")
  @example("random")
  send_as: string;

  @doc("Ciphers")
  @example(#["AEAD_AES_256_GCM_8"])
  ciphers: ("AEAD_AES_256_GCM_8" | "AES_256_CM_HMAC_SHA1_80" | "AES_CM_128_HMAC_SHA1_80" | "AES_256_CM_HMAC_SHA1_32" | "AES_CM_128_HMAC_SHA1_32")[];

  @doc("Codecs")
  @example(#["PCMU"])
  codecs: ("PCMU" | "PCMA" | "G722" | "G729" | "OPUS" | "VP8" | "H264")[];

  @doc("Encryption")
  @example("optional")
  encryption: "required" | "optional";

  @doc("Call handler")
  @example("laml_webhooks")
  call_handler: string;

  @doc("Call request URL")
  @format("uri")
  @example("https://example.com/call_handler")
  call_request_url: string;

  @doc("Call request method")
  @example("POST")
  call_request_method: "GET" | "POST";

  @doc("Call fallback URL")
  @format("uri")
  @example("https://example.com/call_handler")
  call_fallback_url?: string;

  @doc("Call fallback method")
  @example("POST")
  call_fallback_method?: "GET" | "POST";

  @doc("Call status callback URL")
  @format("uri")
  @example("https://example.com/call_handler")
  call_status_callback_url?: string;

  @doc("Call status callback method")
  @example("POST")
  call_status_callback_method?: "GET" | "POST";

  @doc("Call LAML application ID")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  call_laml_application_id?: uuid;

  @doc("Call AI agent ID")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  call_ai_agent_id?: uuid;

  @doc("Call flow ID")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  call_flow_id?: uuid;

  @doc("Call flow version")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  call_flow_version?: uuid;

  @doc("Call dialogflow agent ID")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  call_dialogflow_agent_id?: uuid;

  @doc("Call relay script URL")
  @format("uri")
  @example("https://example.com/relay_script")
  call_relay_script_url?: string;

  @doc("Call relay script method")
  @example("POST")
  call_relay_script_method?: "GET" | "POST";

  @doc("Calling handler resource ID")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  calling_handler_resource_id?: uuid;
}

model SipEndpointWithID {
  ...SipEndpointID,
  ...SipEndpoint
}