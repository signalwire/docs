import "./core.tsp";
import "../../../_globally_shared/enums.tsp";

model SipEndpointCreateRequest {
  ...SipEndpoint
}

model SipEndpointUpdateRequest {
  @doc("Username for the SIP endpoint")
  @example("123456")
  username?: string;

  @doc("Password for the SIP endpoint")
  @example("12345678")
  @minLength(8)
  password?: string;

  @doc("Caller ID")
  @example("123456")
  caller_id?: string;

  @doc("Send as")
  @example("random")
  send_as?: string;

  @doc("Ciphers")
  @example(#[Ciphers.AEAD_AES_256_GCM_8])
  ciphers?: Ciphers[];

  @doc("Codecs")
  @example(#[Codecs.PCMU])
  codecs?: Codecs[];

  @doc("Encryption")
  @example(Encryption.Required)
  encryption?: Encryption;

  @doc("Call handler")
  @example("laml_webhooks")
  call_handler?: string;

  @doc("Call request URL")
  @example("https://example.com/call_handler")
  call_request_url?: string;

  @doc("Call request method")
  @example(UrlMethodType.Post)
  call_request_method?: UrlMethodType.Get | UrlMethodType.Post;

  @doc("Call fallback URL")
  @example("https://example.com/call_handler")
  call_fallback_url?: string;

  @doc("Call fallback method")
  @example(UrlMethodType.Post)
  call_fallback_method?: UrlMethodType.Get | UrlMethodType.Post;

  @doc("Call status callback URL")
  @example("https://example.com/call_handler")
  call_status_callback_url?: string;

  @doc("Call status callback method")
  @example(UrlMethodType.Post)
  call_status_callback_method?: UrlMethodType.Get | UrlMethodType.Post;

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
  @example("https://example.com/relay_script")
  call_relay_script_url?: string;

  @doc("Call relay script method")
  @example(UrlMethodType.Post)
  call_relay_script_method?: UrlMethodType.Get | UrlMethodType.Post;

  @doc("Calling handler resource ID")
  @format("uuid")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  calling_handler_resource_id?: uuid;
}