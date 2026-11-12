import "../../_shared/enums.tsp";

model CXMLWebhookCreateRequest {
  @doc("Name of the CXML Webhook.")
  @example("My CXML Webhook")
  name?: string;

  @doc("Whether this CXML Webhook handles calls, messages, or faxes.")
  @example(CXMLWebhookScriptType.calling)
  script_type?: CXMLWebhookScriptType = CXMLWebhookScriptType.calling;

  #deprecated "Use script_type instead."
  @doc("Deprecated. Use `script_type`. Read only when `script_type` is not sent.")
  @example(CXMLWebhookScriptType.calling)
  used_for?: CXMLWebhookScriptType;

  @doc("Primary request url of the CXML Webhook.")
  @example("https://primary.com")
  primary_request_url: url;

  @doc("Primary request method of the CXML Webhook.")
  @example(RequestUrlMethodType.Get)
  primary_request_method?: RequestUrlMethodType = RequestUrlMethodType.Post;

  @doc("Fallback request url of the CXML Webhook.")
  @example("https://fallback.com")
  fallback_request_url?: url;

  @doc("Fallback request method of the CXML Webhook.")
  @example(RequestUrlMethodType.Get)
  fallback_request_method?: RequestUrlMethodType = RequestUrlMethodType.Post;

  @doc("Status callback url of the CXML Webhook.")
  @example("https://callback.com")
  status_callback_url?: url;

  @doc("Status callback method of the CXML Webhook.")
  @example(RequestUrlMethodType.Get)
  status_callback_method?: RequestUrlMethodType = RequestUrlMethodType.Post;
}

model CXMLWebhookUpdateRequest {
  @doc("Name of the CXML Webhook.")
  @example("My CXML Webhook")
  name?: string;

  @doc("Whether this CXML Webhook handles calls, messages, or faxes.")
  @example(CXMLWebhookScriptType.calling)
  script_type?: CXMLWebhookScriptType = CXMLWebhookScriptType.calling;

  #deprecated "Use script_type instead."
  @doc("Deprecated. Use `script_type`. Read only when `script_type` is not sent.")
  @example(CXMLWebhookScriptType.calling)
  used_for?: CXMLWebhookScriptType;

  @doc("Primary request url of the CXML Webhook.")
  @example("https://primary.com")
  primary_request_url?: url;

  @doc("Primary request method of the CXML Webhook.")
  @example(RequestUrlMethodType.Get)
  primary_request_method?: RequestUrlMethodType = RequestUrlMethodType.Post;

  @doc("Fallback request url of the CXML Webhook.")
  @example("https://fallback.com")
  fallback_request_url?: url;

  @doc("Fallback request method of the CXML Webhook.")
  @example(RequestUrlMethodType.Get)
  fallback_request_method?: RequestUrlMethodType = RequestUrlMethodType.Post;

  @doc("Status callback url of the CXML Webhook.")
  @example("https://callback.com")
  status_callback_url?: url;

  @doc("Status callback method of the CXML Webhook.")
  @example(RequestUrlMethodType.Post)
  status_callback_method?: RequestUrlMethodType = RequestUrlMethodType.Post;
}
