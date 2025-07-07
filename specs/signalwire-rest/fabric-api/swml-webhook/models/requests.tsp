model SWMLWebhookCreateRequest {
  @doc("Name of the SWML Webhook.")
  @example("My SWML Webhook")
  name?: string;

  @doc("Used for of the SWML Webhook.")
  @example(UsedForType.Calling)
  used_for?: UsedForType.Calling = UsedForType.Calling;

  @doc("Primary request url of the SWML Webhook.")
  @example("https://primary.com")
  primary_request_url: string;

  @doc("Primary request method of the SWML Webhook.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the SWML Webhook.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the SWML Webhook.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the SWML Webhook.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the SWML Webhook.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}

model SWMLWebhookUpdateRequest {
  @doc("Name of the SWML Webhook.")
  @example("My SWML Webhook")
  name?: string;

  @doc("Used for of the SWML Webhook.")
  @example(UsedForType.Calling)
  used_for?: UsedForType.Calling = UsedForType.Calling;

  @doc("Primary request url of the SWML Webhook.")
  @example("https://primary.com")
  primary_request_url?: string;

  @doc("Primary request method of the SWML Webhook.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the SWML Webhook.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the SWML Webhook.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the SWML Webhook.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the SWML Webhook.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}
