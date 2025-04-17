model CXMLWebhookCreateRequest {
  @doc("Name of the CXML Webhook.")
  @example("My CXML Webhook")
  name?: string;

  @doc("Used for of the CXML Webhook.")
  @example("calling")
  used_for?: "calling" | "messaging" = "calling";

  @doc("Primary request url of the CXML Webhook.")
  @example("https://primary.com")
  primary_request_url: string;

  @doc("Primary request method of the CXML Webhook.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the CXML Webhook.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the CXML Webhook.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the CXML Webhook.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the CXML Webhook.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}

model CXMLWebhookUpdateRequest {
  @doc("Name of the CXML Webhook.")
  @example("My CXML Webhook")
  name?: string;

  @doc("Used for of the CXML Webhook.")
  @example("calling")
  used_for?: "calling" | "messaging" = "calling";

  @doc("Primary request url of the CXML Webhook.")
  @example("https://primary.com")
  primary_request_url?: string;

  @doc("Primary request method of the CXML Webhook.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the CXML Webhook.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the CXML Webhook.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the CXML Webhook.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the CXML Webhook.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}
