import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a domain application.")
model CreateDomainApplicationRequest {
  @doc("A string representing the friendly name for this domain application.")
  @example("Test App")
  name: string;

  @doc("A string representing the identifier portion of the domain application.")
  identifier: string;

  @doc("A string representing the user portion of the domain application. Default is '*'.")
  @example("helpdesk")
  user?: string;

  @doc("Specify how the domain application will handle calls.")
  call_handler: DomainAppCallHandler;

  @doc("A string representing the Relay topic to forward incoming calls to. Required when call_handler is relay_topic.")
  @example("office")
  call_relay_topic?: string;

  @doc("A string representing a URL to send status change messages to.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_topic_status_callback_url?: string;

  @doc("A string representing the Relay Application to forward incoming calls to. Required when call_handler is relay_application.")
  @example("my-relay-app")
  call_relay_application?: string;

  @doc("A string representing the LaML URL to access when a call is received. Required when call_handler is laml_webhooks.")
  @example("https://example.com/laml")
  call_request_url?: string;

  @doc("A string representing the HTTP method to use with call_request_url.")
  call_request_method?: "GET" | "POST";

  @doc("A string representing the LaML URL to access when the call to call_request_url fails.")
  @example("https://example.com/fallback")
  call_fallback_url?: string;

  @doc("A string representing the HTTP method to use with call_fallback_url.")
  call_fallback_method?: "GET" | "POST";

  @doc("A string representing a URL to send status change messages to.")
  @example("https://example.com/status")
  call_status_callback_url?: string;

  @doc("A string representing the HTTP method to use with call_status_callback_url.")
  call_status_callback_method?: "GET" | "POST";

  @doc("A string representing the ID of the LaML application to forward incoming calls to. Required when call_handler is laml_application.")
  @example("app-123456")
  call_laml_application_id?: string;

  @doc("A string representing the ID of the Video Room to forward incoming calls to. Required when call_handler is video_room.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_video_room_id?: uuid;

  @doc("A string representing the URL of the Relay script to execute when a call is received. Required when call_handler is relay_script.")
  @example("https://example.com/relay-script")
  call_relay_script_url?: string;

  @doc("A string representing the ID of the Dialogflow Agent to forward incoming calls to. Required when call_handler is dialogflow.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_dialogflow_agent_id?: uuid;

  @doc("A string representing the ID of the AI Agent to forward incoming calls to. Required when call_handler is ai_agent.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_ai_agent_id?: uuid;

  @doc("A string representing the ID of the Call Flow to forward incoming calls to. Required when call_handler is call_flow.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_flow_id?: uuid;

  @doc("A string representing the version of your Call Flow you'd like to use.")
  call_flow_version?: "working_copy" | "current_deployed";
}

@doc("Request body for updating a domain application.")
model UpdateDomainApplicationRequest {
  @doc("A string representing the friendly name for this domain application.")
  @example("Test App")
  name?: string;

  @doc("Specify how the domain application will handle calls.")
  call_handler?: DomainAppCallHandler;

  @doc("A string representing the Relay topic to forward incoming calls to.")
  @example("office")
  call_relay_topic?: string;

  @doc("A string representing a URL to send status change messages to.")
  @example("https://myapplication/handle_relay_callbacks")
  call_relay_topic_status_callback_url?: string;

  @doc("A string representing the Relay Application to forward incoming calls to.")
  @example("my-relay-app")
  call_relay_application?: string;

  @doc("A string representing the LaML URL to access when a call is received.")
  @example("https://example.com/laml")
  call_request_url?: string;

  @doc("A string representing the HTTP method to use with call_request_url.")
  call_request_method?: "GET" | "POST";

  @doc("A string representing the LaML URL to access when the call to call_request_url fails.")
  @example("https://example.com/fallback")
  call_fallback_url?: string;

  @doc("A string representing the HTTP method to use with call_fallback_url.")
  call_fallback_method?: "GET" | "POST";

  @doc("A string representing a URL to send status change messages to.")
  @example("https://example.com/status")
  call_status_callback_url?: string;

  @doc("A string representing the HTTP method to use with call_status_callback_url.")
  call_status_callback_method?: "GET" | "POST";

  @doc("A string representing the ID of the LaML application to forward incoming calls to.")
  @example("app-123456")
  call_laml_application_id?: string;

  @doc("A string representing the ID of the Video Room to forward incoming calls to.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_video_room_id?: uuid;

  @doc("A string representing the URL of the Relay script to execute when a call is received.")
  @example("https://example.com/relay-script")
  call_relay_script_url?: string;

  @doc("A string representing the ID of the Dialogflow Agent to forward incoming calls to.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_dialogflow_agent_id?: uuid;

  @doc("A string representing the ID of the AI Agent to forward incoming calls to.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_ai_agent_id?: uuid;

  @doc("A string representing the ID of the Call Flow to forward incoming calls to.")
  @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
  @format("uuid")
  call_flow_id?: uuid;

  @doc("A string representing the version of your Call Flow you'd like to use.")
  call_flow_version?: "working_copy" | "current_deployed";
}
